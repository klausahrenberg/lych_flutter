import 'dart:convert';

import 'package:reflectable/reflectable.dart';

import '../lych.dart';

abstract class LReflections {
  static Map<String, dynamic> toMap(Object o) {
    var map = <String, dynamic>{};
    var fields = getFieldsOfInstance(o, LObservable, {Json, Id, Lazy});
    for (var field in fields) {
      map[field.simpleName.toString()] = mirror(o).invokeGetter(field.simpleName);
    }
    return map;
  }

  static LObservable? createObservableForValue(dynamic value, [Type? observableType]) {
    if (observableType == LString) {
      return LString(value);
    } else if (observableType == LBoolean) {
      return LBoolean(value is String ? (value.toLowerCase() == "true") : value);
    } else if (observableType == LInteger) {
      return LInteger(value is String ? int.parse(value) : value);
    } else if (observableType == LDouble) {
      return LDouble(value is String ? double.parse(value) : value);
    } else if (observableType == LDatetime) {
      return LDatetime(value is String ? DateTime.parse(value) : value);
    } else {
      return LObservable(value);
    }
  }

  static String asString(dynamic o) {
    return "${o.runtimeType}${LJson.of(o).toString()}";
  }

  static String getName(ParameterMirror symbol) {
    return symbol.simpleName;
    //return MirrorSystem.getName(symbol);
  }

  static LObservable observable(Object o, String name, [InstanceMirror? im]) {
    im ??= mirror(o);
    return im.invokeGetter(name) as LObservable;
  }

  static void setValue(Object o, String name, Object value, [InstanceMirror? im]) {
    im ??= mirror(o);
    try {
      var field = im.invokeGetter(name);
      LObservable? obs;
      if (field == null) {
        obs = createObservableForValue(value);
        if (obs != null) {
          im.invokeSetter(name, obs);
        }
      } else if (field is LObservable) {
        obs = field;
      }
      if (obs != null) {
        obs.value = value;
      }
    } catch (ex) {
      LLog.error(LReflections, ex as Error);
    }
  }

  static Set<VariableMirror> getFieldsOfInstance(Object o, Type? requiredType, Iterable<LAnnotation> annotations) {
    var im = mirror(o);
    LLog.test(LReflections, "type is ${im.type}");
    return _getFields(mirror(o).type, requiredType, annotations);
  }

  static Set<VariableMirror> getFields(Type o, Type? requiredType, Iterable<LAnnotation> annotations) {
    return _getFields(mirrorClass(o), requiredType, annotations);
  }

  static Set<VariableMirror> _getFields(ClassMirror cm, Type? requiredType, Iterable<LAnnotation> annotations) {
    var result = <VariableMirror>{};
    TypeMirror? requiredTypeMirror = (requiredType != null ? mirrorType(requiredType) : null);
    for (final d in cm.declarations.values) {
      if ((d is VariableMirror) && (existsAnnotation(d, annotations))) {
        VariableMirror dvm = d;
        if ((requiredTypeMirror == null) || (dvm.type.isSubtypeOf(requiredTypeMirror))) {
          result.add(dvm);
        }
      }
    }
    return result;
  }

  static bool existsAnnotation(DeclarationMirror declarationMirror, Iterable<LAnnotation> annotations) {
    for (final a in annotations) {
      if (declarationMirror.metadata.contains(a)) {
        return true;
      }
    }
    return false;
  }

  static bool isId(VariableMirror field) {
    return existsAnnotation(field, {Id});
  }

  static bool isObservable(Type type) {
    return isSubtype(type, LObservable);
  }

  static bool isSubtype(Type subType, Type parentType) {
    try {
      return mirrorType(subType).isSubtypeOf(mirrorType(parentType));
    } catch (e) {
      return false;
    }
  }

  static ClassMirror mirrorClass(Type type) {
    return Reflect.reflectType(type) as ClassMirror;
  }

  static TypeMirror mirrorType(Type type) {
    return Reflect.reflectType(type);
  }

  static InstanceMirror mirror(dynamic reflectee) {
    return Reflect.reflect(reflectee);
  }

  static bool isEnum(Type type, [ClassMirror? cm]) {
    cm ??= mirrorClass(type);
    return cm.isEnum;
  }

  static List<dynamic> getEnums(Type type, [ClassMirror? cm]) {
    cm ??= mirrorClass(type);
    var result = List<dynamic>.empty(growable: true);
    for (var vm in cm.declarations.values) {
      if ((vm is VariableMirror) && (vm.type.reflectedType == type)) {
        result.add(cm.invokeGetter(vm.simpleName));
      }
    }
    return result;
  }

  static dynamic stringToEnum(String name, List<dynamic> enums) {
    name = name.toLowerCase();
    return enums.firstWhere((e) => (enumToString(e).toLowerCase() == name));
  }

  static String enumToString(dynamic e) {
    return e.toString().substring(e.runtimeType.toString().length + 1);
  }

  static dynamic _parseJson(Type type, dynamic input) {
    dynamic parsed;
    if (input is String) {
      parsed = jsonDecode(input);
    } else if (input is List) {
      parsed = input;
    } else {
      throw new UnsupportedError('The specified JSON input type is invalid.');
    }

    if (parsed is Map<String, dynamic>) {
      return newInstance(type, parsed);
    }

    List buffer = List.empty(growable: true);
    //List buffer = new List(parsed.length);
    for (int i = 0; i < parsed.length; i++) {
      buffer.add(newInstance(type, parsed[i]));
    }
    return buffer;
  }

  static dynamic newInstanceAltern(Type type, Map<String, dynamic> input) {
    final Map<String, ClassMirror> classes = <String, ClassMirror>{};
    for (ClassMirror classMirror in Reflect.annotatedClasses) {
      classes[classMirror.simpleName] = classMirror;
    }
    var cm = mirrorClass(type);
    for (var m in cm.declarations.values) {
      if (m is MethodMirror && m.isConstructor) {}
    }

    dynamic instance = cm.newInstance("", []);
    // Map values to the specified instance of the object.
    InstanceMirror instanceMirror = mirror(instance);
    input.forEach((k, v) {
      // This is a very ugly workaround since Dart has lots of limitations
      // regarding to types in Lists. Since we can only get a full name of a
      // List instance, we need to compare it to the declared reflectable
      // items. If we find a match, we get the type of that subtype of a List.
      var property = instanceMirror.invokeGetter(k);

      if (v is List) {
        classes.forEach((key, val) {
          if ('List<$key>' == property.runtimeType.toString()) {
            dynamic t = val.newInstance("", []);
            v = _parseJson(t.runtimeType, v);
          }
        });
      }

      // Decode base64, we can only check types using strings...
      if ('Uint8List' == property.runtimeType.toString()) {
        v = base64Decode(v);
      }

      instanceMirror.invokeSetter(k, v);
    });

    return instance;
  }

  static Type? _getTypeFromName(String typeName) {
    if (typeName == "String") {
      return String;
    }
    if (typeName == "int") {
      return int;
    }
    for (ClassMirror cm in Reflect.annotatedClasses) {
      if (cm.simpleName == typeName) {
        return cm.reflectedType;
      }
    }
    return null;
  }

  static bool _isPrimitiveType(Type requiredType) {
    return ((requiredType == String) || (requiredType == int) || (requiredType == double) || (requiredType == bool));
  }

  static dynamic _getValue(Type requiredType, dynamic value, ClassMirror cm, String fieldName) {
    LLog.test(LReflections, "getValue...");
    var pType = requiredType.toString();
    LLog.test(LReflections, "getValue....");
    if (LReflections.isObservable(requiredType)) {
      LLog.test(LReflections, "observab");
      value = createObservableForValue(value, requiredType);
      LLog.test(LReflections, "Observable for field $fieldName created: $value");
    } else if (value != null) {
      if (pType.startsWith("List<")) {
        LLog.test(LReflections, "list");
        pType = pType.substring(5, pType.length - 1);
        var rt = _getTypeFromName(pType);
        if (rt != null) {
          value = newList(rt, value, cm, fieldName);
        } else {
          LLog.test(LReflections, "No type for '$pType' found...");
        }
      } else if (pType.startsWith("Map<String, ")) {
        LLog.test(LReflections, "map");
        pType = pType.substring(12, pType.length - 1);
        var rt = _getTypeFromName(pType);
        if (rt != null) {
          value = newMap(rt, value, cm, fieldName);
        } else {
          LLog.test(LReflections, "No type for '$pType' found...");
        }
      } else if (_isPrimitiveType(requiredType)) {
        //nothing
        LLog.test(LReflections, "prim type");
      } else {
        LLog.test(LReflections, "not primitive, no list no map.. ${requiredType.toString()} ");
        var cmRequiredType = mirrorClass(requiredType);
        LLog.test(LReflections, "not primitive, no list no map.... ");
        if (isEnum(requiredType, cmRequiredType)) {
          LLog.test(LReflections, "enum.. ");
          value = stringToEnum(value, getEnums(requiredType, cmRequiredType));
        } else if (isObservable(requiredType)) {
          value = LReflections.createObservableForValue(value);
        }
      }
    } else {
      LLog.test(LReflections, "value is null");
    }
    return value;
  }

  static Object? newInstance<T>(Type toBeInstanciated, [Map<String, dynamic>? map]) {
    var cm = mirrorClass(toBeInstanciated);
    for (var m in cm.declarations.values) {
      if (m is VariableMirror) {}
    }
    //1.instanciate via parameters in constructor
    for (var m in cm.declarations.values) {
      if (m is MethodMirror && m.isConstructor) {
        var cList = <dynamic>[];
        var cNames = <String>[];
        for (var p in m.parameters) {
          var cName = LReflections.getName(p);
          LLog.test(LReflections, "cName $cName / ${p.reflectedType} ");
          cNames.add(cName);
          var value = _getValue(p.reflectedType, (map != null ? map[cName] : null), cm, cName);
          if (value == null) {
            throw Exception("Value '$cName' to create instance of type $toBeInstanciated is missing");
          }
          cList.add(value);
        }
        var insta = cm.newInstance("", cList);
        //2. tbi - set fields, which are not setted in constructor
        var im = LReflections.mirror(insta);
        map?.forEach((key, value) {
          if (!cNames.contains(key)) {
            var dm = cm.declarations[key];
            if (dm is VariableMirror) {
              var v = _getValue(dm.reflectedType, value, cm, key);
              im.invokeSetter(key, v);
            }
          }
        });
        return insta;
      }
    }
    return null;
  }

  static Object updateInstance(Object insta, Map<String, dynamic> map) {
    LLog.test(LReflections, "insta mirror..");
    var im = LReflections.mirror(insta);
    LLog.test(LReflections, "insta mirror ok");
    var cm = LReflections.mirrorClass(insta.runtimeType);
    LLog.test(LReflections, "insta mirrorClass ok");
    map.forEach((key, value) {
      LLog.test(LReflections, "key $key; value $value");
      var dm = cm.declarations[key];
      if (dm is VariableMirror) {
        LLog.test(LReflections, "key $key; value $value... / $dm / ${dm.reflectedType}");
        var v = _getValue(dm.reflectedType, value, cm, key);
        LLog.test(LReflections, "key $key; value $value after getValie");
        im.invokeSetter(key, v);
        LLog.test(LReflections, "key $key; value $value after invokeSette");
      }
    });
    LLog.test(LReflections, "..ok");
    return insta;
  }

  static List newList(Type itemType, List<dynamic> list, [ClassMirror? cm, String? memberName]) {
    List instances;
    if (itemType == String) {
      instances = List<String>.empty(growable: true);
    } else if (itemType == int) {
      instances = List<int>.empty(growable: true);
    } else if (itemType == double) {
      instances = List<double>.empty(growable: true);
    } else if (itemType == bool) {
      instances = List<bool>.empty(growable: true);
    } else if ((cm != null) && (memberName != null)) {
      try {
        instances = cm.invoke(memberName + "List", []) as List;
      } catch (ex) {
        instances = [];
        LLog.debug(LReflections, "Can't invoke map getter '${memberName}List()'. Please declare such a static method in class '${cm.simpleName}'");
      }
    } else {
      instances = List.empty(growable: true);
    }
    for (var i in list) {
      if (i is Map<String, dynamic>) {
        instances.add(newInstance(itemType, i));
      } else {
        instances.add(i);
      }
    }
    return instances;
  }

  static Map? newMap(Type itemType, Map<String, dynamic> map, ClassMirror cm, String memberName) {
    Map? instances;
    if (itemType == String) {
      instances = Map<String, String>();
    } else if (itemType == int) {
      instances = Map<String, int>();
    } else if (itemType == double) {
      instances = Map<String, double>();
    } else if (itemType == bool) {
      instances = Map<String, bool>();
    } else {
      try {
        instances = cm.invoke(memberName + "Map", []) as Map;
      } catch (ex) {
        LLog.debug(LReflections, "Can't invoke map getter '${memberName}Map()'. Please declare such a static method in class '${cm.simpleName}'");
      }
    }
    if (instances != null) {
      map.forEach((key, val) {
        if (val is Map<String, dynamic>) {
          instances![key] = newInstance(itemType, val);
        } else {
          instances![key] = val;
        }
      });
    }
    return instances;
  }
}

class LAnnotation {
  const LAnnotation();
}

class LJsonAnnotation extends LAnnotation {
  const LJsonAnnotation();
}

const LJsonAnnotation Json = LJsonAnnotation();

class LLazyAnnotation extends LAnnotation {
  const LLazyAnnotation();
}

const LLazyAnnotation Lazy = LLazyAnnotation();

class LIdAnnotation extends LAnnotation {
  const LIdAnnotation();
}

const LIdAnnotation Id = LIdAnnotation();

class LReflectAnnotation extends Reflectable {
  const LReflectAnnotation()
      : super(instanceInvokeCapability, staticInvokeCapability, metadataCapability, reflectedTypeCapability, newInstanceCapability, typeRelationsCapability,
            declarationsCapability);
}

const LReflectAnnotation Reflect = LReflectAnnotation();

import 'dart:convert';
import 'dart:core';
import 'package:reflectable/reflectable.dart';
import '../lych.dart';

class LJson {
  static const String BBEGIN = "[";
  static const String BEND = "]";
  static const String COMMA = ",";
  static const String DPOINT = ":";
  static const String SBEGIN = "{";
  static const String SEND = "}";
  static const String QUOTE = "\"";

  final StringBuffer stream = StringBuffer();
  bool separatorAlreadyCalled = false;
  bool firstElement = true;
  int tabLevel = 0;
  bool prettyFormatting = true;

  LJson();

  void _ifSeparator() {
    if (firstElement) {
      firstElement = false;
    } else {
      separator();
    }
  }

  void _lineBreak() {
    if (prettyFormatting) {
      stream.write("\n");
      for (int i = 0; i < tabLevel; i++) {
        stream.write("\t");
      }
    }
  }

  LJson separator() {
    stream.write(COMMA);
    _lineBreak();
    return this;
  }

  LJson memberName(String? name) {
    if ((name != null) && (name.isNotEmpty)) {
      writeString(name);
      if (prettyFormatting) {
        stream.write(" ");
      }
      stream.write(DPOINT);
      if (prettyFormatting) {
        stream.write(" ");
      }
    }
    return this;
  }

  LJson beginObject([String name = ""]) {
    if (!separatorAlreadyCalled) {
      _ifSeparator();
      separatorAlreadyCalled = true;
    }
    if (name.isNotEmpty) {
      memberName(name);
    }
    stream.write(SBEGIN);
    tabLevel++;
    _lineBreak();
    firstElement = true;
    return this;
  }

  LJson endObject() {
    tabLevel--;
    _lineBreak();
    stream.write(SEND);
    return this;
  }

  LJson beginArray([String name = ""]) {
    if (!separatorAlreadyCalled) {
      _ifSeparator();
      separatorAlreadyCalled = true;
    }
    firstElement = true;
    if (name.isNotEmpty) {
      memberName(name);
    }
    separatorAlreadyCalled = false;
    stream.write(BBEGIN);
    return this;
  }

  LJson endArray() {
    stream.write(BEND);
    return this;
  }

  LJson propertyInteger(String name, int value) {
    _ifSeparator();
    separatorAlreadyCalled = true;
    memberName(name);
    writeInteger(value);
    separatorAlreadyCalled = false;
    return this;
  }

  LJson writeInteger(int number) {
    if (!separatorAlreadyCalled) {
      _ifSeparator();
    }
    stream.write(number.toString());
    return this;
  }

  LJson propertyDouble(String name, double value) {
    _ifSeparator();
    separatorAlreadyCalled = true;
    memberName(name);
    writeDouble(value);
    separatorAlreadyCalled = false;
    return this;
  }

  LJson writeDouble(double number) {
    if (!separatorAlreadyCalled) {
      _ifSeparator();
    }
    stream.write(number.toString());
    return this;
  }

  LJson propertyBoolean(String name, bool value) {
    _ifSeparator();
    separatorAlreadyCalled = true;
    memberName(name);
    writeBoolean(value);
    separatorAlreadyCalled = false;
    return this;
  }

  LJson writeBoolean(bool value) {
    if (!separatorAlreadyCalled) {
      _ifSeparator();
    }
    stream.write(value.toString());
    return this;
  }

  LJson propertyString(String name, String? text) {
    _ifSeparator();
    separatorAlreadyCalled = true;
    memberName(name);
    writeString(text);
    separatorAlreadyCalled = false;
    return this;
  }

  LJson writeString(String? text) {
    if (text != null) {
      if (!separatorAlreadyCalled) {
        _ifSeparator();
      }
      stream.write(QUOTE);
      stream.write(text.replaceAll("\"", "\\\""));
      stream.write(QUOTE);
    } else {
      writeNull();
    }
    return this;
  }

  LJson propertyObject(String name, Object? o, {bool onlyId = false}) {
    _ifSeparator();
    separatorAlreadyCalled = true;
    memberName(name);
    if (o != null) {
      writeObject(o, onlyId: onlyId);
    } else {
      writeNull();
    }
    separatorAlreadyCalled = false;
    return this;
  }

  LJson writeObject(Object o, {bool onlyId = false}) {
    if (!separatorAlreadyCalled) {
      _ifSeparator();
    }
    _objectToJson(this, o, onlyId, tabLevel);
    return this;
  }

  LJson propertyMap(String? name, Map<String, dynamic> values) {
    _ifSeparator();
    separatorAlreadyCalled = true;
    memberName(name);
    writeMap(values);
    separatorAlreadyCalled = false;
    return this;
  }

  LJson writeMap(Map<String, dynamic> values) {
    if (!separatorAlreadyCalled) {
      _ifSeparator();
    }
    stream.write(SBEGIN);
    tabLevel++;
    var itc = values.entries.iterator;
    var itStart = true;

    while (itc.moveNext()) {
      MapEntry<String, dynamic> mi = itc.current;
      if (!itStart) {
        stream.write(COMMA);
        if (prettyFormatting) {
          stream.write(" ");
        }
      } else {
        itStart = false;
      }
      if (mi.value.runtimeType == String) {
        propertyString(mi.key, mi.value as String);
      } else if (mi.value.runtimeType == int) {
        propertyInteger(mi.key, mi.value as int);
      } else if (mi.value.runtimeType == double) {
        propertyDouble(mi.key, mi.value as double);
      } else if (mi.value.runtimeType == bool) {
        propertyBoolean(mi.key, mi.value as bool);
      } else {
        this.firstElement = true;
        _lineBreak();
        propertyObject(mi.key, mi.value);
      }
    }
    tabLevel--;
    _lineBreak();
    stream.write(SEND);
    return this;
  }

  LJson propertyArray(String? name, List values) {
    _ifSeparator();
    separatorAlreadyCalled = true;
    memberName(name);
    writeArray(values);
    separatorAlreadyCalled = false;
    return this;
  }

  LJson writeArray(List values) {
    if (!separatorAlreadyCalled) {
      _ifSeparator();
    }
    stream.write(BBEGIN);
    var itc = values.iterator;
    var itStart = true;
    while (itc.moveNext()) {
      var ci = itc.current;
      if (!itStart) {
        stream.write(COMMA);
        if (prettyFormatting) {
          stream.write(" ");
        }
      } else {
        itStart = false;
      }
      separatorAlreadyCalled = true;
      if (ci.runtimeType == String) {
        writeString(ci);
      } else if (ci.runtimeType == int) {
        writeInteger(ci);
      } else if (ci.runtimeType == double) {
        writeDouble(ci);
      } else if (ci.runtimeType == bool) {
        writeBoolean(ci);
      } else {
        writeObject(ci, onlyId: false);
      }
    }
    stream.write(BEND);
    return this;
  }

  LJson propertyNull(String name) {
    _ifSeparator();
    separatorAlreadyCalled = true;
    memberName(name);
    writeNull();
    separatorAlreadyCalled = false;
    return this;
  }

  LJson writeNull() {
    if (!separatorAlreadyCalled) {
      _ifSeparator();
    }
    stream.write("null");
    return this;
  }

  @override
  String toString() {
    return stream.toString();
  }

  static LJson empty() {
    return LJson();
  }

  static LJson of(Object o, [bool onlyId = false, int tabLevel = 0, bool prettyFormatting = false]) {
    var json = LJson();
    json.prettyFormatting = prettyFormatting;
    if (o is List) {
      json.propertyArray(null, o);
    } else if (o is Map<String, dynamic>) {
      json.propertyMap(null, o);
    } else {
      _objectToJson(json, o, onlyId, tabLevel);
    }
    return json;
  }

  static dynamic parsePayload(Type t, String payload) {
    var js = jsonDecode(payload);
    if (js is Map<String, dynamic>) {
      return LReflections.newInstance(t, js);
    } else if (js is List) {
      return LReflections.newList(t, js);
    }
  }

  static void _objectToJson(LJson json, Object o, bool onlyId, int tabLevel) {
    json.tabLevel = tabLevel;
    var fields = LReflections.getFieldsOfInstance(o, null, {Json, Id, Late});
    json.beginObject();
    json.propertyString("class", o.runtimeType.toString());
    for (var field in fields) {
      var value = LReflections.value(o, field.simpleName);
      var fieldName = field.simpleName;
      var isId = LReflections.isId(field);
      if ((!onlyId) || (isId)) {
        if (value == null) {
          json.propertyNull(fieldName);
        } else if (value is String) {
          if ((isId) && (value == LReflections.DEFAULT_ID_STR_NOT_SAVED_YET)) {
            json.propertyNull(fieldName);
          } else {
            json.propertyString(fieldName, value);
          }
        } else if (value is int) {
          if ((isId) && (value == LReflections.DEFAULT_ID_INT_NOT_SAVED_YET)) {
            json.propertyNull(fieldName);
          } else {
            json.propertyInteger(fieldName, value);
          }
        } else if (value is double) {
          json.propertyDouble(fieldName, value);
        } else if (value is bool) {
          json.propertyBoolean(fieldName, value);
        } else if (value is List) {
          json.propertyArray(fieldName, value);
        } else if (value is Map<String, dynamic>) {
          json.propertyMap(fieldName, value);
        } else if ((field.type as ClassMirror).isEnum) {
          LLog.test(LJson, ".... enumToString $fieldName / $value ... ${LReflections.enumToString(value)}");
          json.propertyString(fieldName, LReflections.enumToString(value));
        } else {
          json.propertyObject(fieldName, value);
        }
      }
    }
    json.endObject();
  }
}

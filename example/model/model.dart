import 'package:lych/lych.dart';

@Reflect
class Thing {
  @Json
  LString id;
  @Json
  LString? title;

  Thing(this.id, [this.title]);

  @override
  String toString() => LReflections.asString(this);
}

@Reflect
class TDevice {
  @Json
  String url;
  @Json
  LString href;
  @Json
  LString? id;
  @Json
  LString? title;
  @Json
  List<String> attype;
  @Json
  Map<String,TProperty> properties;

  TDevice(this.url, this.href, this.attype, this.properties);

  static Map<String,TProperty> propertiesMap() {
    return <String,TProperty>{};
  }
}

@Reflect
class TProperty {
  @Json
  LString href;
  @Json
  LString title;
  @Json
  TPropertyType type;
  @Json
  LString? attype;
  @Json
  List<String> enums;
  @Json
  LObservable? value;

  TProperty(this.href, this.title, this.type, this.enums);
}

@Reflect
enum TPropertyType {
  string, integer, number, boolean
}
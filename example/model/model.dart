import 'package:lych/lych.dart';

@Reflect
class Thing {
  @Json
  String id;
  @Json
  String? title;

  Thing(this.id, [this.title]);

  @override
  String toString() => LReflections.asString(this);
}

@Reflect
class TDevice {
  @Json
  String url;
  @Json
  String href;
  @Json
  String? id;
  @Json
  String? title;
  @Json
  List<String> attype;
  @Json
  Map<String, TProperty> properties;

  TDevice(this.url, this.href, this.attype, this.properties);

  static Map<String, TProperty> propertiesMap() {
    return <String, TProperty>{};
  }
}

@Reflect
class TProperty {
  @Json
  String href;
  @Json
  String title;
  @Json
  TPropertyType type;
  @Json
  String? attype;
  @Json
  List<String> enums;
  @Json
  Object? value;

  TProperty(this.href, this.title, this.type, this.enums);
}

@Reflect
enum TPropertyType { string, integer, number, boolean }

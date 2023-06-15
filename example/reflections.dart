import 'package:lych/lych.dart';
import 'model/model.dart';
import 'reflections.reflectable.dart';

void main() {
  initializeReflectable();

  var fields = LReflections.getFields(TDevice);
  print("fields $fields");
  for (var f in fields) {
    print("field ${f.simpleName}");
  }

  var c = Thing("hoho");
  var fields2 = LReflections.getFieldsOfInstance(c, Object, {Json, Id, Lazy});
  print('reflections.getFields: $fields2');

  print('contact before setting: $c');
  LReflections.setValue(c, "id", "contactId");
  LReflections.setValue(c, "title", "Here it is");
  print('contact after setting: $c');

  /*Thing st = LJson.parsePayload(Thing, LJson().beginObject().propertyString("id", "thing1").propertyString("title", "Title of thing").endObject().toString());
  print("things created by mirrors: $st");

  List st2 = LJson.parsePayload(Thing, LJson().beginArray().beginObject().propertyString("id", "thing1").propertyString("title", "Title of thing").endObject().endArray().toString());
  print("things created by mirrors: $st2");*/

  var s = LJson()
      .beginObject()
      .propertyString("url", "thingUrl")
      .propertyString("href", "Ref")
      .propertyArray("attype", ["item1", "item2"])
      .beginObject("properties")
      .beginObject("prop1")
      .propertyString("href", "pHREF")
      .propertyString("title", "pTITLE")
      .propertyString("type", "STRING")
      .propertyString("attype", "propItem1")
      .beginArray("enums")
      .writeString("ENUM1")
      .writeString("ENUM_B")
      .endArray()
      .endObject()
      .endObject()
      .endObject()
      .toString();
  print("parse '$s'");

  var p = TProperty("href", "url", TPropertyType.boolean, ["1"]);
  p.attype = "OnOff";
  print("p: ${LJson.of(p).toString()}");

  TDevice st3 = LJson.parsePayload(TDevice, s);
  print("device created by mirrors: ${st3.properties["prop1"]?.attype}");
  print("device created by mirrors: ${LJson.of(st3, false, 0, true).toString()}");
  //print("device created by mirrors: ${st3.url} ${st3.href}, ${st3.properties["prop1"]?.type.name}");
}

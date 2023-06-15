import 'package:lych/lych.dart';

void main() {
  Contact? c = LJson.parsePayload(
      Contact, LJson.empty().beginObject().propertyString("id", "hJson").propertyString("name", "Thats's not my name").endObject().toString()) as Contact?;
  print("contact created by mirrors: $c");

  var jString = '''
  {
    "offset" : 0,
    "limit" : 66,
    "sortOrders" : [
      {
        "fieldName" : "id",
        "sortDirection" : "ASCENDING"
      },
      {
        "fieldName" : "test",
        "sortDirection" : "descENDING"
      }
    ]
  }
  ''';

  /*var jString = LJson.empty().beginObject().propertyInteger("offset", 0).propertyInteger("limit", 50).
  beginObject("sortOrders").
  propertyString("fieldName", "id").
  endObject().endObject().toString();*/

  print("json $jString");
  LQuery? b = LJson.parsePayload(LQuery, jString) as LQuery?;
  print("query created by mirrors: $b");
}

class Contact {
  @Json
  String id;
  @Json
  String? name;

  Contact(this.id, [this.name]) {
    print("hello $id");
  }

  @override
  String toString() => LReflections.asString(this);
}

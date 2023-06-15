import 'dart:async';
import 'dart:convert';
import 'package:lych/lych.dart';
import 'package:http/http.dart' as http;

@Reflect
class LRepository<T extends Object> {
  LRepository([this.webServer = "http://localhost:8080/api/"]);
  @Json
  LDataState state = LDataState.UNKNOWN;
  @Json
  //List<T>? datas;

  String webServer;
  String fetchCommand = "fetch";
  String stateCommand = "state";
  String persistCommand = "persist";
  String removeCommand = "remove";

  Future<LDataState> checkState() async {
    state = LDataState.REQUESTING;
    final response = await http.post(Uri.parse(webServer + stateCommand), headers: <String, String>{
      "Content-Type": "application/json",
    });
    state = ((response.statusCode == 200) ? LDataState.AVAILABLE : LDataState.OFFLINE);
    return state;
  }

  Future<List<T>> fetch([int offset = 0, int limit = 50, String? filter]) async {
    LLog.test(this, "fetching...");
    state = LDataState.REQUESTING;
    try {
      LLog.test(
          LRepository,
          LJson()
              .beginObject()
              .propertyString("data", T.toString())
              .beginObject("query")
              .propertyInteger("offset", offset)
              .propertyInteger("limit", limit)
              .propertyString("filter", filter ?? null)
              .endObject()
              .endObject()
              .toString());
      final response = await http.post(Uri.parse(webServer + fetchCommand),
          headers: <String, String>{
            "Content-Type": "application/json",
          },
          body: LJson()
              .beginObject()
              .propertyString("data", T.toString())
              .beginObject("query")
              .propertyInteger("offset", offset)
              .propertyInteger("limit", limit)
              .propertyString("filter", filter ?? null)
              .endObject()
              .endObject()
              .toString());

      if (response.statusCode == 200) {
        LLog.test(this, response.statusCode.toString());
        var b = utf8.decode(response.bodyBytes);
        var r = json.decode(b);
        List<T> datas = LReflections.newList(T, r).cast<T>();
        state = LDataState.AVAILABLE;
        LLog.test(this, "json: '$state' anzahl ${datas.length}");
        return datas;
      } else {
        // If the server did not return a 200 OK response
        state = LDataState.OFFLINE;
        throw Exception("Failed to fetch '$webServer$fetchCommand'. Status ${response.statusCode}. Response ${response.body}");
      }
    } catch (e) {
      state = LDataState.OFFLINE;
      throw Exception("Failed to fetch for other reasons: '${e.toString()}'");
    }
  }

  Future persist(T record) async {
    var recordJson = LJson().beginObject().propertyString("data", T.toString()).propertyObject("map", record).endObject().toString();
    LLog.test(LRepository, "persist: $recordJson");
    try {
      final response = await http.post(Uri.parse(webServer + persistCommand),
          headers: <String, String>{
            "Content-Type": "application/json",
          },
          body: recordJson);

      if (response.statusCode == 200) {
        LLog.test(this, response.statusCode.toString());
        state = LDataState.AVAILABLE;
      } else {
        // If the server did not return a 200 OK response
        throw Exception("Failed to fetch '$webServer$persistCommand'. Status ${response.statusCode}. Response ${response.body}");
      }
    } catch (e) {
      state = LDataState.OFFLINE;
      throw Exception("Failed to persist for other reasons: '${e.toString()}'");
    }
  }

  Future remove(T record) async {
    var recordJson = LJson().beginObject().propertyString("data", T.toString()).propertyObject("map", record, true).endObject().toString();
    LLog.test(LRepository, "remove: $recordJson");
    try {
      final response = await http.post(Uri.parse(webServer + removeCommand),
          headers: <String, String>{
            "Content-Type": "application/json",
          },
          body: recordJson);
      if (response.statusCode == 200) {
        LLog.test(this, response.statusCode.toString());
        state = LDataState.AVAILABLE;
      } else {
        // If the server did not return a 200 OK response
        throw Exception("Failed to fetch '$webServer$removeCommand'. Status ${response.statusCode}. Response ${response.body}");
      }
    } catch (e) {
      state = LDataState.OFFLINE;
      throw Exception("Failed to remove for other reasons: '${e.toString()}'");
    }
  }
}

@Reflect
enum LDataState { UNKNOWN, REQUESTING, OFFLINE, AVAILABLE }

class LQuery {
  @Json
  final int offset;
  @Json
  final int limit;
  @Json
  final List<LSortOrder>? sortOrders;
  @Json
  final LTerm? filter;
  LQuery(this.offset, this.limit, [this.sortOrders, this.filter]);

  @override
  String toString() {
    return LReflections.asString(this);
  }
}

class LSortOrder {
  @Json
  final String fieldName;
  @Json
  final LSortDirection sortDirection;
  LSortOrder(this.fieldName, this.sortDirection);

  @override
  String toString() {
    return LReflections.asString(this);
  }
}

enum LSortDirection { ASCENDING, DESCENDING }

class LTerm {}

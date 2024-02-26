import 'dart:async';
import 'dart:convert';
import 'package:lych/lych.dart';
import 'package:http/http.dart' as http;

@Reflect
class LRepository<T extends Object> {
  LRepository([this.webServer = "http://localhost:8080/api/"]);
  @Json
  LDataState state = LDataState.UNKNOWN;

  static Map<String, String> contentTypeJson = <String, String>{"Content-Type": "application/json"};

  String webServer;
  String fetchCommand = "fetch";
  String fetchRootCommand = "root";
  String stateCommand = "state";
  String persistCommand = "persist";
  String removeCommand = "remove";

  Future<LDataState> checkState() async {
    state = LDataState.REQUESTING;
    try {
      final response = await http.post(Uri.parse(webServer + stateCommand), headers: contentTypeJson);
      if (response.statusCode == 200) {
        var b = utf8.decode(response.bodyBytes);
        var r = json.decode(b);
        LLog.test(this, "state is ${r['state'].toLowerCase()}");
        var sas = r["state"];
        state = LReflections.stringToEnum(sas, LReflections.getEnums(LDataState));
        /*state = LDataState.values.firstWhere((e) {
          LLog.test(this, "test for $e >? ${LDataState.type.toString()}");
          return e.toString().toLowerCase() == LDataState.toString() + sas;
        }, orElse: () => LDataState.OFFLINE);
        */
        //state = r["state"].cast<LDataState>();
      }
      //state = ((response.statusCode == 200)
      //    ? LDataState.AVAILABLE
      //    : LDataState.OFFLINE);
    } catch (e) {
      state = LDataState.OFFLINE;
    }
    return state;
  }

  Future<T> fetchRoot(Type recordClass, [String? rootName]) async {
    LLog.test(this, "fetch Root...");
    state = LDataState.REQUESTING;
    try {
      String request =
          LJson().beginObject().propertyString("recordClass", recordClass.toString()).propertyString("rootName", rootName ?? null).endObject().toString();
      LLog.test(LRepository, "request is ${webServer + fetchRootCommand}");
      final response = await http.post(Uri.parse(webServer + fetchRootCommand), headers: contentTypeJson, body: request);
      LLog.test(LRepository, "waiting  finished.");

      LLog.test(this, response.statusCode.toString());
      if (response.statusCode == 200) {
        var b = utf8.decode(response.bodyBytes);
        var r = json.decode(b);
        T data = LReflections.newInstance(recordClass, r) as T;
        state = LDataState.AVAILABLE;
        return data;
      } else {
        // If the server did not return a 200 OK response
        state = LDataState.OFFLINE;
        throw Exception("Failed to fetch '$webServer$fetchCommand'. Status ${response.statusCode}. Response ${response.body}");
      }
    } catch (e) {
      state = LDataState.OFFLINE;
      LLog.test(this, "Error: ${e.toString()}");
      throw Exception("Failed to fetch root for other reasons: '${e.toString()}'");
    }
  }

  Future<List<T>> fetch(Type recordClass, {int offset = 0, int limit = 50, String? filter, Object? parent}) async {
    LLog.test(this, "fetching...");
    state = LDataState.REQUESTING;
    try {
      String request = LJson()
          .beginObject()
          .propertyString("recordClass", recordClass.toString())
          .propertyInteger("offset", offset)
          .propertyInteger("limit", limit)
          .propertyString("filter", filter ?? null)
          .propertyObject("parent", parent, onlyId: true)
          .endObject()
          .toString();
      LLog.test(LRepository, request);
      final response = await http.post(Uri.parse(webServer + fetchCommand), headers: contentTypeJson, body: request);

      LLog.test(this, response.statusCode.toString());
      if (response.statusCode == 200) {
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

  Future persist(T record, {Object? parent}) async {
    var recordJson = LJson().beginObject().propertyObject("record", record).propertyObject("parent", parent, onlyId: true).endObject().toString();
    LLog.test(LRepository, "persist: $recordJson");
    try {
      final response = await http.post(Uri.parse(webServer + persistCommand), headers: contentTypeJson, body: recordJson);

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

  Future remove(T record, {Object? parent}) async {
    var recordJson = LJson().beginObject().propertyObject("record", record, onlyId: true).propertyObject("parent", parent, onlyId: true).endObject().toString();
    LLog.test(LRepository, "remove: $recordJson");
    try {
      final response = await http.post(Uri.parse(webServer + removeCommand), headers: contentTypeJson, body: recordJson);
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

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:json_parsing/models/office_list.dart';

class ApiModel {
  String urlString = "https://about.google/static/data/locations.json";
  Future<OfficeList> getData() async {
    final response = await http.get(Uri.parse(urlString));
    if (response.statusCode == 200) {
      return OfficeList.fromJson(json.decode(response.body));
    } else {
      throw Exception('error: ${response.reasonPhrase}');
    }
  }
}

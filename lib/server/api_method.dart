import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wedding_app_flutter/models/Informations.dart';
import 'package:wedding_app_flutter/models/search_wedding.dart';
import 'package:wedding_app_flutter/models/wedding.dart';

class ApiMethods {
  Future<List<dynamic>> getApi() async {
    var url =
        Uri.parse('https://testproject0124.pythonanywhere.com/api/getAllHall');
    http.Response response = await http.get(url);

    final data = jsonDecode(utf8.decode(response.bodyBytes)) as List<dynamic>;

    List<dynamic> list = [];

    if (response.statusCode == 200) {
      for (dynamic d in data) {
        list.add(Information.fromJson(d));
      }
    } else {
      list = [];
    }
    return list;
  }

  Future<WeddingModel> getId(int id) async {

    var url = Uri.parse(

        'http://testproject0124.pythonanywhere.com/api/infoWeddingapi/$id/?format=json');
    http.Response response = await http.get(url);
    return WeddingModel.fromJson(
        jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>);
  }

  Future<List<dynamic>> searchApi(String searchingText) async {
    var url = Uri.parse(
        'http://testproject0124.pythonanywhere.com/api/search/?params=$searchingText');
    http.Response response = await http.get(url);

    final data = jsonDecode(utf8.decode(response.bodyBytes));

    List<dynamic> list = [];
    if (response.statusCode == 200) {
      list = data.map((e) => Information.fromJson(e)).toList();
    } else {
      list = [];
    }
    return list;
  }
}

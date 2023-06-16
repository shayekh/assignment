import 'dart:convert';

import 'package:Assisgnment/main.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart';

class ApiService {
  Future getPosts() async {
    final posts = Hive.box(API_BOX).get("posts", defaultValue: "");
    if (posts.isNotEmpty) return posts;
    final url =
        'https://api.openweathermap.org/data/2.5/weather?lat=23.8280803907372&lon=90.36292385724984&units=metric&appid=2d279c313e5f34a68a30cefc9dccf139';
    final response = await get(url);
    final resJson = jsonDecode(response.body);
    Hive.box(API_BOX).put("posts", resJson);
    return resJson;
  }

  Future getData() async {
    final url =
        'https://api.openweathermap.org/data/2.5/weather?lat=23.8280803907372&lon=90.36292385724984&units=metric&appid=2d279c313e5f34a68a30cefc9dccf139';
    final response = await get(url);
    final resJson = jsonDecode(response.body);
    return resJson;
  }
}

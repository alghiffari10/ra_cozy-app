import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ra_cozy/models/space.dart';

class SpaceProvider extends ChangeNotifier {
  getRecomendedSpace() async {
    var result = await http
        .get(Uri.parse("http://bwa-cozy.herokuapp.com/recommended-spaces"));
    print(result.statusCode);
    print(result.body);

    if (result.statusCode == 200) {
      List data = jsonDecode(result.body); // convert ke bentuk objeck
      List<Space> spaces = data.map((item) => Space.fromJson(item)).toList();
      return spaces;
    } else {
      return <Space>[];
    }
  }
}

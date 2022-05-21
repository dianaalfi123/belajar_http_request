import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpProviderPut with ChangeNotifier {
  Map<String, dynamic> _data = {};
  Map<String, dynamic> get data => _data;

  int get jumlahLength => _data.length;

  void connectApi(String id, String name, String job) async {
    Uri url = Uri.parse('https://reqres.in/api/users/' + id);

    var hasilResponse = await http.put(url, body: {
      "name": name,
      "job": job,
    });

    _data = json.decode(hasilResponse.body);
    print(_data);
    notifyListeners();
  }
}

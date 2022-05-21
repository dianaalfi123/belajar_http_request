import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpProviderGet with ChangeNotifier {
  Map<String, dynamic> _data = {};

  Map<String, dynamic> get data => _data;

  int get jumlahData => _data.length;

  // //get method
  void connetApi(String id) async {
    Uri url = Uri.parse('https://reqres.in/api/users/' + id);

    // get method
    var hasilRespon = await http.get(url);

    _data = (json.decode(hasilRespon.body))['data'];
    notifyListeners();
  }
}

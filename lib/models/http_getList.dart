import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpGetList {
  // Map<String, dynamic> _data = {};

  // Map<String, dynamic> get data => _data;

  // int get jumlahData => _data.length;
  String id;
  String fullName;
  String avatar;
  String email;
  HttpGetList(
      {this.id = '', this.fullName = '', this.avatar = '', this.email = ''});
  factory HttpGetList.createUser(Map<String, dynamic> object) {
    return HttpGetList(
      id: object['id'].toString(),
      fullName: object['first_name'] + ' ' + object['last_name'],
      avatar: object['avatar'],
      email: object['email'],
    );
  }

  // //get method
  static Future<List<HttpGetList>> connetApi(String id) async {
    Uri url = Uri.parse('https://reqres.in/api/users?page=' + id);

    // get method
    var hasilRespon = await http.get(url);

    var _data = (json.decode(hasilRespon.body));
    List<dynamic> listUser = (_data as Map<String, dynamic>)['data'];
    List<HttpGetList> users = [];
    for (int i = 0; i < listUser.length; i++)
      users.add(HttpGetList.createUser(listUser[i]));

    return users;
    // notifyListeners();
  }
}

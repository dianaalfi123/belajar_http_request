import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpDelete with ChangeNotifier {
  Map<String, dynamic> _data = {};

  Map<String, dynamic> get data => _data;

  int get jumlahData => _data.length;
  late Uri url;
  // //get method
  void connetApi(String id, BuildContext context) async {
    url = Uri.parse('https://reqres.in/api/users/' + id);

    // get method
    var hasilRespon = await http.get(url);

    if (hasilRespon.statusCode == 200) {
      _data = (json.decode(hasilRespon.body))['data'];
      notifyListeners();
      berhasilAlert(context, 'Berhasil Get Data');
    } else {
      gagalAlert(context, 'Gagal Get Data');
    }
  }

  void deleteData(BuildContext context) async {
    var hasilDelete = await http.delete(url);
    if (hasilDelete.statusCode == 204) {
      print('Berhasil Hapus');
      _data = {};
      notifyListeners();
      berhasilAlert(context, 'Berhasil Hapus Data');
    } else {
      gagalAlert(context, 'Gagal Hapus Data');
    }
  }

  void berhasilAlert(BuildContext context, message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: const Color(0XFF39D62A),
      content: Text(message,
          style: TextStyle(
            color: const Color(0XFF000000),
          )),
      duration: Duration(seconds: 1),
    ));
  }

  void gagalAlert(BuildContext context, message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: const Color(0XFFF90E0E),
      content: Text(message,
          style: TextStyle(
            color: const Color(0XFFFFFFFF),
          )),
      duration: Duration(seconds: 1),
    ));
  }
}

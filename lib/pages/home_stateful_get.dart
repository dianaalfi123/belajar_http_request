import 'dart:math';

import 'package:belajar_http/models/http_stateful_get.dart';
import 'package:flutter/material.dart';

class HomeStatefulGet extends StatefulWidget {
  const HomeStatefulGet({Key? key}) : super(key: key);

  @override
  State<HomeStatefulGet> createState() => _HomeStatefulGetState();
}

class _HomeStatefulGetState extends State<HomeStatefulGet> {
  HttpStatefulGet hasilRespon = HttpStatefulGet();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Get Stateful'),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Container(
                height: 100,
                width: 100,
                child: Image.network(
                  (hasilRespon.avatar == '')
                      ? "https://www.uclg-planning.org/sites/default/files/styles/featured_home_left/public/no-user-image-square.jpg?itok=PANMBJF-"
                      : hasilRespon.avatar,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ]),
          SizedBox(height: 20),
          SizedBox(
            child: Text(
              (hasilRespon.id == '')
                  ? "ID : Belum ada data"
                  : "ID : ${hasilRespon.id}",
              style: TextStyle(fontSize: 20),
            ),
          ),
          SizedBox(height: 20),
          SizedBox(child: Text("Name : ", style: TextStyle(fontSize: 20))),
          SizedBox(
            child: Text(
              (hasilRespon.fullName == '')
                  ? "Belum ada data"
                  : hasilRespon.fullName,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(height: 20),
          SizedBox(child: Text("Email : ", style: TextStyle(fontSize: 20))),
          SizedBox(
            child: Text(
              (hasilRespon.email == '') ? "Belum ada data" : hasilRespon.email,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(height: 100),
          OutlinedButton(
            onPressed: () {
              HttpStatefulGet.connetApi((1 + Random().nextInt(10)).toString())
                  .then((value) {
                setState(() {
                  print(value.avatar);
                  hasilRespon = value;
                  print(hasilRespon.avatar);
                });
              });
            },
            child: Text(
              "GET DATA",
              style: TextStyle(
                fontSize: 25,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

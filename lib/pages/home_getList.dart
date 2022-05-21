import 'dart:math';

import 'package:belajar_http/models/http_getList.dart';
import 'package:belajar_http/models/http_stateful_get.dart';
import 'package:flutter/material.dart';

class HomeGetList extends StatefulWidget {
  const HomeGetList({Key? key}) : super(key: key);

  @override
  State<HomeGetList> createState() => _HomeGetListState();
}

List<HttpGetList> data_history = [];

class _HomeGetListState extends State<HomeGetList> {
  HttpGetList hasilRespon = HttpGetList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Get Stateful'),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Container(
            height: 1000,
            color: Color(0XFFD2E7F7),
            child: ListView(shrinkWrap: true, children: showData),
          ),
          OutlinedButton(
            onPressed: () {
              HttpGetList.connetApi('2').then((value) {
                setState(() {
                  print(value);

                  data_history = value;

                  // print(value.avatar);
                  // hasilRespon = value;
                  // print(hasilRespon.avatar);
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

List<Widget> get showData {
  List<Widget> output = [];
  var output1 = '';
  for (int i = 0; i < data_history.length; i++) {
    output1 = data_history[i].fullName;
    print(output);

    output.add(Container(
      height: 300,
      color: Color(0XFFD2E7F7),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, //atas bawah
        crossAxisAlignment: CrossAxisAlignment.center,
        // alignment: WrapAlignment.start,
        // crossAxisAlignment: WrapCrossAlignment.start,
        // runAlignment: WrapAlignment.start,
        children: [
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Container(
                height: 100,
                width: 100,
                child: Image.network(
                  (data_history[i].avatar == '')
                      ? "https://www.uclg-planning.org/sites/default/files/styles/featured_home_left/public/no-user-image-square.jpg?itok=PANMBJF-"
                      : data_history[i].avatar,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ]),
          SizedBox(height: 20),
          SizedBox(
            child: Text(
              (data_history[i].id == '')
                  ? "ID : Belum ada data"
                  : "ID : ${data_history[i].id}",
              style: TextStyle(fontSize: 20),
            ),
          ),
          SizedBox(height: 20),
          SizedBox(
              child: Text("Name : ",
                  style: TextStyle(
                    fontSize: 20,
                  ))),
          SizedBox(
            child: Text(
              (data_history[i].fullName == '')
                  ? "Belum ada data"
                  : data_history[i].fullName,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(height: 20),
          SizedBox(child: Text("Email : ", style: TextStyle(fontSize: 20))),
          SizedBox(
            child: Text(
              (data_history[i].email == '')
                  ? "Belum ada data"
                  : data_history[i].email,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(height: 20)
        ],
      ),
    ));
  }
  return output;
}

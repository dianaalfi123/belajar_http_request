import 'dart:math';

import 'package:belajar_http/models/http_detele.dart';
import 'package:belajar_http/models/http_provider_get.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeDelete extends StatelessWidget {
  // const HomeProviderGet({Key? key}) : super(key: key);
  final TextEditingController controllerFirtName = TextEditingController();
  final TextEditingController controllerEmail = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<HttpDelete>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Detele Data'),
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
                  child: Consumer<HttpDelete>(
                    builder: (context, value, child) => Image.network(
                      (value.data['avatar'] == null)
                          ? "https://www.uclg-planning.org/sites/default/files/styles/featured_home_left/public/no-user-image-square.jpg?itok=PANMBJF-"
                          : value.data['avatar'],
                      fit: BoxFit.cover,
                    ),
                  )),
            ),
          ]),
          SizedBox(height: 20),
          SizedBox(
            child: Consumer<HttpDelete>(
              builder: (context, value, child) => Text(
                (value.data['id'] == null)
                    ? "ID : Belum ada data"
                    : "ID : ${value.data["id"]}",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          SizedBox(height: 20),
          SizedBox(child: Text("Name : ", style: TextStyle(fontSize: 20))),
          SizedBox(
            child: Consumer<HttpDelete>(
              builder: (context, value, child) => Text(
                (value.data['first_name'] == null &&
                        value.data['last_name'] == null)
                    ? "Belum ada data"
                    : value.data['first_name'] + ' ' + value.data['last_name'],
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          SizedBox(child: Text("Email : ", style: TextStyle(fontSize: 20))),
          SizedBox(
            child: Consumer<HttpDelete>(
              builder: (context, value, child) => Text(
                (value.data['email'] == null)
                    ? "Belum ada data"
                    : value.data['email'],
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
          SizedBox(height: 100),
          OutlinedButton(
            onPressed: () {
              // dataProvider.
              dataProvider.connetApi(
                  (1 + Random().nextInt(10)).toString(), context);
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          dataProvider.deleteData(context);
        },
        child: Icon(Icons.delete),
      ),
    );
  }
}

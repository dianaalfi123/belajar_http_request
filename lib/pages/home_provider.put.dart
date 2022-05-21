import 'dart:math';

import 'package:belajar_http/models/http_provider_put.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeProviderPut extends StatelessWidget {
  // const HomeProviderPut({Key? key}) : super(key: key);
  final TextEditingController controllerName = TextEditingController();
  final TextEditingController controllerJob = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<HttpProviderPut>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Put Provider'),
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
                  child: Consumer<HttpProviderPut>(
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
            height: 50,
            child: TextField(
              controller: controllerName,
              decoration: const InputDecoration(
                label: Text('Nama'),
                labelStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 0, color: Colors.transparent)),
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 0, color: Colors.transparent)),
                errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 0, color: Colors.red)),
                errorText: null,
                filled: true,
                fillColor: Colors.blue,
              ),
            ),
          ),
          SizedBox(height: 20),
          SizedBox(
            height: 50,
            child: TextField(
              controller: controllerJob,
              decoration: const InputDecoration(
                label: Text('Job'),
                labelStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 0, color: Colors.transparent)),
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 0, color: Colors.transparent)),
                errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 0, color: Colors.red)),
                errorText: null,
                filled: true,
                fillColor: Colors.blue,
              ),
            ),
          ),
          SizedBox(height: 20),
          SizedBox(
            child: Consumer<HttpProviderPut>(
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
            child: Consumer<HttpProviderPut>(
              builder: (context, value, child) => Text(
                (value.data['name'] == null)
                    ? "Belum ada data"
                    : value.data['name'],
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          SizedBox(child: Text("Job : ", style: TextStyle(fontSize: 20))),
          SizedBox(
            child: Consumer<HttpProviderPut>(
              builder: (context, value, child) => Text(
                (value.data['job'] == null)
                    ? "Belum ada data"
                    : value.data['job'],
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          SizedBox(child: Text("updatedAt : ", style: TextStyle(fontSize: 20))),
          SizedBox(
            child: Consumer<HttpProviderPut>(
              builder: (context, value, child) => Text(
                (value.data['updatedAt'] == null)
                    ? "Belum ada data"
                    : value.data['updatedAt'],
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
              dataProvider.connectApi((1 + Random().nextInt(10)).toString(),
                  controllerName.text, controllerJob.text);
            },
            child: Text(
              "UPDATE DATA",
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

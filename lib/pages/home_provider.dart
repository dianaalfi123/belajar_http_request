import 'package:belajar_http/models/http_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeProvider extends StatelessWidget {
  // const HomeProvider({Key? key}) : super(key: key);
  final TextEditingController controllerName = TextEditingController();
  final TextEditingController controllerJob = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<HttpProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Provider'),
      ),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
              child: Consumer<HttpProvider>(
                builder: (context, value, child) => Text(
                  (value.data['id'] == '' || value.data['id'] == null)
                      ? "ID : Belum ada data"
                      : "ID : ${value.data['id']}",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(child: Text("Name : ", style: TextStyle(fontSize: 20))),
            SizedBox(
              child: Consumer<HttpProvider>(
                builder: (context, value, child) => Text(
                  (value.data['name'] == '' || value.data['name'] == null)
                      ? "Belum ada data"
                      : "${value.data['name']}",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(child: Text("Job : ", style: TextStyle(fontSize: 20))),
            SizedBox(
              child: Consumer<HttpProvider>(
                builder: (context, value, child) => Text(
                  (value.data['job'] == '' || value.data['job'] == null)
                      ? "Belum ada data"
                      : "${value.data['job']}",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
                child: Text("Created At : ", style: TextStyle(fontSize: 20))),
            SizedBox(
              child: Consumer<HttpProvider>(
                builder: (context, value, child) => Text(
                  (value.data['createdAt'] == '' ||
                          value.data['createdAt'] == null)
                      ? "Belum ada data"
                      : "${value.data['createdAt']}",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            SizedBox(height: 100),
            OutlinedButton(
              onPressed: () {
                dataProvider.connectApi(
                    controllerName.text, controllerJob.text);
              },
              child: Text(
                "POST DATA",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

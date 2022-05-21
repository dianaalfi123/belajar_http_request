import 'package:belajar_http/models/http_stateful.dart';
import 'package:flutter/material.dart';

class HomeStateful extends StatefulWidget {
  const HomeStateful({Key? key}) : super(key: key);

  @override
  State<HomeStateful> createState() => _HomeStatefulState();
}

class _HomeStatefulState extends State<HomeStateful> {
  HttpStateful datarespon = HttpStateful();
  int id = 0;

  final TextEditingController controllerName = TextEditingController();
  final TextEditingController controllerJob = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('POST STATEFUL'),
      ),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
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
            SizedBox(
              height: 20,
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
            SizedBox(child: Text("ID : ", style: TextStyle(fontSize: 20))),
            SizedBox(
              child: Text(
                (id.toString() == '0') ? "Belum ada data" : id.toString(),
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(child: Text("Name : ", style: TextStyle(fontSize: 20))),
            SizedBox(
              child: Text(
                (datarespon.name == '') ? "Belum ada data" : datarespon.name,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(child: Text("Job : ", style: TextStyle(fontSize: 20))),
            SizedBox(
              child: Text(
                (datarespon.job == '') ? "Belum ada data" : datarespon.job,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
                child: Text("Created At : ", style: TextStyle(fontSize: 20))),
            SizedBox(
              child: Text(
                (datarespon.createdAt == '')
                    ? "Belum ada data"
                    : datarespon.createdAt,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(height: 100),
            OutlinedButton(
              onPressed: () {
                HttpStateful.connectApi(controllerName.text, controllerJob.text)
                    .then((value) {
                  print(value.name);
                  print(value.job);
                  setState(() {
                    datarespon = value;
                    id++;
                  });
                });
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

import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpStatefulGet {
  String id, email, fullName, avatar;
  HttpStatefulGet(
      {this.id = '', this.email = '', this.fullName = '', this.avatar = ''});

  static Future<HttpStatefulGet> connetApi(String id) async {
    Uri url = Uri.parse('https://reqres.in/api/users/' + id);

    var hasilRespon = await http.get(url);
    //dalam url tsb ada 2 object data dan support untuk mengabil hanya data saja bisa dengan cara dibawah ini
    var data = (json.decode(hasilRespon.body))['data'];

    return HttpStatefulGet(
      id: data['id'].toString(),
      email: data['email'],
      fullName: data['first_name'] + ' ' + data['last_name'],
      avatar: data['avatar'],
    );
  }
}

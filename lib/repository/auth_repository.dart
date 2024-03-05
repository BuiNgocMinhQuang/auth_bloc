import 'dart:convert';

import 'package:http/http.dart' as http;

const String baseUrl = "https://shop.layoutwebdemo.com/api/";

class AuthRespository {
  var client = http.Client();

  login(String shop_id, String email, String password) async {
    var api = "staff/login";
    var url = Uri.parse(baseUrl + api);

    var res = await client.post(url,
        body: {"shop_id": shop_id, "email": email, "password": password});
    if (res.statusCode == 200) {
      final data = json.decode(res.body);
      print("DATA $data");

      return data;
    } else {
      print("CUTTTTT");
    }
  }
}

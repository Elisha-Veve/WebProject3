import 'dart:convert';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CallApi {
  // final baseUrl = "https://arcane-eyrie-42068.herokuapp.com/api/";
  final baseUrl = "http://127.0.0.1:8000/api/";

  postData(data, apiUrl) async {
    var fullUrl = Uri.parse(baseUrl + apiUrl);
    print(fullUrl);
    return http.post(fullUrl, body: jsonEncode(data), headers: {
      "Accept": "application/json",
      "Content-Type": "application/json"
    });
  }

  logout() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    var fullUrl = Uri.parse('${baseUrl}logout');
    return http.post(fullUrl, headers: {
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    });
  }

  getData(apiUrl) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    var fullUrl = Uri.parse(baseUrl + apiUrl);
    return http.get(fullUrl, headers: {
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    });
  }
}

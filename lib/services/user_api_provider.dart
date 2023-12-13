import 'dart:convert';

import 'package:bloc_network_example/model/user.dart';
import 'package:http/http.dart' as http;

class UserProvider {
  Future<List<User>> getUsers() async {
    const String uri = 'https://jsonplaceholder.typicode.com/users';
    final response = await http.get(Uri.parse(uri));
    if (response.statusCode == 200) {
      final List<dynamic> userJson = json.decode(response.body);
      return userJson.map((json) => User.fromJson(json)).toList();
    } else {
      throw Exception(
        'Error occured while parsing users data',
      );
    }
  }
}

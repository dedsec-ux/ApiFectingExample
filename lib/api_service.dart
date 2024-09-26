import 'dart:convert';
import 'package:http/http.dart' as http;
import 'user.dart';

class ApiService {
  final String url = 'https://jsonplaceholder.typicode.com/users';

  Future<List<User>> fetchUsers() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((user) => User.fromJson(user)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }
}

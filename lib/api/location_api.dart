import 'dart:convert';
import 'package:aktest/model/location.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<Location?> getLocation(String ipAddress) async {
    final uri = Uri.parse('http://ip-api.com/json/$ipAddress');
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      if (data['status'] == 'success') {
        return Location.fromMap(data);
      } else {
        throw Exception('Failed to get location');
      }
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}

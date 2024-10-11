import 'dart:convert';
import 'package:aktest/model/location.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<Result<Location, Exception>> getLocation(String ipAddress) async {
    final uri = Uri.parse('http://ip-api.com/json/$ipAddress');
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['status'] == 'success') {
        return Success(Location.fromMap(data));
      } else {
        return Failure(Exception('Invalid response '));
      }
    } else {
      return Failure(Exception('Failed to fetch data'));
    }
  }
}

sealed class Result<S, E extends Exception> {
  const Result();
}

final class Success<S, E extends Exception> extends Result<S, E> {
  const Success(this.value);
  final S value;
}

final class Failure<S, E extends Exception> extends Result<S, E> {
  const Failure(this.exception);
  final E exception;
}

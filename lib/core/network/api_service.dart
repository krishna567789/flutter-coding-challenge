import 'dart:convert';
import 'package:http/http.dart' as http;
import 'api_exception.dart';

class ApiService {

  Future<dynamic> getApi(String url) async {

    try {

      final response = await http.get(Uri.parse(url));

      return _handleResponse(response);

    } catch (e) {

      throw FetchDataException("No Internet Connection");
    }
  }

  dynamic _handleResponse(http.Response response) {

    switch (response.statusCode) {

      case 200:
        return jsonDecode(response.body);

      case 400:
        throw BadRequestException("Bad Request");

      case 401:
      case 403:
        throw UnauthorizedException("Unauthorized Request");

      case 500:
        throw FetchDataException("Server Error");

      default:
        throw FetchDataException(
            "Error occurred : ${response.statusCode}");
    }
  }
}
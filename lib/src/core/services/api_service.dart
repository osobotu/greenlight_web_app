import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:greenlight_web/src/core/core.dart';
import 'package:http/http.dart' as http;

class APIService {
  final http.Client client;

  APIService({http.Client? client}) : client = client ?? http.Client();

  Future<http.Response> getData(String endpoint,
      {Map<String, String>? headers}) async {
    final url = _buildUrl(endpoint);
    final response = await client.get(url, headers: headers);
    return response;
  }

  Future<http.Response> postData(String endpoint, String body,
      {Map<String, String>? headers}) async {
    final url = _buildUrl(endpoint);
    final response = await client.post(url, body: body, headers: headers);
    return response;
  }

  Future<http.Response> putData(String endpoint, String body,
      {Map<String, String>? headers}) async {
    final url = _buildUrl(endpoint);
    final response = await client.put(url, body: body, headers: headers);
    return response;
  }

  Future<http.Response> patchData(String endpoint, String body,
      {Map<String, String>? headers}) async {
    final url = _buildUrl(endpoint);
    final response = await client.patch(url, body: body, headers: headers);
    return response;
  }

  Future<http.Response> deleteData(String endpoint, String body,
      {Map<String, String>? headers}) async {
    final url = _buildUrl(endpoint);
    final response = await client.delete(url, body: body, headers: headers);
    return response;
  }

  Uri _buildUrl(String endpoint) =>
      Uri.parse('${APIConstants.baseUrl}$endpoint');
}

final apiServiceProvider = Provider((ref) => APIService());

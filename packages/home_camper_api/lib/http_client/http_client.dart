import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class HttpClient {
  final String baseUrl;

  HttpClient(this.baseUrl);

  _buildUrl(String path, {Map<String, dynamic>? params}) {
    return Uri.https(baseUrl, path, params);
  }

  Future<dynamic> get(String path) async {
    final url = _buildUrl(path);
    try {
      final response = await http.get(url);

      if (response.statusCode != 200) {
        debugPrint("$url failed with error code ${response.statusCode}");
      }

      final data = jsonDecode(response.body);

      return data;
    } catch (e, stackTrace) {
      rethrow;
    }
  }

  Future<dynamic> post(String path, Map<String, dynamic> body) async {
    final url = _buildUrl(path);
    final headers = {'Content-Type': 'application/json'};
    try {
      final response = await http.post(
        url,
        headers: headers,
        body: body,
      );

      if (response.statusCode != 200) {
        debugPrint("$url failed with error code ${response.statusCode}");
      }

      final data = jsonDecode(response.body);

      return data;
    } catch (e, stackTrace) {
      rethrow;
    }
  }

  Future put(String path, Map<String, dynamic> body) async {
    final url = _buildUrl(path);
    final headers = {'Content-Type': 'application/json'};
    try {
      final response = await http.put(
        url,
        headers: headers,
        body: body,
      );

      if (response.statusCode != 200) {
        debugPrint("$url failed with error code ${response.statusCode}");
      }

      final data = jsonDecode(response.body);

      return data;
    } catch (e, stackTrace) {
      rethrow;
    }
  }
}

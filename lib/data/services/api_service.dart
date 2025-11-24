import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl;

  ApiService({required this.baseUrl});

  Map<String, String> _prepareHeaders(Map<String, String>? headers) {
    return <String, String>{
      'Content-Type': 'application/json',
      if (headers != null) ...headers,
    };
  }

  void _logRequest(
    String method,
    Uri uri,
    Map<String, String> headers,
    dynamic body,
  ) {
    print('API Request - $method $uri');
    print('Headers: $headers');
    if (body != null) print('Body: $body');
  }

  T _processResponse<T>(
    http.Response response,
    T Function(dynamic json) decoder,
  ) {
    print('API Response - Status: ${response.statusCode}');
    print('Response Body: ${response.body}');

    if (response.statusCode >= 200 && response.statusCode < 300) {
      final jsonResponse = jsonDecode(response.body);
      return decoder(jsonResponse);
    } else {
      throw ApiException(
        statusCode: response.statusCode,
        message: response.reasonPhrase ?? "Unknown error",
        body: response.body,
      );
    }
  }

  Future<T> get<T>({
    required String path,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
    required T Function(dynamic json) decoder,
  }) async {
    final uri = Uri.parse(
      baseUrl + path,
    ).replace(queryParameters: queryParameters);
    final requestHeaders = _prepareHeaders(headers);
    _logRequest('GET', uri, requestHeaders, null);

    final response = await http.get(uri, headers: requestHeaders);
    return _processResponse(response, decoder);
  }

  Future<T> post<T>({
    required String path,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
    dynamic body,
    required T Function(dynamic json) decoder,
  }) async {
    final uri = Uri.parse(
      baseUrl + path,
    ).replace(queryParameters: queryParameters);
    final requestHeaders = _prepareHeaders(headers);
    final encodedBody = jsonEncode(body);
    _logRequest('POST', uri, requestHeaders, encodedBody);

    final response = await http.post(
      uri,
      headers: requestHeaders,
      body: encodedBody,
    );
    return _processResponse(response, decoder);
  }

  Future<T> put<T>({
    required String path,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
    dynamic body,
    required T Function(dynamic json) decoder,
  }) async {
    final uri = Uri.parse(
      baseUrl + path,
    ).replace(queryParameters: queryParameters);
    final requestHeaders = _prepareHeaders(headers);
    final encodedBody = jsonEncode(body);
    _logRequest('PUT', uri, requestHeaders, encodedBody);

    final response = await http.put(
      uri,
      headers: requestHeaders,
      body: encodedBody,
    );
    return _processResponse(response, decoder);
  }

  Future<T> delete<T>({
    required String path,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
    dynamic body,
    required T Function(dynamic json) decoder,
  }) async {
    final uri = Uri.parse(
      baseUrl + path,
    ).replace(queryParameters: queryParameters);
    final requestHeaders = _prepareHeaders(headers);
    final encodedBody = jsonEncode(body);
    _logRequest('DELETE', uri, requestHeaders, encodedBody);

    final response = await http.delete(
      uri,
      headers: requestHeaders,
      // body: encodedBody,
    );
    return _processResponse(response, decoder);
  }
}

class ApiException implements Exception {
  final int statusCode;
  final String message;
  final String body;

  ApiException({
    required this.statusCode,
    required this.message,
    required this.body,
  });

  @override
  String toString() {
    return 'ApiException: HTTP $statusCode - $message\nBody: $body';
  }
}

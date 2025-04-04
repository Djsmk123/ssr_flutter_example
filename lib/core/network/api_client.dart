import 'dart:convert';

import 'package:flutter_application_1/core/error/app_error.dart';
import 'package:flutter_application_1/core/logger/logger.dart';
import 'package:flutter_application_1/core/model/api_success_response.dart';
import 'package:flutter_application_1/core/result/result.dart';
import 'package:http/http.dart' as http;

enum RequestType { get, post, patch, put }

class ApiClient {
  final String baseUrl;
  final Logger logger;
  final Map<String, String> defaultHeaders;

  ApiClient({
    required this.baseUrl,
    required this.logger,
    required this.defaultHeaders,
  });

  Future<Result<ApiSucessResponseModel>> performRequest({
    required String endpoint,
    Map<String, String>? queryParams,
    Map<String, dynamic>? data,
    Map<String, String>? headers,
    required RequestType requestType,
  }) async {
    final uri = Uri.parse(
      "$baseUrl/$endpoint",
    ).replace(queryParameters: queryParams);
    final encodeJson = jsonEncode(data);
    switch (requestType) {
      case RequestType.get:
        final response = await http.get(
          uri,
          headers: headers ?? defaultHeaders,
        );
        return processResponse(response);
      case RequestType.post:
        final response = await http.post(
          uri,
          headers: headers ?? defaultHeaders,
          body: encodeJson,
        );
        return processResponse(response);
      case RequestType.patch:
        final response = await http.patch(
          uri,
          headers: headers ?? defaultHeaders,
          body: encodeJson,
        );
        return processResponse(response);
      case RequestType.put:
        final response = await http.put(
          uri,
          headers: headers ?? defaultHeaders,
          body: encodeJson,
        );
        return processResponse(response);
    }
  }

  Result<ApiSucessResponseModel> processResponse(http.Response response) {
    switch (response.statusCode) {
      case 200 && 201:
        {
          try {
            final data = jsonDecode(response.body);
            return Result(data: data, appError: null);
          } catch (e) {
            return Result<ApiSucessResponseModel>(
              data: null,
              appError: JSONError(error: "unable to decode json response"),
            );
          }
        }
      //all borders error

      default:
        return Result<ApiSucessResponseModel>(
          data: null,
          appError: APIError(
            error: "error",
            errorCode: response.statusCode.toString(),
          ),
        );
    }
  }
}

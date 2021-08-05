import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:wanderer/core/utils/constants/constant.dart';
import 'dart:io';
import 'dart:convert';
import 'dart:async';
import 'custom_exception.dart';

class ApiProvider {
  /// get api call method
  Future<dynamic> getApiCall({required String path}) async {
    debugPrint('Api Get, url $path');
    var responseJson;
    var fullUrl = Uri.parse(Constants.baseUrl + path);
    try {
      debugPrint('Full url:- $fullUrl');
      final response = await http.get(fullUrl);
      responseJson = _returnResponse(response);
    } on SocketException {
      debugPrint('No net');
      throw FetchDataException('No Internet connection');
    } on FormatException {
      debugPrint('Invalid response from server');
      throw FetchDataException("Invalid response from server");
    }
    debugPrint('api get received!');
    return responseJson;
  }

  /// post api call method
  Future<dynamic> postApiCall(
      {required String path, required String params}) async {
    debugPrint('Api Post, url $path');
    debugPrint('Api Post, params  $params');
    var responseJson;
    var fullUrl = Uri.parse(Constants.baseUrl + path);
    try {
      debugPrint('Full url:- $fullUrl');
      final response =
          await http.post(fullUrl, body: params, headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      });
      debugPrint("response :- ${response.toString()}");
      responseJson = _returnResponse(response);
    } on SocketException {
      debugPrint('No net');
      throw FetchDataException('No Internet connection');
    } on FormatException {
      debugPrint('Invalid response from server');
      throw FetchDataException("Invalid response from server");
    }
    // debugPrint('api post received!');
    return responseJson;
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        // callAlice(response);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        {
          throw UnauthorisedException(response.body.toString());
        }
      case 502:
        throw InternalServerException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occurred while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'config.dart';

class Initializer {
  static Future<void> init() async {
    await _initGetConnect();
  }

  /// http client
  static Future<void> _initGetConnect() async {
    final connect = GetConnect();
    final fcm = GetConnect();
    Get.put(
      fcm,
      tag: 'fcm',
    );
    final url = ConfigEnvironments.getEnvironments()['url'];
    connect.baseUrl = url;
    connect.timeout = const Duration(seconds: 30);
    connect.httpClient.maxAuthRetries = 0;
    connect.httpClient.addRequestModifier<dynamic>(
      (request) {
        request.headers['Content-Type'] = 'application/json';
        return request;
      },
    );

    connect.httpClient.addResponseModifier(
      (request, response) async {
        debugPrint('request:=> ${request.url}');
        debugPrint('request:=> ${response.statusCode}');

        try {
          Map<String, dynamic> j = json.decode(response.bodyString ?? '');
          String res = const JsonEncoder.withIndent('  ').convert(j);
          debugPrint('response $res');
        } catch (e) {
          debugPrint('error GetConnect:=> ${e.toString()}');
        }
        return response;
      },
    );

    Get.put(connect);
  }
}

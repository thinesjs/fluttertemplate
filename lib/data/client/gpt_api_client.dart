import 'dart:io';
import 'package:get/get.dart';

import '../../utils/app_constants.dart';

class GptApiClient extends GetConnect implements GetxService {
  final String appBaseUrl;

  late Map<String, String> _mainHeaders;

  GptApiClient({required this.appBaseUrl}) {
    baseUrl = appBaseUrl;
    timeout = const Duration(seconds: 30);
    _mainHeaders = {
      'Authorization' : 'Bearer ${AppConstants.OPENAI_APIKEY}',
      'Content-type' : 'application/json',
    };
  }

  Future<Response> getData(String uri, {Map<String, String>? headers}) async {
    try {
      Response response = await get(uri, headers: headers??_mainHeaders,);
      print(response);
      return response;

    }catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> postData(String uri, dynamic body, {Map<String, String>? headers}) async {
    try {
      Response response = await post(uri, body, headers: headers??_mainHeaders);
      return response;
    }catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> putData(String uri, dynamic body, {Map<String, String>? headers}) async {
    try {
      Response response = await put(uri, body, headers: headers??_mainHeaders);
      return response;
    }catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

}
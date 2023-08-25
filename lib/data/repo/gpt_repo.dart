import 'package:get/get.dart';
import 'package:fluttertemplate/data/client/gpt_api_client.dart';
import 'package:fluttertemplate/utils/app_constants.dart';

class GptRepo extends GetxService {
  final GptApiClient gptApiClient;

  GptRepo({required this.gptApiClient});

  Future<Response> getResponse(String subLocality) async {
    // var body = {
    //   "model": "gpt-3.5-turbo",
    //   "messages": [{'role': 'assistant', 'content': 'suggest me top 5 restaurants in $loc without description'}]
    // };
    var body = {
      "model": "gpt-3.5-turbo",
      "messages": [{'role': 'assistant', 'content': 'suggest me top 5 restaurants in $subLocality without description & with restaurant address'}]
    };
    return await gptApiClient.postData("", body);
  }
}
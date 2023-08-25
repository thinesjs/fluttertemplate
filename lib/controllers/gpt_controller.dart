import 'dart:convert';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertemplate/data/repo/gpt_repo.dart';
import 'package:fluttertemplate/models/gptresponse_model.dart';
import '../models/response_model.dart';


class GptController extends GetxController implements GetxService {
  final GptRepo gptRepo;

  GptController({required this.gptRepo});

  late gptResponse _gptResponseModel;
  gptResponse get playerStoreModel => _gptResponseModel;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<ResponseModel> getGptResponse(String subLocality) async {
    late ResponseModel responseModel;
    Response response = await gptRepo.getResponse(subLocality);
    if (response.statusCode == 200) {
      _gptResponseModel = gptResponse.fromJson(response.body);

      // print(response.body);
      print("in $subLocality, :");
      print(response.body['choices'][0]['message']['content']);

      _isLoading = true;
      update();
      responseModel = ResponseModel(true, 0);
    }else{
      //debug for api key
      print(response.statusCode);
      print(response.body);
      _isLoading = true;
      responseModel = ResponseModel(false, 0);
    }
    return responseModel;
  }

}
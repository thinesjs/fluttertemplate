import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertemplate/controllers/gpt_controller.dart';
import 'package:fluttertemplate/data/client/gpt_api_client.dart';
import 'package:fluttertemplate/data/repo/gpt_repo.dart';
import '../utils/app_constants.dart';

Future<void> init() async {

  final prefs = await SharedPreferences.getInstance();

  //
  // API CLIENT
  //
  Get.lazyPut(() => GptApiClient(appBaseUrl: AppConstants.CHAT_COMPLETION_URL));
  // Get.lazyPut(() => RiotCookieReAuthClient(appBaseUrl: AppConstants.RIOT_AUTH_RECOOKIE_URL));
  //
  // REPOS
  //
  Get.lazyPut(() => GptRepo(gptApiClient: Get.find()));
  // Get.lazyPut(() => RiotReAuthRepo(riotCookieReAuthClient: Get.find()));
  //
  // CONTROLLERS
  //
  Get.lazyPut(() => GptController(gptRepo: Get.find()));
  // Get.lazyPut(() => RiotReAuthController(riotReAuthRepo: Get.find()));
  // Get.lazyPut(() => VersionController());
}
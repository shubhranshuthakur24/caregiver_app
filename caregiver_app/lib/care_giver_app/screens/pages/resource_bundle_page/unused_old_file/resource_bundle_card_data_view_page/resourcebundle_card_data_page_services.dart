// import 'dart:convert';
//
// import 'package:get/get.dart';
// import 'package:givershealths/SRC/adapter/api_file.dart';
// import 'package:givershealths/SRC/adapter/token_services.dart';
// import 'package:http/http.dart' as http;
//
// import '../../../../constants.dart';
//
// class ResourceBundleCardDataPageServices extends GetxController {
//   static late int resourceid;
//   static final RxString banner_pic_url = "".obs;
//   static final RxString website_url = "".obs;
//   static final RxString info = "".obs;
//   static final RxString cost = "".obs;
//   static final RxString eligibility = "".obs;
//   static final RxString phone = "".obs;
//   static final RxString email = "".obs;
//   static final RxString title = "".obs;
//   static final RxBool isSaved = false.obs;
//
//   static void dataClear() {
//     banner_pic_url.value = "";
//     website_url.value = "";
//     info.value = "";
//     cost.value = "";
//     eligibility.value = "";
//     phone.value = "";
//     email.value = "";
//   }
//
//   @override
//   void onInit() {
//     // TODO: implement onInit
//     dataClear();
//     apiGetResourceDetials();
//     super.onInit();
//   }
//
//   static Future<void> apiGetResourceDetials() async {
//     var response = await http.get(Uri.parse(ApiFile.getResourceDetailsApiUrl + resourceid.toString()),
//         headers: ({"Authorization": "Token " + TokenServices.token}));
//
//     if (response.statusCode == 200) {
//       var decoded = jsonDecode(response.body);
//
//       if (decoded["status"] == "success") {
//         banner_pic_url.value = decoded["data"]["banner_pic_url"] ?? "";
//         website_url.value = decoded["data"]["website_url"] ?? "";
//         info.value = decoded["data"]["info"] ?? "";
//         cost.value = decoded["data"]["cost"] ?? "";
//         eligibility.value = decoded["data"]["eligibility"] ?? "";
//         email.value = decoded["data"]["email"] ?? "";
//         phone.value = decoded["data"]["phone"] ?? "";
//         title.value = decoded["data"]["title"] ?? "";
//         isSaved.value = decoded["data"]["is_saved"] ?? false;
//       }
//     } else {
//       print('Request failed with status: ${response.statusCode}.');
//     }
//   }
//
//   static Future<String> apiSaveResourceBundle() async {
//     showLoading(title: "saving");
//     String res = "";
//     var response = await http.post(Uri.parse(ApiFile.saveResourceBundelUrl),
//         body: ({"resourceid": resourceid.toString()}), headers: ({'Authorization': "Token " + TokenServices.token}));
//     if (response.statusCode == 200) {
//       var decoded = jsonDecode(response.body);
//       res = decoded["status"];
//       hideLoading();
//       if (decoded["status"] == "success") {
//         showToast("Successfully Saved");
//       }
//     } else {
//       print('Request failed with status: ${response.statusCode}.');
//       hideLoading();
//       showToast('Request failed with status: ${response.statusCode}.' + "(" + response.body.toString() + ")");
//     }
//     return res;
//   }
//
//   static Future<String> apiUnSaveResourceBundle() async {
//     showLoading(title: "Unsaving");
//     String res = "";
//     var response = await http.post(Uri.parse(ApiFile.UnSaveResourceUrl),
//         body: ({"resourceid": resourceid.toString()}), headers: ({'Authorization': "Token " + TokenServices.token}));
//     if (response.statusCode == 200) {
//       var decoded = jsonDecode(response.body);
//       res = decoded["status"];
//       hideLoading();
//       if (decoded["status"] == "success") {
//         showToast("Successfully Unsaved");
//       }
//     } else {
//       print('Request failed with status: ${response.statusCode}.');
//       hideLoading();
//       showToast('Request failed with status: ${response.statusCode}.' + "(" + response.body.toString() + ")");
//     }
//     return res;
//   }
//
//   static void saveUnSaveFunction() {
//     if (isSaved == false) {
//       apiSaveResourceBundle().then((value) {
//         apiGetResourceDetials();
//       });
//     } else if (isSaved == true) {
//       apiUnSaveResourceBundle().then((value) {
//         apiGetResourceDetials();
//       });
//     }
//   }
// }

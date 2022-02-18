// import 'dart:convert';
//
// import 'package:get/get.dart';
// import 'package:givershealths/SRC/adapter/api_file.dart';
// import 'package:givershealths/SRC/adapter/token_services.dart';
// import 'package:http/http.dart' as http;
//
// import 'model_resources_bundle.dart';
//
// class ResourceBundlePageServices extends GetxController {
//   final RxList respiteDataList = [].obs;
//   final RxList financialDataList = [].obs;
//   final RxList transportationDataList = [].obs;
//   final RxList technologyDataList = [].obs;
//   final RxList legalDataList = [].obs;
//   final RxBool apiResponse = false.obs;
//
//   @override
//   void onInit() {
//     // TODO: implement onInit
//
//     apiGetRespiteData();
//     apiFinancialData();
//     apiTransportationData();
//     apiTechnologyData();
//     apiLegalData();
//     super.onInit();
//   }
//
//   Future<void> apiGetRespiteData() async {
//     var response = await http.get(Uri.parse(ApiFile.getResourceBunderUrl + "01"),
//         headers: ({"Authorization": "Token " + TokenServices.token}));
//     apiResponse.value = true;
//     if (response.statusCode == 200) {
//       var decoded = jsonDecode(response.body);
//       if (decoded["status"] == "success") {
//         respiteDataList.clear();
//         for (var data in decoded["data"]) {
//           respiteDataList.add(ModelResourcesBudel.fromJson(data));
//         }
//       }
//     } else {
//       print('Request failed with status: ${response.statusCode}.');
//     }
//   }
//
//   Future<void> apiFinancialData() async {
//     var response = await http.get(Uri.parse(ApiFile.getResourceBunderUrl + "02"),
//         headers: ({"Authorization": "Token " + TokenServices.token}));
//     if (response.statusCode == 200) {
//       var decoded = jsonDecode(response.body);
//       if (decoded["status"] == "success") {
//         financialDataList.clear();
//         for (var data in decoded["data"]) {
//           financialDataList.add(ModelResourcesBudel.fromJson(data));
//         }
//       }
//     } else {
//       print('Request failed with status: ${response.statusCode}.');
//     }
//   }
//
//   Future<void> apiTransportationData() async {
//     var response = await http.get(Uri.parse(ApiFile.getResourceBunderUrl + "03"),
//         headers: ({"Authorization": "Token " + TokenServices.token}));
//
//     if (response.statusCode == 200) {
//       var decoded = jsonDecode(response.body);
//
//       if (decoded["status"] == "success") {
//         transportationDataList.clear();
//         for (var data in decoded["data"]) {
//           transportationDataList.add(ModelResourcesBudel.fromJson(data));
//         }
//       }
//     } else {
//       print('Request failed with status: ${response.statusCode}.');
//     }
//   }
//
//   Future<void> apiTechnologyData() async {
//     var response = await http.get(Uri.parse(ApiFile.getResourceBunderUrl + "04"),
//         headers: ({"Authorization": "Token " + TokenServices.token}));
//
//     if (response.statusCode == 200) {
//       var decoded = jsonDecode(response.body);
//
//       if (decoded["status"] == "success") {
//         technologyDataList.clear();
//         for (var data in decoded["data"]) {
//           technologyDataList.add(ModelResourcesBudel.fromJson(data));
//         }
//       }
//     } else {
//       print('Request failed with status: ${response.statusCode}.');
//     }
//   }
//
//   Future<void> apiLegalData() async {
//     var response = await http.get(Uri.parse(ApiFile.getResourceBunderUrl + "05"),
//         headers: ({"Authorization": "Token " + TokenServices.token}));
//
//     if (response.statusCode == 200) {
//       var decoded = jsonDecode(response.body);
//
//       if (decoded["status"] == "success") {
//         legalDataList.clear();
//         for (var data in decoded["data"]) {
//           legalDataList.add(ModelResourcesBudel.fromJson(data));
//         }
//       }
//     } else {
//       print('Request failed with status: ${response.statusCode}.');
//     }
//   }
// }

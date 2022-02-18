import 'package:get/get.dart';
import 'package:givershealths/SRC/adapter/token_services.dart';
import 'package:givershealths/care_giver_app/screens/select_navigator%20_screen/models/select_navigator_model.dart';
import 'package:givershealths/care_giver_app/screens/select_navigator%20_screen/services/select_navigator_screen_services.dart';

class ControllerSelectNavigator extends GetxController {
  RxList avilableNavigatorList = [].obs;
  static final RxBool buttonPressed = false.obs;

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    // WidgetsBinding.instance!.addPostFrameCallback((_) => showLoading());
    var valueJson;
    await SelectNavigatorScreenServices.apiGetNavigator(TokenServices.token).then((value) => valueJson = value);
    // hideLoading();
    for (var a in valueJson["data"]) {
      avilableNavigatorList.add(SelectNavigatorModel.fromJson(a));
    }
  }
}

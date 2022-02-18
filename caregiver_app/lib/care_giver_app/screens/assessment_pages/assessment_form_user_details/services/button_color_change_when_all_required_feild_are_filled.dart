import 'package:get/get.dart';
import 'package:givershealths/care_giver_app/screens/assessment_pages/assessment_form_user_details/services/assessment_form_user_details_services.dart';
import 'package:intl/intl.dart';

class ButtonColorChageWhenAllRequiredFeildAreFilled extends GetxController {
  RxBool allFieldAllVerifeid = false.obs;

  void textValidation() {
    AssessmentFormUserDetailsServices _assessmentFormUserDetailsServices = Get.find();
    if (_assessmentFormUserDetailsServices.zipCodeController.text.trim().isEmpty) {
      allFieldAllVerifeid.value = false;
    } else if (_assessmentFormUserDetailsServices.yearOfBirthController.text.isEmpty) {
      allFieldAllVerifeid.value = false;
    } else if (int.parse(_assessmentFormUserDetailsServices.yearOfBirthController.text) >=
        int.parse(DateFormat('y').format(DateTime.now())) + 1) {
      allFieldAllVerifeid.value = false;
    } else if (int.parse(_assessmentFormUserDetailsServices.yearOfBirthController.text) <=
        int.parse(DateFormat('y').format(DateTime.now())) - 120) {
      allFieldAllVerifeid.value = false;
    } else if (_assessmentFormUserDetailsServices.genderId == 0) {
      allFieldAllVerifeid.value = false;
    } else if (_assessmentFormUserDetailsServices.ethnicityId == 0) {
      allFieldAllVerifeid.value = false;
    } else {
      allFieldAllVerifeid.value = true;
    }
  }
}

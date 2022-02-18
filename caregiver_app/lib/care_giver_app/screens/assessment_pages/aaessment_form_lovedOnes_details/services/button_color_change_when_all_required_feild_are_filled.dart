import 'package:get/get.dart';
import 'package:givershealths/care_giver_app/screens/assessment_pages/aaessment_form_lovedOnes_details/services/assessment_form_lovedones_details_services.dart';
import 'package:intl/intl.dart';

class LovedOneDetilasButtonColorChangeWhenAllRequiredFieldAreFilled extends GetxController {
  RxBool allFieldAllVerifeid = false.obs;

  void textValidation() {
    AssessmentFormLovedOnesDetailsServices assessmentFormLovedOnesDetailsServices =
        Get.put(AssessmentFormLovedOnesDetailsServices());
    if (assessmentFormLovedOnesDetailsServices.nameController.text.trim().isEmpty) {
      allFieldAllVerifeid.value = false;
    } else if (assessmentFormLovedOnesDetailsServices.zipCodeControler.text.trim().isEmpty) {
      allFieldAllVerifeid.value = false;
    } else if (assessmentFormLovedOnesDetailsServices.yearOfBirthControler.text.trim().isEmpty) {
      allFieldAllVerifeid.value = false;
    } else if (int.parse(assessmentFormLovedOnesDetailsServices.yearOfBirthControler.text) >=
        int.parse(DateFormat('y').format(DateTime.now())) + 1) {
      allFieldAllVerifeid.value = false;
    } else if (int.parse(assessmentFormLovedOnesDetailsServices.yearOfBirthControler.text) <=
        int.parse(DateFormat('y').format(DateTime.now())) - 120) {
      allFieldAllVerifeid.value = false;
    } else if (assessmentFormLovedOnesDetailsServices.genderId == 0) {
      allFieldAllVerifeid.value = false;
    } else if (assessmentFormLovedOnesDetailsServices.ethnicityId == 0) {
      allFieldAllVerifeid.value = false;
    } else {
      allFieldAllVerifeid.value = true;
    }
  }
}

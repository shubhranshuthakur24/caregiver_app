// import 'package:firebase/firebase.dart' as fb;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:givershealths/SRC/adapter/token_services.dart';

import '../../../../constants.dart';

class ProfilePicFetchFromFirebase {
  static void profilePicFetch() async {
    if (GetPlatform.isWeb) {
      // try {
      //   fb
      //       .app()
      //       .storage()
      //       .refFromURL('gs://gvhealth-web.appspot.com/')
      //       .child('media/' + TokenServices.firebaseUserId + "/images/cgProfilePic")
      //       .getDownloadURL()
      //       .then((value) {
      //     userProfileUrlUniversal.value = value.toString();
      //   });
      // } catch (error) {}
      // try {
      //   fb
      //       .app()
      //       .storage()
      //       .refFromURL('gs://gvhealth-web.appspot.com/')
      //       .child('media/' + TokenServices.firebaseUserId + "/images/lovedOneProfilePic")
      //       .getDownloadURL()
      //       .then((value) {
      //     lovedOneProfileUrlUniversal.value = value.toString();
      //   });
      // } catch (error) {}
    } else {
      final _firebaseStorage = FirebaseStorage.instance;
      try {
        lovedOneProfileUrlUniversal.value =
            await _firebaseStorage.ref().child('media/' + TokenServices.userid + "/images/lovedOneProfilePic").getDownloadURL();
      } catch (error) {}
      try {
        userProfileUrlUniversal.value =
            await _firebaseStorage.ref().child('media/' + TokenServices.userid + "/images/cgProfilePic").getDownloadURL();
      } catch (error) {}
    }
  }
}

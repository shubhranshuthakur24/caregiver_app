import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:givershealths/splashScreen/splashScreen.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'SRC/FCM/notifiation_handler.dart';
import 'SRC/adapter/token_services.dart';
import 'SRC/internationalization_using_getx/getx_Internationalization.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (GetPlatform.isMobile) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    await Firebase.initializeApp();
  } else if (GetPlatform.isWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyBOruhr02Hwqt9LAtxJC2Gf5NQZVSeKQAU",
          authDomain: "gvhealth-web.firebaseapp.com",
          projectId: "gvhealth-web",
          storageBucket: "gvhealth-web.appspot.com",
          messagingSenderId: "321487049217",
          appId: "1:321487049217:web:10ebfbc4f1e3e0a904e600",
          measurementId: "G-R3JJX482B8"),
    );
  } else {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyBOruhr02Hwqt9LAtxJC2Gf5NQZVSeKQAU",
          authDomain: "gvhealth-web.firebaseapp.com",
          projectId: "gvhealth-web",
          storageBucket: "gvhealth-web.appspot.com",
          messagingSenderId: "321487049217",
          appId: "1:321487049217:web:10ebfbc4f1e3e0a904e600",
          measurementId: "G-R3JJX482B8"),
    );
  }

  FirebaseMessaging.onBackgroundMessage(NotificationHandler.backroundHandler);
  await SentryFlutter.init(
        (options) {
      options.dsn = 'https://067b391c5d9b4d0897549eaa3a96bfd9@o1067537.ingest.sentry.io/6061216';
      // Set tracesSampleRate to 1.0 to capture 100% of transactions for performance monitoring.
      // We recommend adjusting this value in production.
      options.tracesSampleRate = 1.0;
    },
    appRunner: () {
      if (GetPlatform.isWeb) {
        // runApp(GiversHealth());
        runApp(DevicePreview(builder: (context) => GiversHealth()));
      } else {
        runApp(GiversHealth());
        // runApp(DevicePreview(builder: (context) => GiversHealth()));
      }
    },
  );
  TokenServices.tokenRead();
  // or define SENTRY_DSN via Dart environment variable (--dart-define)
}

class GiversHealth extends StatelessWidget {
  const GiversHealth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NotificationHandler.messageHandler();
    const SmallScreenSize = Size(800, 1280);
    const MeduimScreenSize = Size(1024, 1350);
    const LargeScreenSize = Size(1280, 1880);

    return ScreenUtilInit(
      designSize: Size(375, 812),
      // designSize: ScreenUtil.defaultSize,
      splitScreenMode: true,
      builder: () =>
          GetMaterialApp(
            translations: GetxInternationalization(),
            // your translations
            locale: const Locale('en', 'US'),
            theme: ThemeData(
              fontFamily: 'TTCommons-Regular',
            ),
            debugShowCheckedModeBanner: false,
            home:
            // Test()
            // MainScreen()
            // DashBoardScreen()
            // TestPage()
            const SplashScreen(),
            // home: TokenServices.token == "null" || TokenServices.firebaseUserId == "null" ? LandingScreen() : const MainHomePage()
            // Test()
            // AssessmentPage()
            // SelectNavigator()
            // AssessmentFormUserDetailsScreen()
            // Test()
            // SignInScreen()
            // const AssessmentFormLovedOnesDetailsScreen()
            // AssessmentFormUserDetailsScreen()
            // Test()
          ),
    );
  }
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:givershealths/care_giver_app/screens/user_account_related_screen/sign_in_screen/signin_screen.dart';
// import 'package:sentry_flutter/sentry_flutter.dart';
//
// import 'SRC/FCM/notifiation_handler.dart';
// import 'SRC/adapter/token_services.dart';
// import 'SRC/internationalization_using_getx/getx_Internationalization.dart';
// import 'care_giver_app/screens/pages/main_home_page.dart';
//
// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   if (GetPlatform.isMobile) {
//     SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
//     await Firebase.initializeApp();
//   } else if (GetPlatform.isWeb) {
//     await Firebase.initializeApp(
//       options: const FirebaseOptions(
//           apiKey: "AIzaSyBOruhr02Hwqt9LAtxJC2Gf5NQZVSeKQAU",
//           authDomain: "gvhealth-web.firebaseapp.com",
//           projectId: "gvhealth-web",
//           storageBucket: "gvhealth-web.appspot.com",
//           messagingSenderId: "321487049217",
//           appId: "1:321487049217:web:10ebfbc4f1e3e0a904e600",
//           measurementId: "G-R3JJX482B8"),
//     );
//   }
//
//   FirebaseMessaging.onBackgroundMessage(NotificationHandler.backroundHandler);
//   await SentryFlutter.init(
//     (options) {
//       options.dsn = 'https://067b391c5d9b4d0897549eaa3a96bfd9@o1067537.ingest.sentry.io/6061216';
//       // Set tracesSampleRate to 1.0 to capture 100% of transactions for performance monitoring.
//       // We recommend adjusting this value in production.
//       options.tracesSampleRate = 1.0;
//     },
//     appRunner: () => runApp(GiversHealth()),
//   );
//   TokenServices.tokenRead();
//   // or define SENTRY_DSN via Dart environment variable (--dart-define)
// }
//
// class GiversHealth extends StatelessWidget {
//   const GiversHealth({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     NotificationHandler.messageHandler();
//     final SmallAcreenSize = const Size(800, 1280);
//     final MeduimScreenSize = const Size(1024, 1350);
//     final LargeScreenSize = const Size(1280, 1880);
//
//     return ScreenUtilInit(
//       // designSize: Size(375, 812),
//       designSize: ScreenUtil.defaultSize,
//       splitScreenMode: true,
//       builder: () => GetMaterialApp(
//           translations: GetxInternationalization(),
//           // your translations
//           locale: const Locale('en', 'US'),
//           theme: ThemeData(
//             fontFamily: 'TTCommons-Regular',
//           ),
//           debugShowCheckedModeBanner: false,
//           home: TokenServices.token == "null" || TokenServices.firebaseUserId == "null"
//               ? SignInScreen()
//               :
//               // AssessmentPage3()
//               // const MainHomePage()
//               MainHomePage()
//
//           // Test()
//           // AssessmentFormUserDetailsScreen()
//           // Test()
//           // SignInScreen()
//           ),
//     );
//   }
// }

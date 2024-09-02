import 'dart:io';
import 'package:crm_mrs_app/view/screens/splash/splash.dart';
import 'package:crm_mrs_app/view_model/utils/MyHttpOverrides.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Upgrader.clearSavedSettings(); // only show during testing
  // await Firebase.in
  HttpOverrides.global = MyHttpOverrides();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'CRM MRS App',
        theme: ThemeData(
            // Set your theme here ..
            ),
        home: Splash(),

        //AppUpdate(),0
      );
    });
  }
}

class AppUpdate extends StatefulWidget {
  const AppUpdate({super.key});

  @override
  State<AppUpdate> createState() => _AppUpdateState();
}

class _AppUpdateState extends State<AppUpdate> {
  @override
  Widget build(BuildContext context) {
    return Splash();
  }
}

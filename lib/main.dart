import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:luna/pages/auth_page.dart';
import 'package:luna/pages/cataloge_page.dart';
import 'package:luna/pages/reg_page.dart';
import 'package:toast/toast.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyAJmMihMJ5cOrlCIQJPS5wLLs5LGeETXgE",
      appId: "1:463184157208:android:e471660c4c00687a91816d",
      messagingSenderId: "463184157208",
      projectId: "luna-a728b",
      storageBucket: "luna-a728b.appspot.com",
    ),
  );
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  // Routes definition
  static Map<String, WidgetBuilder> _getRoutes() {
    return {
      '/': (context) => AuthPage(),
      '/catalogPage': (context) => CatalogePage(),
      '/registerPage': (context) => RegPage(),
      '/authPage': (context) => AuthPage(),
    };
  }

  @override
  Widget build(BuildContext context) {
    // Initialize ToastContext
    ToastContext().init(context);

    return MaterialApp(
      routes: _getRoutes(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Montserrat',
      ),
      initialRoute: '/', // Set AuthPage as home
    );
  }
}
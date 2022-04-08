import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sqliteyaw/screens/home_screen.dart';
import 'package:sqliteyaw/screens/intro_screen.dart';
import 'package:sqliteyaw/screens/login_screen.dart';
import 'package:sqliteyaw/screens/register_screen.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(App());
}

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);
  final box = GetStorage();
  @override
  Widget build(BuildContext context) {
    final loggedIn = box.read('loggedIn') ?? false;
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: loggedIn ? '/home' : '/',
      routes: {
        '/': (context) => IntroScreen(),
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/home': (context) => HomeScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

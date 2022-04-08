import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sqliteyaw/models/user_model.dart';
import 'package:sqliteyaw/utils/database_helper.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset(
              "assets/images/background.jpg",
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            Align(
              alignment: FractionalOffset.bottomCenter,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.65,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  width: double.infinity,
                  color: Colors.white,
                  child: ListView(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Welcome back",
                        style: TextStyle(
                          color: Color(0XFF2EB886),
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "Login to your account",
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          hintText: "Email",
                          hintStyle: TextStyle(
                            color: Colors.green[400],
                            fontWeight: FontWeight.w600,
                          ),
                          fillColor: Colors.green[50],
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Password",
                          hintStyle: TextStyle(
                            color: Colors.green[400],
                            fontWeight: FontWeight.w600,
                          ),
                          fillColor: Colors.green[50],
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 100,
                      ),
                      Container(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: StadiumBorder(),
                            primary: Colors.green[900],
                          ),
                          onPressed: () async {
                            User user = await DatabaseHelper.instance.getUser();
                            bool doesCredentialsMatch =
                                (user.password == _passwordController.text) &&
                                    (user.email == _emailController.text) &&
                                    (user.email != "") &&
                                    (user.password != "");
                            if (doesCredentialsMatch) {
                              final box = GetStorage();
                              box.write('loggedIn', true);
                              Navigator.pushNamed(context, "/home");
                            } else {
                              const snackBar = SnackBar(
                                content: Text("Wrong credentials"),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(
                                snackBar,
                              );
                            }
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have an account?"),
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                  context, "/register");
                            },
                            child: Text("Sign up"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

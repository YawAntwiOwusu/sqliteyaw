import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sqliteyaw/models/user_model.dart';
import 'package:sqliteyaw/utils/database_helper.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 1,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset(
              "assets/images/background.jpg",
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(
                top: 30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Register",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                    ),
                  ),
                  Text(
                    "Create you new account",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: FractionalOffset.bottomCenter,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.75,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  width: double.infinity,
                  color: Colors.white,
                  child: ListView(
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      TextField(
                        controller: _firstNameController,
                        decoration: InputDecoration(
                          hintText: "First Name",
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
                        height: 15,
                      ),
                      TextField(
                        controller: _lastNameController,
                        decoration: InputDecoration(
                          hintText: "Last Name",
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
                        height: 15,
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
                            borderSide: BorderSide.none,
                          ),
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
                        height: 15,
                      ),
                      TextField(
                        controller: _confirmPasswordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Confirm Password",
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
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "By signing in you agree to  our ",
                            style: TextStyle(
                              color: Colors.green[900],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text("Terms of use")
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "and ",
                            style: TextStyle(
                              color: Colors.green[900],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text("privacy policy."),
                        ],
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: StadiumBorder(),
                            primary: Colors.green[900],
                          ),
                          onPressed: () {
                            bool isPasswordsEqual = (_passwordController.text ==
                                _confirmPasswordController.text);
                            if (isPasswordsEqual) {
                              User user = User(
                                firstName: _firstNameController.text,
                                lastName: _lastNameController.text,
                                email: _emailController.text,
                                password: _passwordController.text,
                              );
                              if ((user.lastName.isNotEmpty) ||
                                  (user.lastName.isNotEmpty) ||
                                  (user.email.isNotEmpty) ||
                                  (user.password.isNotEmpty)) {
                                DatabaseHelper.instance.insertUser(user);
                                Navigator.pushNamed(context, "/home");
                                final box = GetStorage();
                                box.write('loggedIn', true);
                              } else {
                                const snackBar = SnackBar(
                                  content: Text("Please fill missing fields"),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(
                                  snackBar,
                                );
                              }
                            } else {
                              const snackBar = SnackBar(
                                content: Text("Passwords does not match"),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(
                                snackBar,
                              );
                            }
                          },
                          child: Text(
                            "Sign Up ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Already have an account?"),
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(context, "/login");
                            },
                            child: Text("Login"),
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

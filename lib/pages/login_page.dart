import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import "package:google_fonts/google_fonts.dart";
import 'package:mobile/providers/auth_provider.dart';
import 'package:mobile/providers/order_history_provider.dart';
import 'package:mobile/widgets/loading_button.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handleLogin() async {
      if (_formKey.currentState.validate()) {
        setState(() {
          isLoading = true;
        });

        if (await authProvider.login(
          email: emailController.text,
          password: passwordController.text,
        )) {
          Navigator.pushNamed(context, '/home');
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Text(
                "Email or password incorrect",
                textAlign: TextAlign.center,
              ),
            ),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              "Please check your form and try again",
              textAlign: TextAlign.center,
            ),
          ),
        );
      }
      setState(() {
        isLoading = false;
      });
    }

    Widget loginButton() {
      return Container(
        width: double.infinity,
        height: 42,
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Color(0xff6C5ECF),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
          ),
          onPressed: handleLogin,
          child: Text(
            "Login",
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xff030E22),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 120,
            left: 62,
            right: 62,
          ),
          child: Column(children: [
            Center(
              child: Image.asset(
                "assets/login.png",
                width: 80,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              "Let's Sign You In.",
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: emailController,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                    ),
                    validator: MultiValidator([
                      RequiredValidator(errorText: "Email is required"),
                      EmailValidator(errorText: "Enter a valid email")
                    ]),
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff6C5ECF)),
                        //  when the TextFormField in focused
                      ),
                      filled: true,
                      fillColor: Color(0xff2c3545),
                      // icon: Icon(
                      //   Icons.person,
                      //   color: Colors.white,
                      // ),
                      hintText: "Email",
                      hintStyle: GoogleFonts.poppins(
                        color: Color(
                          0xff68687A,
                        ),
                      ),
                      labelStyle: GoogleFonts.poppins(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    obscureText: true,
                    controller: passwordController,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                    ),
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'password is required'),
                      MinLengthValidator(8,
                          errorText: 'password must be at least 8 digits long'),
                    ]),
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff6C5ECF)),
                        //  when the TextFormField in focused
                      ),
                      filled: true,
                      fillColor: Color(0xff2c3545),
                      // icon: Icon(
                      //   Icons.person,
                      //   color: Colors.white,
                      // ),
                      hintText: "Password",
                      hintStyle: GoogleFonts.poppins(
                        color: Color(
                          0xff68687A,
                        ),
                      ),
                      labelStyle: GoogleFonts.poppins(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            isLoading ? LoadingButton() : loginButton(),
            Spacer(),
            Container(
              margin: EdgeInsets.only(bottom: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have account?",
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: Color(0xffF8F7FD),
                    ),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/register');
                    },
                    child: Text(
                      "Register",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: Color(0xff6C5ECF),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}

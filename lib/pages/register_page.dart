import 'package:flutter/material.dart';
import "package:google_fonts/google_fonts.dart";
import 'package:mobile/providers/auth_provider.dart';
import 'package:mobile/widgets/loading_button.dart';
import 'package:provider/provider.dart';
import 'package:form_field_validator/form_field_validator.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController nameController = new TextEditingController(text: "");

  TextEditingController emailController = new TextEditingController(text: "");

  TextEditingController passwordController =
      new TextEditingController(text: "");
  TextEditingController addressController = new TextEditingController(text: "");
  TextEditingController phoneController = new TextEditingController(text: "");

  final _formKey = GlobalKey<FormState>();

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handleRegister() async {
      if (_formKey.currentState.validate()) {
        setState(() {
          isLoading = true;
        });

        if (await authProvider.register(
          name: nameController.text,
          email: emailController.text,
          password: passwordController.text,
          address: addressController.text,
          phone_number: phoneController.text,
        )) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.blue,
              content: Text(
                "Please complete your profile",
                textAlign: TextAlign.center,
              ),
            ),
          );
          Navigator.pushNamed(context, '/home');
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              "Register failed please complete your form",
              textAlign: TextAlign.center,
            ),
          ),
        );
      }
      setState(() {
        isLoading = false;
      });
    }

    Widget signUpButton() {
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
          onPressed: handleRegister,
          child: Text(
            "Register",
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
          child: Column(
            children: [
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
                "Register",
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
                      controller: nameController,
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                      ),
                      validator:
                          RequiredValidator(errorText: "Name is required"),
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
                        hintText: "Full Name",
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
                            errorText:
                                'password must be at least 8 digits long'),
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
                height: 28,
              ),
              isLoading ? LoadingButton() : signUpButton(),
              Spacer(),
              Container(
                margin: EdgeInsets.only(bottom: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have account?",
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
                        Navigator.pushNamed(context, "/login");
                      },
                      child: Text(
                        "Login",
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
            ],
          ),
        ),
      ),
    );
  }
}

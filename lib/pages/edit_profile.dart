import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/models/user_model.dart';
import 'package:mobile/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class EditProfilePage extends StatefulWidget {
  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;

    final nameController = TextEditingController(text: user.name);

    final emailController = TextEditingController(text: user.email);

    final addressController = TextEditingController(text: user.address);
    final phoneController = TextEditingController(text: user.phone_number);
    handleUpdateUser() async {
      if (_formKey.currentState.validate()) {
        if (await authProvider.updateUser(
          name: nameController.text,
          email: emailController.text,
          address: addressController.text,
          phone_number: phoneController.text,
          id: user.id.toString(),
          token: authProvider.user.token,
        )) {
          Navigator.pushNamed(context, '/home');
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
    }

    Widget header() {
      return AppBar(
        centerTitle: true,
        title: Text(
          "Edit Profile",
          style: GoogleFonts.poppins(
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
              onPressed: handleUpdateUser,
              icon: Icon(
                Icons.check,
                color: Colors.white,
              ))
        ],
        backgroundColor: Color(0xff030E22),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.close,
          ),
        ),
      );
    }

    Widget nameInput() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Name",
              style: GoogleFonts.poppins(
                color: Colors.grey,
                fontSize: 13,
              ),
            ),
            TextFormField(
              validator: MultiValidator([
                RequiredValidator(errorText: "Name is required"),
              ]),
              controller: nameController,
              style: GoogleFonts.poppins(
                color: Colors.white,
              ),
              decoration: InputDecoration(
                hintText: "${user.name}",
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                  ),
                ),
                hintStyle: GoogleFonts.poppins(
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget emailInput() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Email",
              style: GoogleFonts.poppins(
                color: Colors.grey,
                fontSize: 13,
              ),
            ),
            TextFormField(
              validator: MultiValidator([
                RequiredValidator(errorText: "Email is required"),
                EmailValidator(errorText: "Enter a valid email")
              ]),
              controller: emailController,
              style: GoogleFonts.poppins(
                color: Colors.white,
              ),
              decoration: InputDecoration(
                hintText: "${user.email}",
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                  ),
                ),
                hintStyle: GoogleFonts.poppins(
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget phoneInput() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Phone Number",
              style: GoogleFonts.poppins(
                color: Colors.grey,
                fontSize: 13,
              ),
            ),
            TextFormField(
              validator: MultiValidator([
                RequiredValidator(errorText: "Phone is required"),
                PatternValidator(r'^08[0-9]{9,}$',
                    errorText: 'Phone number is not valid')
              ]),
              controller: phoneController,
              style: GoogleFonts.poppins(
                color: Colors.white,
              ),
              decoration: InputDecoration(
                hintText: "${user.phone_number}",
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                  ),
                ),
                hintStyle: GoogleFonts.poppins(
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget addressInput() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Address",
              style: GoogleFonts.poppins(
                color: Colors.grey,
                fontSize: 13,
              ),
            ),
            TextFormField(
              validator: MultiValidator([
                RequiredValidator(errorText: "Address is required"),
              ]),
              controller: addressController,
              maxLines: 2,
              style: GoogleFonts.poppins(
                color: Colors.white,
              ),
              decoration: InputDecoration(
                // contentPadding: EdgeInsets.symmetric(
                //   vertical: 30,
                // ),
                hintText: "${user.address}",
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                  ),
                ),
                hintStyle: GoogleFonts.poppins(
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget content() {
      return Container(
        padding: EdgeInsets.symmetric(
          horizontal: 30,
        ),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              margin: EdgeInsets.only(
                top: 30,
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(
                    "assets/image_profile.png",
                  ),
                ),
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  nameInput(),
                  emailInput(),
                  phoneInput(),
                  addressInput(),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: Color(0xff030E22),
      appBar: header() as PreferredSizeWidget,
      body: content(),
      resizeToAvoidBottomInset: false,
    );
  }
}

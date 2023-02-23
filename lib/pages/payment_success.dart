import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/pages/main/main_page.dart';
import 'package:mobile/pages/order_history.dart';

class PaymentSuccess extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff030E22),
      body: Container(
        padding: EdgeInsets.only(top: 30, left: 30, right: 30, bottom: 30),
        child: Column(
          children: [
            SizedBox(height: 100),
            Center(
              child: Image.asset(
                'assets/wallet_success.png',
                width: 209.8,
                height: 200.11,
              ),
            ),
            SizedBox(height: 30),
            Text(
              'Checkout Success',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Please complete the payment, \nfor the next process",
              style: GoogleFonts.poppins(
                color: Color(0xffCFCFCF),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 51),
            Container(
              width: 295,
              height: 47,
              child: TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: Color(0xff6C5ECF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    )),
                onPressed: () {
                  {
                    Navigator.pushNamed(context, "/home");
                  }
                },
                child: Text(
                  'Complete Payment',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            InkWell(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation1, animation2) =>
                        MainPage(),
                    transitionDuration: Duration(seconds: 0),
                  ),
                );
              },
              child: Text(
                'Back to Home',
                style: GoogleFonts.poppins(
                  color: Color(0xff6C5ECF),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

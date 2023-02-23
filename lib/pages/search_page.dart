import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/pages/main/cartpage/cart_page.dart';
import 'package:mobile/pages/main/homepage/home_page.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff030E22),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60, left: 15, right: 15),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Color(0xff2C3545),
                      borderRadius: BorderRadius.circular(13),
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, animation1, animation2) =>
                                HomePage(),
                            transitionDuration: Duration(seconds: 0),
                          ),
                        );
                      },
                      child: Image.asset(
                        'assets/left_arrow.png',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Flexible(
                    child: Container(
                      width: 295,
                      height: 40,
                      child: TextFormField(
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                            top: 11,
                            bottom: 11,
                          ),
                          fillColor: Color(0xff2C3545),
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(21),
                            borderSide: BorderSide.none,
                          ),
                          hintText: "I'm searching for..",
                          hintStyle: GoogleFonts.poppins(
                            color: Color(0xff68687A),
                          ),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Color(0xff68687A),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, animation1, animation2) =>
                              CartPage(),
                          transitionDuration: Duration(seconds: 0),
                        ),
                      );
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Color(0xff2C3545),
                        borderRadius: BorderRadius.circular(13),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/checkout_icon.png',
                            width: 28,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 24.0, left: 15, right: 15, bottom: 100),
              child: Column(
                children: [
                  Row(
                    children: [
                      //     ProductList(

                      //     ),
                      //     SizedBox(
                      //       width: 16,
                      //     ),
                      //     ProductList(

                      //     ),
                      //   ],
                      // ),
                      // SizedBox(height: 16),
                      // Row(
                      //   children: [
                      //     ProductList(

                      //     ),
                      //     SizedBox(
                      //       width: 16,
                      //     ),
                      //     ProductList(

                      //     ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      // ProductList(),
                      SizedBox(
                        width: 16,
                      ),
                      // ProductList(),
                    ],
                  ),
                  SizedBox(height: 32),
                  Text(
                    "You've reached the end",
                    style: GoogleFonts.poppins(
                      color: Color(0xfFF8F7FD),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

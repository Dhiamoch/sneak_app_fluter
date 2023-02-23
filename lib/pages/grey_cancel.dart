import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/pages/order_history.dart';

class GreyCancel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff030E22),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 60.0,
                left: 15,
              ),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, animation1, animation2) =>
                              OrderHistory(),
                          transitionDuration: Duration(seconds: 0),
                        ),
                      );
                    },
                    child: Image.asset(
                      'assets/box_left.png',
                      width: 40,
                    ),
                  ),
                  SizedBox(width: 80),
                  Text(
                    'Order Details',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, top: 26, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Shipping Information',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Edit address',
                    style: GoogleFonts.poppins(
                      color: Color(0xffCFCFCF),
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, top: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/landmark_icon.png',
                    width: 40,
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'John Doe',
                        style: GoogleFonts.poppins(
                          color: Color(0xffF8F7FD),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        '(+62) 876 1234 1234',
                        style: GoogleFonts.poppins(
                          color: Color(0xffF8F7FD),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Toko Mas - Jl. Nangka Sari No. 24D, \nKecamatan Ngoy Kota Surabaya',
                        style: GoogleFonts.poppins(
                          color: Color(0xffCFCFCF),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24.0, left: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Order Summary',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  Container(
                    width: 343,
                    height: 115,
                    decoration: BoxDecoration(
                      color: Color(0xff2C3545),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/product_two.png',
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 27.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Nike Air Force X-AC Girl \nStyle',
                                style: GoogleFonts.poppins(
                                  color: Color(0xffF8F7FD),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Rp1.650.000 x1',
                                style: GoogleFonts.poppins(
                                  color: Color(0xffF8F7FD),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  Container(
                    width: 343,
                    height: 115,
                    decoration: BoxDecoration(
                      color: Color(0xff2C3545),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/watch.png',
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 27.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Smartcwatch 2.0',
                                style: GoogleFonts.poppins(
                                  color: Color(0xffF8F7FD),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Rp4.500.000 x1',
                                style: GoogleFonts.poppins(
                                  color: Color(0xffF8F7FD),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Payment Method',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Choose Payment',
                          style: GoogleFonts.poppins(
                            color: Color(0xffCFCFCF),
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Image.asset(
                        'assets/visa_icon.png',
                        width: 40,
                      ),
                      SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'VISA Classic',
                            style: GoogleFonts.poppins(
                              color: Color(0xffF8F7FD),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            '****-0921',
                            style: GoogleFonts.poppins(
                              color: Color(0xffCFCFCF),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 24),
                  Text(
                    'Notes',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  Container(
                    width: 343,
                    height: 40,
                    child: TextFormField(
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(
                          top: 11,
                          bottom: 11,
                          left: 20,
                        ),
                        fillColor: Color(0xff2C3545),
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(21),
                          borderSide: BorderSide.none,
                        ),
                        hintText: "Additional Notes",
                        hintStyle: GoogleFonts.poppins(
                          color: Color(0xff68687A),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 45),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xff030E22),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Text(
                'Rp6.150.000',
                style: GoogleFonts.poppins(
                  color: Color(0xffF8F7FD),
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              label: ''),
          BottomNavigationBarItem(
            icon: Container(
              width: 153,
              height: 47,
              child: TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: Color(0xffCFCFCF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    )),
                onPressed: () {},
                child: Text(
                  'Cancel Order',
                  style: GoogleFonts.poppins(
                    color: Color(0xff68687A),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            label: '',
          )
        ],
      ),
    );
  }
}

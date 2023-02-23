import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mobile/models/user_model.dart';
import 'package:mobile/providers/auth_provider.dart';
import 'package:mobile/providers/cart_provider.dart';
import 'package:mobile/providers/transaction_provider.dart';
import 'package:mobile/pages/checkoutpage/widgets/checkout_card.dart';
import 'package:provider/provider.dart';

class OrderDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    TransactionProvider transactionProvider =
        Provider.of<TransactionProvider>(context);
    UserModel user = authProvider.user;

    handleCheckout() async {
      if (await transactionProvider.checkout(
        authProvider.user.token,
        cartProvider.carts,
        cartProvider.totalPrice(),
      )) {
        cartProvider.carts = [];
        Navigator.pushNamedAndRemoveUntil(
            context, "/checkout-success", (route) => false);
      }
    }

    Widget header() {
      return AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color(0xff030E22),
        title: Text(
          "Checkout Details",
          style: GoogleFonts.poppins(
            color: Colors.white,
          ),
        ),
      );
    }

    return Scaffold(
      appBar: header() as PreferredSizeWidget,
      backgroundColor: Color(0xff030E22),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 30,
                  right: 30,
                  top: 20,
                ),
                child: Text(
                  'Shipping Information',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 30.0,
                  top: 16,
                  right: 30,
                ),
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
                          "${user.name}",
                          style: GoogleFonts.poppins(
                            color: Color(0xffF8F7FD),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "${user.phone_number}",
                          style: GoogleFonts.poppins(
                            color: Color(0xffF8F7FD),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 8),
                        Container(
                          width: 270,
                          child: Text(
                            "${user.address}",
                            style: GoogleFonts.poppins(
                              color: Color(0xffCFCFCF),
                            ),
                            maxLines: 2,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 20.0,
                  left: 30,
                  right: 30,
                ),
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
                    Column(
                      children: cartProvider.carts
                          .map(
                            (cart) => CheckoutCard(cart),
                          )
                          .toList(),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Payment Method',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Image.asset(
                          'assets/bni_logo.png',
                          width: 40,
                        ),
                        SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Bank Transfer',
                              style: GoogleFonts.poppins(
                                color: Color(0xffF8F7FD),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              'Rekening Number : 4544-0921-888',
                              style: GoogleFonts.poppins(
                                color: Color(0xffCFCFCF),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xff030E22),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Text(
                NumberFormat.currency(
                  locale: "id",
                  symbol: 'Rp ',
                  decimalDigits: 0,
                ).format(cartProvider.totalPrice()),
                style: GoogleFonts.poppins(
                  color: Colors.white,
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
                    backgroundColor: Color(0xff6C5ECF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    )),
                onPressed: handleCheckout,
                child: Text(
                  'Checkout',
                  style: GoogleFonts.poppins(
                    color: Color(0xffF8F7FD),
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

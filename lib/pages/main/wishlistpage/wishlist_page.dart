import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/providers/wishlist_provider.dart';
import 'package:mobile/pages/main/wishlistpage/widgets/wishlist_card.dart';
import 'package:provider/provider.dart';

class WishlistPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);

    Widget header() {
      return AppBar(
        backgroundColor: Color(0xff030E22),
        centerTitle: true,
        title: Text(
          "Favorite Shoes",
          style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
      );
    }

    Widget emptyWishlist() {
      return Expanded(
        child: Container(
          width: double.infinity,
          color: Color(0xff030E22),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/wishlist.png",
                width: 74,
                color: Color(0xff3babbe),
              ),
              SizedBox(
                height: 23,
              ),
              Text(
                "Opss! Your wishlist is empty",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                "Let's find your favorite shoes",
                style: GoogleFonts.poppins(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
              Container(
                width: 154,
                height: 44,
                margin: EdgeInsets.only(
                  top: 20,
                ),
                child: TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: Color(0xff6C5ECF),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12))),
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, "/home", (route) => false);
                  },
                  child: Text(
                    "Exprole Store",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    }

    Widget content() {
      return Expanded(
        child: Container(
          color: Color(0xff030E22),
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 30),
            children: wishlistProvider.wishlist
                .map(
                  (product) => WishlistCard(product),
                )
                .toList(),
          ),
        ),
      );
    }

    return Column(
      children: [
        header(),
        wishlistProvider.wishlist.length == 0 ? emptyWishlist() : content()
      ],
    );
  }
}

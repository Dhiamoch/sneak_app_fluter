import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mobile/models/product_model.dart';
import 'package:mobile/providers/cart_provider.dart';
import 'package:mobile/providers/wishlist_provider.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatefulWidget {
  final ProductModel product;

  DetailPage(this.product);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);
    CartProvider cartProvider = Provider.of<CartProvider>(context);

    Future<void> showSuccessDialog() async {
      return showDialog(
        context: context,
        builder: (BuildContext context) => Container(
          width: MediaQuery.of(context).size.width - (2 * 30),
          child: AlertDialog(
            backgroundColor: Color(0xff2c3545),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            content: SingleChildScrollView(
                child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                  ),
                ),
                Image.asset(
                  'assets/icon_success.png',
                  width: 100,
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  "Hurray",
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  "Item added successfully",
                  style: GoogleFonts.poppins(
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                  width: 154,
                  height: 44,
                  child: TextButton(
                    style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        backgroundColor: Color(0xff6C5ECF)),
                    onPressed: () {
                      Navigator.pushNamed(context, "/cart");
                    },
                    child: Text(
                      "View My Cart",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            )),
          ),
        ),
      );
    }

    Widget header() {
      return Column(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: 20,
              left: 30,
              right: 30,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.chevron_left,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "/cart");
                  },
                  child: Icon(
                    Icons.shopping_bag,
                    color: Colors.black,
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 310,
            // width: MediaQuery.of(context).size.width,
            child: Image.network(
              widget.product.image_sho.image,
              fit: BoxFit.contain,
              width: 250,
            ),
          ),
        ],
      );
    }

    Widget content() {
      return Container(
        margin: EdgeInsets.only(top: 17),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(24),
          ),
          color: Color(0xff030E22),
        ),
        child: Expanded(
          child: Column(
            children: [
              // NOTE : header

              Container(
                padding: EdgeInsets.only(
                  bottom: 30,
                ),
                margin: EdgeInsets.only(top: 20, left: 30, right: 30),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.product.name,
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            widget.product.category.name,
                            style: GoogleFonts.poppins(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        wishlistProvider.setProduct(widget.product);

                        if (wishlistProvider.isWishlist(widget.product)) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.blue,
                              content: Text(
                                "Has been added to wishlist",
                                textAlign: TextAlign.center,
                              ),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.red,
                              content: Text(
                                "Has been removed from wishlist",
                                textAlign: TextAlign.center,
                              ),
                            ),
                          );
                        }
                      },
                      child: Image.asset(
                        wishlistProvider.isWishlist(widget.product)
                            ? "assets/button_wishlist_blue.png"
                            : "assets/button_wishlist.png",
                        width: 46,
                      ),
                    ),
                  ],
                ),
              ),

              // NOTE: PRICE
              Container(
                margin: EdgeInsets.only(
                  top: 20,
                  right: 30,
                  left: 30,
                ),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color(0xff2c3545),
                  borderRadius: BorderRadius.circular(
                    4,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Price",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      NumberFormat.currency(
                        locale: "id",
                        symbol: 'Rp ',
                        decimalDigits: 0,
                      ).format(widget.product.final_price),
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.blue,
                      ),
                    )
                  ],
                ),
              ),

              //Note: description
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(
                  top: 30,
                  left: 30,
                  right: 30,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Description",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      widget.product.description,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w300,
                        color: Colors.grey,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
              //NOTE: BUTTONS
              Container(
                width: double.infinity,
                margin: EdgeInsets.all(30),
                height: 54,
                child: TextButton(
                  onPressed: () {
                    cartProvider.addCart(widget.product);
                    showSuccessDialog();
                  },
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    backgroundColor: Color(0xff6C5ECF),
                  ),
                  child: Text(
                    "Add to Cart",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
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

    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          header(),
          Spacer(),
          content(),
        ],
      ),
    );
  }
}

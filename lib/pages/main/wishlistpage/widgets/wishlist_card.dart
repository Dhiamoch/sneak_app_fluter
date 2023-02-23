import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mobile/models/product_model.dart';
import 'package:mobile/providers/wishlist_provider.dart';
import 'package:provider/provider.dart';

class WishlistCard extends StatelessWidget {
  final ProductModel product;

  WishlistCard(this.product);
  @override
  Widget build(BuildContext context) {
    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);
    return Container(
      margin: EdgeInsets.only(
        top: 20,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
      decoration: BoxDecoration(
        color: Color(
          0xff2C3545,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  color: Colors.white,
                  child: Image.network(
                    product.image_sho.image,
                    width: 60,
                  ),
                ),
              ),
              SizedBox(
                width: 12,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      NumberFormat.currency(
                        locale: "id",
                        symbol: 'Rp ',
                        decimalDigits: 0,
                      ).format(product.final_price),
                      style: GoogleFonts.poppins(
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  wishlistProvider.setProduct(product);
                },
                child: Container(
                  height: 35,
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Color(0xff3babbe)),
                  child: Image.asset("assets/wishlist.png",
                      height: 30, color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

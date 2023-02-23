import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mobile/models/product_model.dart';
import 'package:mobile/pages/detail_page.dart';

class ProductTile extends StatelessWidget {
  final ProductModel product;
  String imageUrl;
  String name;
  String category;
  // String price;

  ProductTile(this.product);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(product),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(
          left: 30,
          right: 30,
          top: 20,
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                width: 120,
                height: 120,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Image.network(
                    product.image_sho.image,
                    fit: BoxFit.contain,
                  ),
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
                  product.category.name,
                  style: GoogleFonts.poppins(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  product.name,
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  NumberFormat.currency(
                    locale: "id",
                    symbol: 'Rp ',
                    decimalDigits: 0,
                  ).format(product.final_price),
                  style: GoogleFonts.poppins(
                    color: Colors.blue,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}

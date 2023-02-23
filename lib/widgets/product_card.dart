import 'package:intl/intl.dart';
import 'package:mobile/models/product_model.dart';
import 'package:mobile/pages/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductList extends StatelessWidget {
  final ProductModel product;
  String imageUrl;
  String name;
  String category;
  String price;

  ProductList(this.product);

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
        width: 170,
        height: 235,
        decoration: BoxDecoration(
          // color: Colors.blueGrey,
          borderRadius: BorderRadius.circular(20),
          // border: Border.all(
          //   // color: Color(0xff68687A),
          // ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                // width: 150,
                height: 130,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    color: Colors.white,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Image.network(
                          product.image_sho.image,
                          // width: 120,
                          // height: 140,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Text(
                product.category.name,
                style: GoogleFonts.poppins(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
              SizedBox(height: 5),
              Text(
                product.name,
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  color: Color(0xffF8F7FD),
                  fontWeight: FontWeight.w600,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              SizedBox(height: 5),
              Text(
                NumberFormat.currency(
                        locale: "id", symbol: 'Rp ', decimalDigits: 0)
                    .format(product.final_price),
                style: GoogleFonts.poppins(
                  color: Colors.blue,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

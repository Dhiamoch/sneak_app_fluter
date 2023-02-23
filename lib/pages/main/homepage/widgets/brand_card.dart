import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/models/product_model.dart';
import 'package:mobile/providers/product_provider.dart';
import 'package:provider/provider.dart';

class brandCard extends StatelessWidget {
  ProductModel product;
  String name;
  String category;
  String price;
  String imageUrl;
  String brandName;

  brandCard({
    this.imageUrl,
    this.brandName,
  });
  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider = Provider.of<ProductProvider>(context);

    return Container(
      width: 150,
      height: 70,
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(20),
        color: Colors.white,
      ),
      child: Column(children: [
        SizedBox(
          height: 10,
        ),
        Image.asset(
          imageUrl,
          height: 35,
          width: 70,
        ),
        SizedBox(
          height: 4,
        ),
        Text(
          brandName,
          style: GoogleFonts.poppins(
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        )
      ]),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/widgets/product_card.dart';
import 'package:mobile/providers/product_provider.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider = Provider.of<ProductProvider>(context);
    return Scaffold(
      backgroundColor: Color(0xff030E22),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
                child: Container(
                  height: 42,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Color(0xff2c3545),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Container(
                    width: double.infinity,
                    height: 42,
                    child: TextFormField(
                      style: GoogleFonts.poppins(color: Colors.white),
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(
                          top: 11,
                          bottom: 11,
                        ),
                        fillColor: Color(0xff2C3545),
                        filled: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(21),
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
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                child: Center(
                  child: Wrap(
                    spacing: 10,
                    runSpacing: 12,
                    children: productProvider.products
                        .map(
                          (product) => ProductList(product),
                        )
                        .toList(),
                  ),
                ),
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
        ),
      ),
    );
  }
}

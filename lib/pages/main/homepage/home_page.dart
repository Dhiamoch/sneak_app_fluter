import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/models/product_model.dart';
import 'package:mobile/pages/brand_page.dart';
import 'package:mobile/pages/main/homepage/widgets/brand_card.dart';
import 'package:mobile/pages/main/homepage/widgets/categories_tile.dart';
import 'package:mobile/pages/main/homepage/widgets/product_tile.dart';
import 'package:mobile/providers/product_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ProductModel product;
    ProductProvider productProvider = Provider.of<ProductProvider>(context);
    // handleGetbrand() async {
    //   if (await productProvider.getBrand(
    //     brand_id: 2,
    //   )) {
    //     Navigator.push(
    //       context,
    //       MaterialPageRoute(
    //         builder: (context) => BrandPage(product),
    //       ),
    //     );
    //   } else {
    //     ScaffoldMessenger.of(context).showSnackBar(
    //       SnackBar(
    //         backgroundColor: Colors.red,
    //         content: Text(
    //           "Gagal Get brand",
    //           textAlign: TextAlign.center,
    //         ),
    //       ),
    //     );
    //   }
    // }

    return Scaffold(
      backgroundColor: Color(0xff030E22),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 32.0,
                  left: 30,
                  right: 30,
                ),
                child: Text(
                  'Brands',
                  style: GoogleFonts.poppins(
                    color: Color(0xffF8F7FD),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 30),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SizedBox(width: 30),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: brandCard(
                            imageUrl: "assets/logo_nike.png",
                            brandName: "Nike",
                          ),
                        ),
                        brandCard(
                          imageUrl: "assets/logo_adidas.png",
                          brandName: "Adidas",
                        ),
                        brandCard(
                          imageUrl: "assets/logo_puma.png",
                          brandName: "Puma",
                        ),
                        brandCard(
                          imageUrl: "assets/logo_nb.png",
                          brandName: "New Balance",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 32.0,
                  left: 30,
                  right: 30,
                ),
                child: Text(
                  'Categories',
                  style: GoogleFonts.poppins(
                    color: Color(0xffF8F7FD),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    CategoriesTile(
                      text: 'Running',
                    ),
                    CategoriesTile(
                      text: 'Football',
                    ),
                    CategoriesTile(
                      text: 'Casual',
                    ),
                    CategoriesTile(
                      text: 'Hiking',
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32.0, left: 30, right: 30),
                child: Text(
                  'All Products',
                  style: GoogleFonts.poppins(
                    color: Color(0xffF8F7FD),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Column(
                children: productProvider.products
                    .map(
                      (product) => ProductTile(product),
                    )
                    .toList(),
              ),
              SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}

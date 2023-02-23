import 'package:flutter/material.dart';
import 'package:mobile/models/product_model.dart';
import 'package:mobile/pages/main/homepage/widgets/product_tile.dart';
import 'package:mobile/providers/product_provider.dart';
import 'package:provider/provider.dart';

class BrandPage extends StatelessWidget {
  final ProductModel product;

  BrandPage(this.product);
  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider = Provider.of<ProductProvider>(context);

    return Scaffold(
      backgroundColor: Color(0xff030E22),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: productProvider.products
                .map(
                  (product) => ProductTile(product),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}

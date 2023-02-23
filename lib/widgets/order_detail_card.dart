import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mobile/models/cart_model.dart';
import 'package:mobile/models/transaction_details_model.dart';

class OrderDetailCard extends StatelessWidget {
  final TransactionDetailsModel product;
  OrderDetailCard(this.product);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 12),
      padding: EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 12,
      ),
      decoration: BoxDecoration(
        color: Color(0xff2C3545),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                fit: BoxFit.contain,
                image: NetworkImage(product.products[0].imageSho.image),
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
                  product.products[0].name,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  NumberFormat.currency(
                    locale: "id",
                    symbol: 'Rp ',
                    decimalDigits: 0,
                  ).format(product.products[0].finalPrice),
                  style: GoogleFonts.poppins(
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 12,
          ),
          Row(
            children: [
              Text('${product.quantity} ',
                  style: GoogleFonts.poppins(
                    color: Colors.grey,
                    fontSize: 12,
                  )),
              Text(product.quantity > 1 ? "Items" : "Item",
                  style: GoogleFonts.poppins(
                    color: Colors.grey,
                    fontSize: 12,
                  )),
            ],
          ),
        ],
      ),
    );
  }
}

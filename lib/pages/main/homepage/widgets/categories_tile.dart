import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoriesTile extends StatelessWidget {
  String text;

  CategoriesTile({
    this.text,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      padding: EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 10,
      ),
      margin: EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.transparent,
          border: Border.all(color: Color(0xff504f5e))),
      child: Center(
        child: Text(
          text,
          style: GoogleFonts.poppins(
            fontSize: 12,
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

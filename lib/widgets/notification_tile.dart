import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/models/notif_model.dart';

class NotificationTile extends StatelessWidget {
  final NotifModel notif;

  NotificationTile(this.notif);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      margin: EdgeInsets.only(
        left: 30,
        right: 30,
        top: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Order ${notif.noOrder} has arrived!",
            style: GoogleFonts.poppins(
              color: Color(0xff6C5ECF),
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 8),
          Text(
            "${notif.contentNotification}",
            style: GoogleFonts.poppins(
              color: Colors.grey,
              fontSize: 12,
            ),
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Image.asset(
                'assets/grey_time.png',
                width: 16,
              ),
              SizedBox(width: 4),
              Text(
                "${notif.createdAt}",
                style: GoogleFonts.poppins(
                  color: Color(0xff8A99AB),
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

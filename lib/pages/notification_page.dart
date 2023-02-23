import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/providers/notif_provider.dart';
import 'package:mobile/widgets/notification_tile.dart';
import 'package:provider/provider.dart';

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    NotifProvider notifProvider = Provider.of<NotifProvider>(context);
    return Scaffold(
      backgroundColor: Color(0xff030E22),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 30),
              Center(
                child: Text(
                  'Notification',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 30),
              Column(
                children: notifProvider.notifs
                    .map(
                      (notif) => NotificationTile(notif),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

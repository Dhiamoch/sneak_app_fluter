import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/providers/auth_provider.dart';
import 'package:mobile/providers/order_history_provider.dart';
import 'package:mobile/providers/transaction_provider.dart';
import 'package:mobile/widgets/order_card.dart';
import 'package:provider/provider.dart';

class OrderHistory extends StatefulWidget {
  @override
  State<OrderHistory> createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  @override
  // void initState() {
  //   getInit();
  //   super.initState();
  // }

  // getInit() {}

  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    Future refresh() async {
      setState(() {
        Provider.of<OrderHistoryProvider>(context, listen: false)
            .getHistoryOrders(authProvider.user.id);
      });
    }

    Provider.of<OrderHistoryProvider>(
      context,
    ).getHistoryOrders(authProvider.user.id);

    OrderHistoryProvider orderHistoryProvider =
        Provider.of<OrderHistoryProvider>(context);

    Widget header() {
      return AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color(0xff030E22),
        title: Text(
          "Order History",
          style: GoogleFonts.poppins(
            color: Colors.white,
          ),
        ),
      );
    }

    Widget emptyOrder() {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/empty_cart.png",
              width: 80,
            ),
            SizedBox(height: 20),
            Text(
              "Opss! No transaction yet",
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              "Let's find your favorite shoes",
              style: GoogleFonts.poppins(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
            Container(
              width: 154,
              height: 44,
              margin: EdgeInsets.only(
                top: 20,
              ),
              child: TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: Color(0xff6C5ECF),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, "/home", (route) => false);
                },
                child: Text(
                  "Exprole Store",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget content() {
      return ListView(
        padding: EdgeInsets.only(
          left: 30,
          right: 30,
          bottom: 30,
        ),
        children: orderHistoryProvider.historyOrders
            .map(
              (history) => OrderCard(history),
            )
            .toList(),
      );
    }

    return Scaffold(
        backgroundColor: Color(0xff030E22),
        appBar: header() as PreferredSizeWidget,
        body: RefreshIndicator(
          onRefresh: refresh,
          child: orderHistoryProvider.historyOrders.length == 0
              ? emptyOrder()
              : content(),
        ));
  }
}

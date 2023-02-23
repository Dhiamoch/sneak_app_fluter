import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mobile/models/order_history_model.dart';
import 'package:mobile/pages/order_history_detail.dart';
import 'package:mobile/providers/auth_provider.dart';
import 'package:mobile/providers/cart_provider.dart';
import 'package:mobile/providers/order_history_provider.dart';
import 'package:provider/provider.dart';

class OrderCard extends StatefulWidget {
  final OrderHistoryModel history;
  OrderCard(this.history);

  @override
  State<OrderCard> createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  @override
  Widget build(BuildContext context) {
    OrderHistoryProvider orderHistoryProvider =
        Provider.of<OrderHistoryProvider>(context);
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    String formattedDate = DateFormat.yMMMEd().format(widget.history.createdAt);
    CartProvider cartProvider = Provider.of<CartProvider>(context);

    Future<void> showSuccessDialog() async {
      return showDialog(
        context: context,
        builder: (BuildContext context) => Container(
          width: MediaQuery.of(context).size.width - (2 * 30),
          child: AlertDialog(
            backgroundColor: Color(0xff2c3545),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            content: SingleChildScrollView(
                child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                  ),
                ),
                Image.asset(
                  'assets/icon_success.png',
                  width: 100,
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  "Are you sure?",
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  "The order has been received....?",
                  style: GoogleFonts.poppins(
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                  width: 154,
                  height: 44,
                  child: TextButton(
                    style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        backgroundColor: Color(0xff6C5ECF)),
                    onPressed: () async {
                      if (await orderHistoryProvider.updateSelesai(
                          email: authProvider.user.email,
                          noOrder: widget.history.noOrder))
                        Navigator.pushNamed(
                          context,
                          "/home",
                        );
                    },
                    child: Text(
                      "Yes",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            )),
          ),
        ),
      );
    }

    return Container(
      margin: EdgeInsets.only(
        top: 30,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
      decoration: BoxDecoration(
        color: Color(
          0xff2C3545,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  child: Row(
                children: [
                  Icon(
                    Icons.shopping_bag,
                    color: Colors.white,
                    size: 20,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Date",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      ),
                      Text(
                        formattedDate,
                        style: GoogleFonts.poppins(
                          color: Colors.grey,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ],
              )),
              Text(
                widget.history.statusOrder == 0
                    ? "Waiting Payment"
                    : widget.history.statusOrder == 1
                        ? "On Process"
                        : widget.history.statusOrder == 2
                            ? "On Sent"
                            : "Completed",
                style: GoogleFonts.poppins(
                  color: Colors.grey,
                  fontSize: 11,
                ),
              ),
            ],
          ),
          Divider(
            color: Colors.white,
          ),
          SizedBox(
            height: 4,
          ),
          widget.history.noResi != null
              ? Row(
                  children: [
                    Text(
                      "No. Resi : ${widget.history.noResi}",
                      style: GoogleFonts.poppins(
                        color: Colors.grey,
                        fontSize: 11,
                      ),
                    ),
                  ],
                )
              : SizedBox(),
          widget.history.noResi != null
              ? SizedBox(
                  height: 10,
                )
              : SizedBox(),
          Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    fit: BoxFit.contain,
                    image: NetworkImage(widget.history.transactionDetails[0]
                        .products[0].imageSho.image),
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
                      widget.history.transactionDetails[0].products[0].name,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "${widget.history.transactionDetails.length} ",
                          style: GoogleFonts.poppins(
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          widget.history.transactionDetails.length > 1
                              ? "Products"
                              : "Product",
                          style: GoogleFonts.poppins(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                children: [],
              )
            ],
          ),
          SizedBox(
            height: 12,
          ),
          SizedBox(
            width: 4,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Total :",
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: Colors.grey,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Text(
                    NumberFormat.currency(
                      locale: "id",
                      symbol: 'Rp ',
                      decimalDigits: 0,
                    ).format(widget.history.totalPay),
                    style: GoogleFonts.poppins(
                        color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  bool disablePressing = true;
                  widget.history.statusOrder == 0 ||
                          widget.history.statusOrder == 1
                      ? Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                HistoryDetails(widget.history),
                          ),
                        )
                      : widget.history.statusOrder == 2
                          ? showSuccessDialog()
                          : setState(() => disablePressing = false);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 9),
                  decoration: BoxDecoration(
                    color: Color(widget.history.statusOrder == 0
                        ? 0xff6C5ECF
                        : widget.history.statusOrder == 1
                            ? 0xff6C5ECF
                            : widget.history.statusOrder == 2
                                ? 0xff2FA1DA
                                : 0xff808080),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      widget.history.statusOrder == 0
                          ? "Details"
                          : widget.history.statusOrder == 1
                              ? "Details"
                              : widget.history.statusOrder == 2
                                  ? "Received"
                                  : "Done",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

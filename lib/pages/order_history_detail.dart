import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mobile/models/order_history_model.dart';
import 'package:mobile/models/user_model.dart';
import 'package:mobile/pages/order_history.dart';
import 'package:mobile/providers/auth_provider.dart';
import 'package:mobile/providers/order_history_provider.dart';
import 'package:mobile/providers/transaction_provider.dart';
import 'package:mobile/widgets/order_detail_card.dart';
import 'package:provider/provider.dart';
import "package:file_picker/file_picker.dart";

class HistoryDetails extends StatefulWidget {
  final OrderHistoryModel product;

  HistoryDetails(this.product);

  @override
  State<HistoryDetails> createState() => _HistoryDetailsState();
}

class _HistoryDetailsState extends State<HistoryDetails> {
  PlatformFile pickedFile;
  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    setState(() {
      pickedFile = result.files.first;
    });
  }

  @override
  Widget build(BuildContext context) {
    OrderHistoryProvider orderHistoryProvider =
        Provider.of<OrderHistoryProvider>(context);
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;

    final emailController = TextEditingController(text: user.email);
    Future uploadFile() async {
      final path = 'files/${widget.product.noOrder}/${pickedFile.name}';
      final file = File(pickedFile.path);
      final ref = FirebaseStorage.instance.ref().child(path);
      final uploadTask = ref.putFile(file);

      final snapshot = await uploadTask.whenComplete(() {});
      final urlDownload = await snapshot.ref.getDownloadURL();
      print("download Link: ${urlDownload}");
      if (await orderHistoryProvider.uploadProofOfPayment(
          email: emailController.text,
          images: urlDownload,
          noOrder: widget.product.noOrder)) {
        Navigator.pop(context);
      } else {}
    }

    Future cancelOrder() async {
      if (await orderHistoryProvider.cancelOrder(
          noOrder: widget.product.noOrder)) {
        Navigator.pushNamedAndRemoveUntil(context, "/home", (route) => false);
      }
      ;
    }

    Future<void> showSuccessDialog() async {
      return showDialog(
        context: context,
        builder: (BuildContext context) => Container(
          width: MediaQuery.of(context).size.width - (3 * 40),
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
                widget.product.proofOfPayment != null
                    ? Container(
                        child: Image.network(widget.product.proofOfPayment),
                      )
                    : pickedFile != null
                        ? Container(
                            child: Image.file(File(pickedFile.path)),
                          )
                        : Container(
                            width: 150,
                            child: ElevatedButton(
                              onPressed: selectFile,
                              child: Text(
                                "Select file",
                                style: GoogleFonts.poppins(color: Colors.white),
                              ),
                            ),
                          ),
                SizedBox(
                  height: 12,
                ),
                if (pickedFile != null)
                  Container(
                    width: 150,
                    child: ElevatedButton(
                      onPressed: uploadFile,
                      child: Text(
                        "Upload Image",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                SizedBox(
                  height: 12,
                ),
              ],
            )),
          ),
        ),
      );
    }

    Future<void> showCancelDialog() async {
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
                Icon(
                  Icons.warning_amber,
                  size: 90,
                  color: Colors.red,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Cancel Order",
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Are you sure want to \ncancel this order ?",
                  style: GoogleFonts.poppins(
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                  width: 100,
                  height: 35,
                  child: TextButton(
                    style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        backgroundColor: Colors.red),
                    onPressed: cancelOrder,
                    child: Text(
                      "Yes",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 100,
                  height: 35,
                  child: TextButton(
                    style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        backgroundColor: Colors.blue),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "No",
                      style: GoogleFonts.poppins(
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

    return Scaffold(
      backgroundColor: Color(0xff030E22),
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color(0xff030E22),
        title: Text(
          "Order Details",
          style: GoogleFonts.poppins(
            color: Colors.white,
          ),
        ),
        actions: [
          if (widget.product.paymentStatusId == 1)
            IconButton(
                onPressed: showCancelDialog,
                icon: Icon(
                  Icons.delete_forever,
                  color: Colors.white,
                ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30.0, top: 20, right: 30),
              child: Text(
                'Shipping Information',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0, top: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/landmark_icon.png',
                    width: 40,
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user.name,
                        style: GoogleFonts.poppins(
                          color: Color(0xffF8F7FD),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        user.phone_number,
                        style: GoogleFonts.poppins(
                          color: Color(0xffF8F7FD),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        user.address,
                        style: GoogleFonts.poppins(
                          color: Color(0xffCFCFCF),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24.0, left: 30, right: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Items',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Column(
                    children: widget.product.transactionDetails
                        .map((product) => OrderDetailCard(product))
                        .toList(),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: Text(
                      'Payment Method',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Image.asset(
                        'assets/bni_logo.png',
                        width: 40,
                      ),
                      SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Bank Transfer',
                            style: GoogleFonts.poppins(
                              color: Color(0xffF8F7FD),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            'Rekening Number : 4544-0921-888',
                            style: GoogleFonts.poppins(
                              color: Color(0xffCFCFCF),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  if (widget.product.proofOfPayment != null)
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Proof of Payment',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Center(
                              child:
                                  Image.network(widget.product.proofOfPayment))
                        ],
                      ),
                    ),
                  SizedBox(height: 24),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xff030E22),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Text(
                NumberFormat.currency(
                  locale: "id",
                  symbol: 'Rp ',
                  decimalDigits: 0,
                ).format(widget.product.totalPay),
                style: GoogleFonts.poppins(
                  color: Color(0xffF8F7FD),
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              label: ''),
          BottomNavigationBarItem(
            icon: Container(
              width: 130,
              height: 53,
              child: TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: Color(0xff6C5ECF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    )),
                onPressed: () {
                  bool disablePressing = true;
                  widget.product.paymentStatusId == 1
                      ? showSuccessDialog()
                      : setState(() => disablePressing = false);
                  ;
                },
                child: Column(
                  children: [
                    Column(
                      children: [
                        Text(
                          widget.product.paymentStatusId == 2 &&
                                  widget.product.statusOrder == 1
                              ? 'Verified'
                              : widget.product.paymentStatusId == 1
                                  ? 'Complete'
                                  : 'Waiting for',
                          style: GoogleFonts.poppins(
                            color: Color(0xffF8F7FD),
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          widget.product.paymentStatusId == 2 &&
                                  widget.product.statusOrder == 1
                              ? 'Payment'
                              : widget.product.paymentStatusId == 1
                                  ? 'Payment'
                                  : 'Verifications',
                          style: GoogleFonts.poppins(
                            color: Color(0xffF8F7FD),
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            label: '',
          )
        ],
      ),
    );
  }
}

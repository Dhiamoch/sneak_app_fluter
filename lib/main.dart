import 'package:mobile/pages/order_history_detail.dart';
import 'package:mobile/pages/edit_profile.dart';
import 'package:mobile/pages/main/cartpage/cart_page.dart';
import 'package:mobile/pages/main/main_page.dart';
import 'package:mobile/pages/login_page.dart';
import 'package:mobile/pages/checkoutpage/checkout_details.dart';
import 'package:mobile/pages/order_history.dart';
import 'package:mobile/pages/payment_success.dart';
import 'package:mobile/pages/product_page.dart';
import 'package:mobile/pages/main/profilepage/profile_page.dart';
import 'package:mobile/pages/register_page.dart';
import 'package:mobile/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:mobile/providers/auth_provider.dart';
import 'package:mobile/providers/cart_provider.dart';
import 'package:mobile/providers/notif_provider.dart';
import 'package:mobile/providers/order_history_provider.dart';
import 'package:mobile/providers/product_provider.dart';
import 'package:mobile/providers/transaction_provider.dart';
import 'package:mobile/providers/wishlist_provider.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(SneakApp());
}

class SneakApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => NotifProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => TransactionProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => WishlistProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => OrderHistoryProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashPage(),
          "/login": (context) => LoginPage(),
          "/register": (context) => RegisterPage(),
          "/home": (context) => MainPage(),
          "/product": (context) => ProductPage(),
          "/profile": (context) => ProfilePage(),
          "/edit-profile": (context) => EditProfilePage(),
          "/cart": (context) => CartPage(),
          "/checkout": (context) => OrderDetails(),
          "/checkout-success": (context) => PaymentSuccess(),
        },
      ),
    );
  }
}

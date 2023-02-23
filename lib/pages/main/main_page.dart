import 'package:flutter/material.dart';
import 'package:mobile/pages/main/cartpage/cart_page.dart';
import 'package:mobile/pages/main/homepage/home_page.dart';
import 'package:mobile/pages/main/profilepage/profile_page.dart';
import 'package:mobile/pages/main/wishlistpage/wishlist_page.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    bool keyboardIsOpen = MediaQuery.of(context).viewInsets.bottom != 0;

    Widget cartButton() {
      return Visibility(
        visible: !keyboardIsOpen,
        child: FloatingActionButton(
            backgroundColor: Color(0xff3babbe),
            onPressed: () {
              Navigator.pushNamed(context, '/cart');
            },
            child: Icon(Icons.shopping_bag)),
      );
    }

    Widget customButtomNav() {
      return ClipRRect(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(0),
        ),
        child: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 8,
          clipBehavior: Clip.antiAlias,
          child: BottomNavigationBar(
              backgroundColor: Color(0xff252836),
              currentIndex: currentIndex,
              onTap: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  icon: Container(
                    margin: EdgeInsets.only(
                      top: 10,
                    ),
                    child: Image.asset(
                      "assets/navbar_homeon.png",
                      width: 20,
                      color: currentIndex == 0
                          ? Color(0xff6C5ECF)
                          : Color(0xff808191),
                    ),
                  ),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Image.asset(
                      "assets/wishlist.png",
                      width: 20,
                      color: currentIndex == 1
                          ? Color(0xff6C5ECF)
                          : Color(0xff808191),
                    ),
                  ),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Icon(
                      Icons.shopping_bag,
                      color: currentIndex == 2
                          ? Color(0xff6C5ECF)
                          : Color(0xff808191),
                    ),
                  ),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Image.asset(
                      "assets/navbar_profileon.png",
                      width: 20,
                      color: currentIndex == 3
                          ? Color(0xff6C5ECF)
                          : Color(0xff808191),
                    ),
                  ),
                  label: "",
                )
              ]),
        ),
      );
    }

    Widget body() {
      switch (currentIndex) {
        case 0:
          return HomePage();
          break;
        case 1:
          return WishlistPage();
          break;
        case 2:
          return CartPage();
          break;
        case 3:
          return ProfilePage();
          break;
        default:
          return SizedBox.shrink();
      }
    }

    return Scaffold(
      backgroundColor: Color(0xff030E22),
      // floatingActionButton: cartButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: customButtomNav(),
      body: body(),
    );
  }
}

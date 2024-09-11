import 'package:flutter/material.dart';
// import 'package:mahesh_map/home_page/About_page.dart';
// import 'package:mahesh_map/home_page/Review_page.dart';
import 'package:mahesh_map/home_page/donation_page.dart';
import 'package:mahesh_map/home_page/foodList_page.dart';
import 'package:mahesh_map/home_page/nearLocation.dart';
import 'package:mahesh_map/home_page/survice.dart';

class Dropdown extends StatefulWidget {
  const Dropdown({super.key});

  @override
  State<Dropdown> createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  String? username;
  String? gmail;
  Map<String, dynamic> Updatedata = {};
  @override
  void initState() {
    super.initState();
  }

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: const Color(0xffFFF8DC),
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text(
                "Anna Canteen",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              accountEmail: Text(''),
              decoration: BoxDecoration(color: Colors.orange),
              currentAccountPicture: CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 255, 255, 255),
                  child: Icon(
                    Icons.person,
                    size: 40.0,
                    color: Color(0xffD3D3D3),
                  )),
            ),
            ListTile(
              leading: Icon(
                Icons.food_bank_sharp,
                color: Colors.orange.shade800,
              ),
              title: const Text('Food menu'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const FoodList()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.star,
                color: Colors.orange.shade800,
              ),
              title: const Text('Feedback reviews'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RatingPage()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.currency_rupee,
                color: Colors.orange.shade800,
              ),
              title: const Text('Donation'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DonetionPage()));
              },
            ),
            // ListTile(
            //   leading: Icon(
            //     Icons.file_open_rounded,
            //     color: Colors.orange.shade800,
            //   ),
            //   title: const Text('About'),
            //   onTap: () {
            //     Navigator.push(context,
            //         MaterialPageRoute(builder: (context) => Reviewis()));
            //   },
            // ),
            ListTile(
              leading: Icon(
                Icons.location_on,
                color: Colors.orange.shade800,
              ),
              title: const Text('Canteens Location'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LocationSelector()));
              },
            ),
          ],
        ));
  }
}

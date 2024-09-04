import 'package:flutter/material.dart';
import 'package:mahesh_map/home_page/day_menu_list/Friday.dart';
import 'package:mahesh_map/home_page/day_menu_list/Saturday.dart';
import 'package:mahesh_map/home_page/day_menu_list/Thursday.dart';
import 'package:mahesh_map/home_page/day_menu_list/Tuesday.dart';
import 'package:mahesh_map/home_page/day_menu_list/Wednesday.dart';
import 'package:mahesh_map/home_page/day_menu_list/monday.dart';

class FoodList extends StatefulWidget {
  const FoodList({super.key});

  @override
  State<FoodList> createState() => _FoodList();
}

class _FoodList extends State<FoodList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Food list',style:
            TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.white),
          ),
          backgroundColor: const Color(0xffE20736),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 1, left: 5, right: 5),
                child: Container(
                    height: 250,
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    // margin: EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                        // borderRadius: BorderRadius.circular(40),
                        image: DecorationImage(
                            image: AssetImage('assets/images/banner-1.png')))),
              ),
              const Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      Expanded(
                          child: Divider(
                        color: Color(0xff3C3B3B),
                        thickness: 3,
                      )),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          'Our Menu',
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              color: Color(0xffE20736),
                              fontSize: 24),
                        ),
                      ),
                      Expanded(
                          child: Divider(
                        color: Color(0xff3C3B3B),
                        thickness: 3,
                      ))
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const monday(),
              const Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Divider(
                  color: Colors.black12,
                  thickness: 1,
                ),
              ),
              const Tuesday(),
              const Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Divider(
                  color: Colors.black12,
                  thickness: 1,
                ),
              ),
              const Wednesday(),
              const Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Divider(
                  color: Colors.black12,
                  thickness: 1,
                ),
              ),
              Thursday(),
              const Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Divider(
                  color: Colors.black12,
                  thickness: 1,
                ),
              ),
              const Friday(),
              const Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Divider(
                  color: Colors.black12,
                  thickness: 1,
                ),
              ),
              const Saturday(),
            ],
          ),
        ));
  }
}

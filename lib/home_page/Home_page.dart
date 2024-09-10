import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mahesh_map/home_page/banner_page.dart';
import 'package:mahesh_map/home_page/donation_page.dart';
import 'package:mahesh_map/home_page/dropdown.dart';
import 'package:mahesh_map/home_page/foodList_page.dart';
import 'package:mahesh_map/home_page/survice.dart';

import 'package:geocoding/geocoding.dart';

class LocationService {
  Future<Position> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    // Check for location permissions
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // Get the current location
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController locationController = TextEditingController();
  String address = 'Address: ';

  @override
  void initState() {
    super.initState();
    _getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffffd300),
        title: Text(
          'Welcome to Anna Canteen',
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 18,
              color: Colors.brown[800]),
        ),
        centerTitle: true,
        // actions: [
        //   Container(
        //     width: 70,
        //     height: 100,
        //     margin: const EdgeInsets.all(2),
        //     decoration: const BoxDecoration(
        //       color: Colors.orange,
        //       shape: BoxShape.circle,
        //       image: DecorationImage(
        //         image: AssetImage('assets/images/party.png'),
        //       ),
        //     ),
        //   ),
        // ],
      ),
      drawer: const Dropdown(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 1),
              decoration: const BoxDecoration(color: Color(0xffE20736)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        _getLocation();
                      },
                      icon: const Icon(
                        Icons.location_on_rounded,
                        color: Color(0xffFFD300),
                        size: 30,
                      ),
                    ),
                    const SizedBox(width: 8),
                    SizedBox(
                      width: 280,
                      child: Text(
                        locationController.text,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 15),
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const banner(), // Ensure `BannerPage` is a valid widget
            const Padding(
              padding: EdgeInsets.all(18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Support & Feedback',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Icon(
                    Icons.more_horiz,
                    size: 30,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: Column(
                children: [
                  _ourServices('assets/images/food.png', "Food Menu", () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const FoodList(), // Ensure `FoodList` is a valid widget
                      ),
                    );
                  }),
                  _ourServices("assets/images/review.png", "Feedback Reviews",
                      () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const RatingPage(), // Ensure `RatingPage` is a valid widget
                      ),
                    );
                  }),
                  _ourServices("assets/images/donate.png", "Donation", () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DonetionPage(), // Ensure `DonationPage` is a valid widget
                      ),
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _ourServices(String image, String title, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        height: 90,
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xffFFF8DC),
          borderRadius: BorderRadius.circular(10),
        ),
        child: CupertinoButton(
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Image(image: AssetImage(image)),
                  ),
                  SizedBox(width: 10),
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              const Icon(
                Icons.more_vert,
                size: 40,
                color: Color(0xff853232),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _getLocation() async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        return Future.error('Location services are disabled.');
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission != LocationPermission.whileInUse &&
            permission != LocationPermission.always) {
          return Future.error('Location permissions are denied.');
        }
      }

      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      _getAddress(position.latitude, position.longitude);
    } catch (e) {
      print('Error getting location: $e');
    }
  }

  Future<void> _getAddress(double latitude, double longitude) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        latitude,
        longitude,
      );

      if (placemarks.isNotEmpty) {
        Placemark addressPlacemark = placemarks[0];
        String formattedAddress =
            '${addressPlacemark.subLocality}, ${addressPlacemark.locality}';
        print("Formatted Address: $formattedAddress");

        setState(() {
          locationController.text = formattedAddress;
          address = formattedAddress;
        });
      } else {
        print('No address found for the provided coordinates.');
        setState(() {
          locationController.text = 'No address found';
          address = 'No address found';
        });
      }
    } catch (e) {
      print('Error getting address: $e');
      setState(() {
        locationController.text = 'Error getting address';
        address = 'Error getting address';
      });
    }
  }
}

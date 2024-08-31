import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingPage extends StatefulWidget {
  const RatingPage({super.key});

  @override
  _RatingPage createState() => _RatingPage();
}

class _RatingPage extends State<RatingPage> {
  double _rating = 0;
  bool _foodQualityChecked = false;
  bool _cleaningQualityChecked = false;

  double _foodrating = 0;

  void _submitRating(double rating) {
    // Implement your rating submission logic here
    print("Rating submitted: $rating");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffE20736),
        title: const Text(
          'Rate our Hygiene & Quality food ',
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20, color: Colors.white),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xfffff2f2)),
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Anna Canteen',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    const SizedBox(height: 10),
                    const Row(
                      children: [
                        Icon(
                          Icons.location_on_rounded,
                          color: Colors.red,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text('Rahamundry, Andhra Pradesh')
                      ],
                    ),
                    Divider(
                      color: Colors.red.shade200,
                      thickness: 1,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      height: 80,
                      width: double.infinity,
                      color: const Color(0xffe4f7e1),
                      child: Stack(
                        children: [
                          Container(
                            width: 80,
                            height: 80,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage('assets/images/dish.png'),
                              ),
                            ),
                          ),
                          Positioned(
                              left: 80,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Food Quality Reviews',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  RatingBar.builder(
                                    initialRating: _foodrating,
                                    minRating: 1,
                                    itemSize: 30,
                                    itemBuilder: (context, _) => const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    onRatingUpdate: (rating) {
                                      setState(() {
                                        _foodrating = rating;
                                      });
                                      _submitRating(rating);
                                    },
                                  ),
                                ],
                              ))
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      height: 80,
                      width: double.infinity,
                      color: const Color(0xffd9f3ff),
                      child: Stack(
                        children: [
                          Container(
                            width: 80,
                            height: 80,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage('assets/images/clean.png'),
                              ),
                            ),
                          ),
                          Positioned(
                              left: 80,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Cleaning Service Reviews',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  RatingBar.builder(
                                    initialRating: _rating,
                                    minRating: 1,
                                    itemSize: 30,
                                    itemBuilder: (context, _) => const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    onRatingUpdate: (rating) {
                                      setState(() {
                                        _rating = rating;
                                      });
                                      _submitRating(rating);
                                    },
                                  ),
                                ],
                              ))
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xffE20736),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            minimumSize: const Size(double.infinity, 50)),
                        child: const Text(
                          'Submit',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ))
                  ],
                ),
              ),
            ),
          ),
          //const SizedBox(height: 20),
        ],
      ),
    );
  }
}

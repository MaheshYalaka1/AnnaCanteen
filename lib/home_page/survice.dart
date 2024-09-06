import 'dart:convert';
import 'package:http/http.dart' as http;
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
  String? disId;

  double _foodrating = 0;
  Map<String, dynamic>? selectedEvent;
  bool isLoading = false;
  List<Map<String, dynamic>> eventList = [];
  Map<String, dynamic>? selected;
  List<Map<String, dynamic>> stateList = [];
  Map<String, dynamic>? selectedState;
  List<Map<String, dynamic>> cityslist = [];
  Map<String, dynamic>? selectedCity;

  void _submitRating(double rating) {
    // Implement your rating submission logic here
    print("Rating submitted: $rating");
  }

  @override
  void initState() {
    Countysget();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffE20736),
        title: const Text(
          'Rate our Hygiene & Quality food ',
          style: TextStyle(
              fontWeight: FontWeight.w700, fontSize: 20, color: Colors.white),
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
                    DropdownButtonFormField<Map<String, dynamic>>(
                      value: selectedEvent,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        hintText: "Please select County",
                        hintStyle: const TextStyle(color: Colors.black26),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(9.0),
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 246, 245, 245),
                            width: 1.0,
                          ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 16),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange.shade400),
                        ),
                        fillColor: Color(0xffff8f),
                        filled: true,
                      ),
                      onChanged: (Map<String, dynamic>? newValue) {
                        setState(() {
                          selectedEvent = newValue;
                          selectedState = null;
                          stateList = [];
                          print('Selected country: $selectedEvent');
                          disId = selectedEvent!['id'].toString();
                          print('just id $disId');
                        });
                        StatesApi();
                      },
                      items: eventList
                          .map<DropdownMenuItem<Map<String, dynamic>>>(
                              (Map<String, dynamic> value) {
                        return DropdownMenuItem<Map<String, dynamic>>(
                          value: value,
                          child: Text(
                            value['name'],
                            style:
                                const TextStyle(fontWeight: FontWeight.normal),
                          ),
                        );
                      }).toList(),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please select County";
                        }
                        return null;
                      },
                    ),
                    DropdownButtonFormField<Map<String, dynamic>>(
                      value: selectedState,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        hintText: "Please select State",
                        hintStyle: const TextStyle(color: Colors.black26),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(9.0),
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 246, 245, 245),
                            width: 1.0,
                          ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 16),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange.shade400),
                        ),
                        fillColor: Color(0xffff8f),
                        filled: true,
                      ),
                      onChanged: (Map<String, dynamic>? newValue) {
                        setState(() {
                          selectedState = newValue;
                          String selecteddata = selectedEvent!['id'].toString();
                          print('selecteddata$selecteddata');
                          print('Selected state: $selectedState');
                        });
                        cityesApis();
                      },
                      items: stateList
                          .map<DropdownMenuItem<Map<String, dynamic>>>(
                              (Map<String, dynamic> value) {
                        return DropdownMenuItem<Map<String, dynamic>>(
                          value: value,
                          child: Text(
                            value['name'],
                            style:
                                const TextStyle(fontWeight: FontWeight.normal),
                          ),
                        );
                      }).toList(),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please select State";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    DropdownButtonFormField<Map<String, dynamic>>(
                      value: selectedCity,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        hintText: "Please select City",
                        hintStyle: const TextStyle(color: Colors.black26),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(9.0),
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 246, 245, 245),
                            width: 1.0,
                          ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 16),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange.shade400),
                        ),
                        fillColor: Color(0xffff8f),
                        filled: true,
                      ),
                      onChanged: cityslist.isNotEmpty
                          ? (Map<String, dynamic>? newValue) {
                              setState(() {
                                selectedCity = newValue;
                                print('Selected city: $selectedCity');
                              });
                            }
                          : null,
                      items: cityslist
                          .map<DropdownMenuItem<Map<String, dynamic>>>(
                              (Map<String, dynamic> value) {
                        return DropdownMenuItem<Map<String, dynamic>>(
                          value: value,
                          child: Text(
                            value['name'],
                            style:
                                const TextStyle(fontWeight: FontWeight.normal),
                          ),
                        );
                      }).toList(),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please select City";
                        }
                        return null;
                      },
                    ),
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
                        onPressed: () {
                          PostRevices();
                        },
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

  Future<void> PostRevices() async {
    setState(() {
      isLoading = true;
    });

    String url = 'http://20.192.27.119/apac/updatereviews.aspx';
    Map<String, String> data = {
      'FoodQualityRating': '4',
      'CleaningServiceRating': '5',
      'ReviewDate': '2024-09-02 00:00:00',
      'CanteenLocation': 'local'
    };
    print("maheshtest:$data");

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: data,
      );

      if (response.statusCode == 200) {
        String contentType = response.headers['content-type'] ?? '';

        if (contentType.contains('application/json')) {
          final jsondata = jsonDecode(response.body);
          print('response: $jsondata');
        } else {
          // Handle non-JSON response
          print('response (non-JSON): ${response.body}');
        }

        setState(() {});
      } else {
        print('Request failed with status: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (e) {
      print('Error: $e');
    }

    setState(() {
      isLoading = false;
    });
  }

  Future<void> cityesApis() async {
    String Stateid = selectedState!['id'].toString();
    print("Stateid:$Stateid");
    String url =
        'http://20.192.27.119/apac/DistrictHandler.ashx?action=getCanteens&districtId=$disId&villageid=$Stateid';
    print('Stateid: $Stateid');

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
        },
      );

      if (response.statusCode == 200) {
        final jsondata = jsonDecode(response.body) as List<dynamic>;
        print('Cities data: $jsondata');

        setState(() {
          cityslist = jsondata.map((item) {
            return {
              'id': item['id'].toString(),
              'name': item['Name'].toString(), // Correct key
            };
          }).toList();
          // Optionally set the default value for selectedCity if needed
          if (cityslist.isNotEmpty) {
            selectedCity = cityslist[0];
          }
        });
      } else {
        print('Failed to get cities');
        print('Response body: ${response.body}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> Countysget() async {
    String url =
        'http://20.192.27.119/apac/DistrictHandler.ashx?action=getDistricts';
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          // 'Authorization':
          //     'Basic ' + base64Encode(utf8.encode('ellostars:ellostars')),
        },
      );
      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);
        setState(() {
          List<dynamic> data = result;
          for (var item in data) {
            eventList.add({
              'id': item['id'],
              'name': item['name'],
            });
          }
        });
      } else {
        print('Not able to get countries');
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  Future<void> StatesApi() async {
    String url =
        'http://20.192.27.119/apac/DistrictHandler.ashx?action=getVillages&districtId=$disId';

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          // 'Authorization': basicAuth,
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        // body: data,
      );

      if (response.statusCode == 200) {
        final jsondata = jsonDecode(response.body);
        print('States data: $jsondata');
        setState(() {
          List<dynamic> data = jsondata;
          for (var item in data) {
            stateList.add({
              'id': item['id'],
              'name': item['name'],
            });
          }
        });
      } else {
        print('Failed to get states');
        print('Response body: ${response.body}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}

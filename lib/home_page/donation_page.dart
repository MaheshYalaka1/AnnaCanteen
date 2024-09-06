import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DonetionPage extends StatefulWidget {
  const DonetionPage({super.key});

  @override
  State<DonetionPage> createState() => _DonetionPageState();
}

class _DonetionPageState extends State<DonetionPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController amount = TextEditingController();

  TextEditingController name2Controller = TextEditingController();
  TextEditingController phone2Controller = TextEditingController();
  Map<String, dynamic>? selectedEvent;
  List<Map<String, dynamic>> eventList = [];
  String? disId;
  Map<String, dynamic>? selected;
  List<Map<String, dynamic>> stateList = [];
  Map<String, dynamic>? selectedState;
  List<Map<String, dynamic>> cityslist = [];
  Map<String, dynamic>? selectedCity;

  String selectedOption = "Contribution on Special Occasion";
  String locationType = "Preferred location";
  String state = "state";
  String? selectedDistrict;

  // String? selectedCity; // Selected city from dropdown
  String? selectedAddress; // Selected address from dropdown

  // String selectedState = "State";

  bool isBreakfast = false;
  bool isLunch = false;
  bool isDinner = false;
  bool donation = false;

  bool isBreakfast1 = false;
  bool isLunch1 = false;
  bool isDinner1 = false;

  double breakfastAmount = 5950;
  double lunchAmount = 0;
  double dinnerAmount = 0;
  double totalAmount = 0;

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
        title: const Text('Donation',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 350,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/image.jpg'),
                      fit: BoxFit.cover)),
            ),
            const SizedBox(
              height: 10,
            ),
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'End Hunger Today',
                  style: TextStyle(
                      fontSize: 26,
                      color: Colors.red,
                      fontWeight: FontWeight.w900),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Donate Food, Spread Hope',
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.brown,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(left: 50, right: 50),
              child: Divider(
                thickness: 1,
                color: Colors.orange,
              ),
            ),
            // SizedBox(height: 20,),

            RadioListTile<String>(
              title: const Text(
                'Donation',
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 22,
                    fontWeight: FontWeight.w600),
              ),
              value: 'Donation',
              groupValue: selectedOption,
              onChanged: (value) {
                setState(() {
                  selectedOption = value!;
                });
              },
              activeColor: Colors.amber.shade900,
            ),
            if (selectedOption == 'Donation')
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: nameController,
                        decoration: const InputDecoration(
                          labelText: 'Full Name',
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                          hintText: 'Enter your full name',
                          hintStyle: TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.orange,
                          ),
                        ),
                        keyboardType: TextInputType.text,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: phoneController,
                        decoration: const InputDecoration(
                          labelText: 'Phone Number',
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                          hintText: 'Enter your mobile number',
                          hintStyle: TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(
                            Icons.phone_android,
                            color: Colors.orange,
                          ),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: amount,
                        decoration: const InputDecoration(
                          labelText: 'Donation Amount',
                          labelStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w900),
                          hintText: 'Enter Amount',
                          hintStyle: TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(
                            Icons.currency_rupee,
                            color: Colors.orange,
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please Enter amount";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: double.infinity,
                        height: 60,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              sendPostRequest(amount.text, phoneController.text,
                                  nameController.text);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  10), // Set the border radius to 10
                            ),
                          ),
                          child: const Text(
                            'Donate now',
                            style: TextStyle(fontSize: 24),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            const Padding(
              padding: EdgeInsets.only(left: 100, right: 100),
              child: Divider(
                thickness: 1,
                color: Colors.grey,
              ),
            ),

            RadioListTile<String>(
              title: const Text('Contribution on Special Occasion',
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 22,
                      fontWeight: FontWeight.w600)),
              value: 'Contribution on Special Occasion',
              groupValue: selectedOption,
              onChanged: (value) {
                setState(() {
                  selectedOption = value!;
                });
              },
              activeColor: Colors.amber.shade900,
            ),
            if (selectedOption == 'Contribution on Special Occasion')
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    TextFormField(
                      controller: name2Controller,
                      decoration: const InputDecoration(
                        labelText: 'Full Name',
                        labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                        hintText: 'Enter your full name',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.orange,
                        ),
                      ),
                      keyboardType: TextInputType.text,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: phone2Controller,
                      decoration: const InputDecoration(
                        labelText: 'Phone Number',
                        labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                        hintText: 'Enter your mobile number',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(
                          Icons.phone_android,
                          color: Colors.orange,
                        ),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Date',
                        labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                        hintText: 'Enter your mobile number',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(
                          Icons.date_range,
                          color: Colors.orange,
                        ),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    RadioListTile<String>(
                      title: Text('State',
                          style: TextStyle(
                              color: Colors.lime[900],
                              fontSize: 20,
                              fontWeight: FontWeight.w600)),
                      value: "state",
                      groupValue: locationType,
                      onChanged: (value) {
                        setState(() {
                          locationType = value!;
                        });
                      },
                      activeColor: Colors.amber.shade800,
                    ),
                    if (locationType == 'state')
                      Column(
                        children: [
                          CheckboxListTile(
                            title: const Text(
                              "Breakfast",
                              style: TextStyle(fontSize: 20),
                            ),
                            value: isBreakfast,
                            onChanged: (newValue) {
                              setState(() {
                                isBreakfast = newValue!;
                                calculateTotal();
                              });
                            },
                          ),
                          if (isBreakfast) ...[
                            Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(10),
                                color: const Color(0xffffecec),
                                child: const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Beneficiaries per Canteen',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      '350',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w900),
                                    ),
                                  ],
                                )),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(10),
                                color: const Color(0xffffdbda),
                                child: const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Number of Canteens',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      '100',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w900),
                                    ),
                                  ],
                                )),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(10),
                                color: const Color(0xffffecec),
                                child: const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Meal Price',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      '17',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w900),
                                    ),
                                  ],
                                )),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(10),
                                color: const Color(0xffe37c31),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Amount: ",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white),
                                    ),
                                    Text(
                                      '$breakfastAmount',
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w900,
                                          color: Colors.white),
                                    ),
                                  ],
                                )),
                          ],
                          CheckboxListTile(
                            title: const Text(
                              "Lunch",
                              style: TextStyle(fontSize: 20),
                            ),
                            value: isLunch,
                            onChanged: (newValue) {
                              setState(() {
                                isLunch = newValue!;
                                lunchAmount = isLunch ? 1015000 : 0;
                                calculateTotal();
                              });
                            },
                          ),
                          if (isLunch) ...[
                            Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(10),
                                color: const Color(0xffffecec),
                                child: const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Beneficiaries per Canteen',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      '350',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w900),
                                    ),
                                  ],
                                )),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(10),
                                color: const Color(0xffffdbda),
                                child: const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Number of Canteens',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      '100',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w900),
                                    ),
                                  ],
                                )),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(10),
                                color: const Color(0xffffecec),
                                child: const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Meal Price',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      '29',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w900),
                                    ),
                                  ],
                                )),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(10),
                                color: const Color(0xffe37c31),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Amount: ",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white),
                                    ),
                                    Text(
                                      '$lunchAmount',
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w900,
                                          color: Colors.white),
                                    ),
                                  ],
                                )),
                          ],
                          CheckboxListTile(
                            title: const Text(
                              "Dinner",
                              style: TextStyle(fontSize: 20),
                            ),
                            value: isDinner,
                            onChanged: (newValue) {
                              setState(() {
                                isDinner = newValue!;
                                dinnerAmount = isDinner ? 1015000 : 0;
                                calculateTotal();
                              });
                            },
                          ),
                          if (isDinner) ...[
                            Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(10),
                                color: const Color(0xffffecec),
                                child: const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Beneficiaries per Canteen',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      '350',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w900),
                                    ),
                                  ],
                                )),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(10),
                                color: const Color(0xffffdbda),
                                child: const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Number of Canteens',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      '100',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w900),
                                    ),
                                  ],
                                )),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(10),
                                color: const Color(0xffffecec),
                                child: const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Meal Price',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      '29',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w900),
                                    ),
                                  ],
                                )),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(10),
                                color: const Color(0xffe37c31),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Amount: ",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white),
                                    ),
                                    Text(
                                      '$lunchAmount',
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w900,
                                          color: Colors.white),
                                    ),
                                  ],
                                )),
                          ],
                        ],
                      ),
                    RadioListTile<String>(
                      title: Text('District',
                          style: TextStyle(
                              color: Colors.lime[900],
                              fontSize: 20,
                              fontWeight: FontWeight.w600)),
                      value: 'District',
                      groupValue: locationType,
                      onChanged: (value) {
                        setState(() {
                          locationType = value!;
                        });
                      },
                      activeColor: Colors.amber.shade800,
                    ),
                    if (locationType ==
                        'District') // Show dropdown only when District is selected
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: DropdownButtonFormField<Map<String, dynamic>>(
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
                              borderSide:
                                  BorderSide(color: Colors.orange.shade400),
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
                                style: const TextStyle(
                                    fontWeight: FontWeight.normal),
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
                      ),
                    if (locationType == 'District')
                      Column(
                        children: [
                          CheckboxListTile(
                            title: const Text(
                              "Breakfast",
                              style: TextStyle(fontSize: 20),
                            ),
                            value: isBreakfast1,
                            onChanged: (newValue) {
                              setState(() {
                                isBreakfast1 = newValue!;
                                calculateTotal();
                              });
                            },
                          ),
                          if (isBreakfast1) ...[
                            Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(10),
                                color: const Color(0xffffecec),
                                child: const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Beneficiaries per Canteen',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      '350',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w900),
                                    ),
                                  ],
                                )),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(10),
                                color: const Color(0xffffdbda),
                                child: const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Number of Canteens',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      '100',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w900),
                                    ),
                                  ],
                                )),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(10),
                                color: const Color(0xffffecec),
                                child: const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Meal Price',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      '17',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w900),
                                    ),
                                  ],
                                )),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(10),
                                color: const Color(0xffe37c31),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Amount: ",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white),
                                    ),
                                    Text(
                                      '$breakfastAmount',
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w900,
                                          color: Colors.white),
                                    ),
                                  ],
                                )),
                          ],
                          CheckboxListTile(
                            title: const Text(
                              "Lunch",
                              style: TextStyle(fontSize: 20),
                            ),
                            value: isLunch1,
                            onChanged: (newValue) {
                              setState(() {
                                isLunch1 = newValue!;
                                lunchAmount = isLunch1 ? 1015000 : 0;
                                calculateTotal();
                              });
                            },
                          ),
                          if (isLunch1) ...[
                            Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(10),
                                color: const Color(0xffffecec),
                                child: const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Beneficiaries per Canteen',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      '350',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w900),
                                    ),
                                  ],
                                )),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(10),
                                color: const Color(0xffffdbda),
                                child: const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Number of Canteens',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      '100',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w900),
                                    ),
                                  ],
                                )),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(10),
                                color: const Color(0xffffecec),
                                child: const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Meal Price',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      '29',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w900),
                                    ),
                                  ],
                                )),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(10),
                                color: const Color(0xffe37c31),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Amount: ",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white),
                                    ),
                                    Text(
                                      '$lunchAmount',
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w900,
                                          color: Colors.white),
                                    ),
                                  ],
                                )),
                          ],
                          CheckboxListTile(
                            title: const Text(
                              "Dinner",
                              style: TextStyle(fontSize: 20),
                            ),
                            value: isDinner1,
                            onChanged: (newValue) {
                              setState(() {
                                isDinner1 = newValue!;
                                dinnerAmount = isDinner1 ? 1015000 : 0;
                                calculateTotal();
                              });
                            },
                          ),
                          if (isDinner1) ...[
                            Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(10),
                                color: const Color(0xffffecec),
                                child: const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Beneficiaries per Canteen',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      '350',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w900),
                                    ),
                                  ],
                                )),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(10),
                                color: const Color(0xffffdbda),
                                child: const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Number of Canteens',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      '100',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w900),
                                    ),
                                  ],
                                )),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(10),
                                color: const Color(0xffffecec),
                                child: const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Meal Price',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      '29',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w900),
                                    ),
                                  ],
                                )),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(10),
                                color: const Color(0xffe37c31),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Amount: ",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white),
                                    ),
                                    Text(
                                      '$lunchAmount',
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w900,
                                          color: Colors.white),
                                    ),
                                  ],
                                )),
                          ],
                        ],
                      ),
                    RadioListTile<String>(
                      title: Text('Preferred Location',
                          style: TextStyle(
                              color: Colors.lime[900],
                              fontSize: 20,
                              fontWeight: FontWeight.w600)),
                      value: 'Preferred location',
                      groupValue: locationType,
                      onChanged: (value) {
                        setState(() {
                          locationType = value!;
                        });
                      },
                      activeColor: Colors.amber.shade800,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    if (locationType == 'Preferred location') ...[
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
                            borderSide:
                                BorderSide(color: Colors.orange.shade400),
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
                              style: const TextStyle(
                                  fontWeight: FontWeight.normal),
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
                            borderSide:
                                BorderSide(color: Colors.orange.shade400),
                          ),
                          fillColor: Color(0xffff8f),
                          filled: true,
                        ),
                        onChanged: (Map<String, dynamic>? newValue) {
                          setState(() {
                            selectedState = newValue;
                            String selecteddata =
                                selectedEvent!['id'].toString();
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
                              style: const TextStyle(
                                  fontWeight: FontWeight.normal),
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
                            borderSide:
                                BorderSide(color: Colors.orange.shade400),
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
                              style: const TextStyle(
                                  fontWeight: FontWeight.normal),
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
                      CheckboxListTile(
                        title: const Text(
                          "Breakfast",
                          style: TextStyle(fontSize: 20),
                        ),
                        value: isBreakfast1,
                        onChanged: (newValue) {
                          setState(() {
                            isBreakfast1 = newValue!;
                            calculateTotal();
                          });
                        },
                      ),
                      if (isBreakfast1) ...[
                        Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(10),
                            color: const Color(0xffffecec),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Beneficiaries per Canteen',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  '350',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w900),
                                ),
                              ],
                            )),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(10),
                            color: const Color(0xffffdbda),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Number of Canteens',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  '100',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w900),
                                ),
                              ],
                            )),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(10),
                            color: const Color(0xffffecec),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Meal Price',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  '17',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w900),
                                ),
                              ],
                            )),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(10),
                            color: const Color(0xffe37c31),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Amount: ",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white),
                                ),
                                Text(
                                  '$breakfastAmount',
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.white),
                                ),
                              ],
                            )),
                      ],
                      CheckboxListTile(
                        title: const Text(
                          "Lunch",
                          style: TextStyle(fontSize: 20),
                        ),
                        value: isLunch1,
                        onChanged: (newValue) {
                          setState(() {
                            isLunch1 = newValue!;
                            lunchAmount = isLunch1 ? 1015000 : 0;
                            calculateTotal();
                          });
                        },
                      ),
                      if (isLunch1) ...[
                        Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(10),
                            color: const Color(0xffffecec),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Beneficiaries per Canteen',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  '350',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w900),
                                ),
                              ],
                            )),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(10),
                            color: const Color(0xffffdbda),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Number of Canteens',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  '100',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w900),
                                ),
                              ],
                            )),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(10),
                            color: const Color(0xffffecec),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Meal Price',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  '29',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w900),
                                ),
                              ],
                            )),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(10),
                            color: const Color(0xffe37c31),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Amount: ",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white),
                                ),
                                Text(
                                  '$lunchAmount',
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.white),
                                ),
                              ],
                            )),
                      ],
                      CheckboxListTile(
                        title: const Text(
                          "Dinner",
                          style: TextStyle(fontSize: 20),
                        ),
                        value: isDinner1,
                        onChanged: (newValue) {
                          setState(() {
                            isDinner1 = newValue!;
                            dinnerAmount = isDinner1 ? 1015000 : 0;
                            calculateTotal();
                          });
                        },
                      ),
                      if (isDinner1) ...[
                        Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(10),
                            color: const Color(0xffffecec),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Beneficiaries per Canteen',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  '350',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w900),
                                ),
                              ],
                            )),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(10),
                            color: const Color(0xffffdbda),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Number of Canteens',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  '100',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w900),
                                ),
                              ],
                            )),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(10),
                            color: const Color(0xffffecec),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Meal Price',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  '29',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w900),
                                ),
                              ],
                            )),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(10),
                            color: const Color(0xffe37c31),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Amount: ",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white),
                                ),
                                Text(
                                  '$lunchAmount',
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.white),
                                ),
                              ],
                            )),
                      ],
                    ],
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(10),
                        color: const Color(0xff900c3f),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Total Amount: ",
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                            Text(
                              '₹  $totalAmount',
                              style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.yellow),
                            ),
                          ],
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: double.infinity,
                      height: 60,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {}
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                10), // Set the border radius to 10
                          ),
                        ),
                        child: const Text(
                          'Donate now',
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  void calculateTotal() {
    // Combining the two sets of conditions for calculating total amount
    totalAmount = (isBreakfast ? breakfastAmount : 0) +
        (isLunch ? lunchAmount : 0) +
        (isDinner ? dinnerAmount : 0) +
        (isBreakfast1 ? breakfastAmount : 0) +
        (isLunch1 ? lunchAmount : 0) +
        (isDinner1 ? dinnerAmount : 0);

    print(
        'Total Amount: $totalAmount'); // Optional: Print the total amount for debugging
  }

  Future<void> sendPostRequest(
      String amount, String ponumber, String name) async {
    final url = 'https://annacanteenstrust.ap.gov.in/sbipaygateway.aspx';
    final data = {'Amount': amount, 'Phonenumber': ponumber, "Name": name};
    final response = await http.post(
      Uri.parse(url),
      //headers: headers,
      body: data,
    );

    if (response.statusCode == 200) {
      final jsondata = jsonDecode(response.body);
      String massage = jsondata['RedirectUrl'];
      print('checkdata:$massage');
      if (await canLaunch("https://annacanteenstrust.ap.gov.in/$massage")) {
        await launch("https://annacanteenstrust.ap.gov.in/$massage");
      } else {
        throw 'Could not launch $url';
      }

      print('Request successful: ${response.body}');
    } else {
      // Handle failure
      print('Request failed with status: ${response.statusCode}');
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
}

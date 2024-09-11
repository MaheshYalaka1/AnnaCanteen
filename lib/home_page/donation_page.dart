import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';

class DonetionPage extends StatefulWidget {
  const DonetionPage({super.key});

  @override
  State<DonetionPage> createState() => _DonetionPageState();
}

class _DonetionPageState extends State<DonetionPage> {
  final _formKey = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController amount = TextEditingController();
  DateTime selectedDate = DateTime.now();
  String formattedDateTime = '';
  final TextEditingController _dateController = TextEditingController();

  TextEditingController name2Controller = TextEditingController();
  TextEditingController phone2Controller = TextEditingController();
  Map<String, dynamic>? selectedEvent;
  Map<String, dynamic>? selectedEvent1;

  List<Map<String, dynamic>> eventList = [];
  String? disId;
  Map<String, dynamic>? selected;
  List<Map<String, dynamic>> stateList = [];
  Map<String, dynamic>? selectedState;
  List<Map<String, dynamic>> cityslist = [];
  Map<String, dynamic>? selectedCity;

  String? selectedOption;
  String? locationType;
  String state = "state";
  String? selectedDistrict;
  int? totalDis;

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

  bool isBreakfast2 = false;
  bool isLunch2 = false;
  bool isDinner2 = false;

  double breakfastAmount = 5950;
  double lunchAmount = 10150;
  double dinnerAmount = 10150;
  double totalAmount = 0;
  int? totalCanteen;

  double? Statebrack;
  double? Statelunch;
  double? Statedine;

  double? disbrack;
  double? dislucnch;
  double? disdin;

  @override
  void initState() {
    Countysget();
    canteenlenth();

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
      backgroundColor: const Color(0xffFFF8DC),
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
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please Enter Name";
                          }
                          return null;
                        },
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
                          hintText: 'Enter your mobile Number',
                          hintStyle: TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(
                            Icons.phone_android,
                            color: Colors.orange,
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please Enter Mobile Number";
                          }
                          return null;
                        },
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
                                  nameController.text, formattedDateTime);
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
                child: Form(
                  key: _formKey2,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: name2Controller,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
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
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please Enter Name";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: phone2Controller,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
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
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please Enter Mobile Number";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: _dateController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        readOnly: true,
                        decoration: InputDecoration(
                          hintText: 'Event Date',
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 16),
                          border: OutlineInputBorder(),
                          suffixIcon: IconButton(
                            color: Colors.orange,
                            icon: const Icon(Icons.calendar_today),
                            onPressed: () => _selectDateTime(),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.orange.shade400),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select Event Date & Time';
                          }
                          return null;
                        },
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
                            calculateState();
                            isBreakfast1 = false;
                            isLunch1 = false;
                            isDinner1 = false;

                            isBreakfast2 = false;
                            isLunch2 = false;
                            isDinner2 = false;
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
                                  calculateState();
                                });
                              },
                            ),
                            if (isBreakfast) ...[
                              Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(10),
                                  color: const Color(0xffffe37e),
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
                                            fontWeight: FontWeight.w900,
                                            color: Colors.black),
                                      ),
                                    ],
                                  )),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(10),
                                  color: const Color(0xffffeeb2),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'Number of Canteens',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      Text(
                                        '$totalCanteen',
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w900,
                                            color: Colors.black),
                                      ),
                                    ],
                                  )),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(10),
                                  color: const Color(0xffffe37e),
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
                                            fontWeight: FontWeight.w900,
                                            color: Colors.black),
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
                                        ("$Statebrack"),
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
                                  //lunchAmount = isLunch ? 1015000 : 0;
                                  calculateState();
                                });
                              },
                            ),
                            if (isLunch) ...[
                              Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(10),
                                  color: const Color(0xffffe37e),
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
                                  color: const Color(0xffffeeb2),
                                  child: Row(
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
                                        '$totalCanteen',
                                        style: const TextStyle(
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
                                  color: const Color(0xffffe37e),
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
                                        '$Statelunch',
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
                                  // dinnerAmount = isDinner ? 1015000 : 0;
                                  calculateState();
                                });
                              },
                            ),
                            if (isDinner) ...[
                              Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(10),
                                  color: const Color(0xffffe37e),
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
                                  color: const Color(0xffffeeb2),
                                  child: Row(
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
                                        '$totalCanteen',
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
                                  color: const Color(0xffffe37e),
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
                                        '$Statedine',
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
                            isBreakfast = false;
                            isLunch = false;
                            isDinner = false;

                            isBreakfast2 = false;
                            isLunch2 = false;
                            isDinner2 = false;
                            calculateDisTotal();
                          });
                        },
                        activeColor: Colors.amber.shade800,
                      ),
                      if (locationType ==
                          'District') // Show dropdown only when District is selected
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: DropdownButtonFormField<Map<String, dynamic>>(
                            value: selectedEvent1,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            decoration: InputDecoration(
                              hintText: "Select District",
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
                              fillColor: const Color(0xffff8f),
                              filled: true,
                            ),
                            onChanged: (Map<String, dynamic>? newValue) {
                              setState(() {
                                selectedEvent1 = newValue;
                                selectedState = null;
                                stateList = [];
                                print('Selected country: $selectedEvent1');
                                disId = selectedEvent1!['id'].toString();
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
                                onChanged: (selectedEvent1 != null)
                                    ? (newValue) {
                                        setState(() {
                                          isBreakfast1 = newValue!;
                                          calculateDisTotal();
                                        });
                                      }
                                    : null),
                            if (isBreakfast1) ...[
                              Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(10),
                                  color: const Color(0xffffe37e),
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
                                  color: const Color(0xffffeeb2),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'Number of Canteens',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      Text(
                                        "$totalDis",
                                        style: const TextStyle(
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
                                  color: const Color(0xffffe37e),
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
                                        '$totalDis * $breakfastAmount',
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
                                onChanged: (selectedEvent1 != null)
                                    ? (newValue) {
                                        setState(() {
                                          isLunch1 = newValue!;
                                          // lunchAmount = isLunch1 ? 1015000 : 0;
                                          calculateDisTotal();
                                        });
                                      }
                                    : null),
                            if (isLunch1) ...[
                              Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(10),
                                  color: const Color(0xffffe37e),
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
                                  color: const Color(0xffffeeb2),
                                  child: Row(
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
                                        '$totalDis',
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
                                  color: const Color(0xffffe37e),
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
                                        '$totalDis * $lunchAmount',
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
                                onChanged: (selectedEvent1 != null)
                                    ? (newValue) {
                                        setState(() {
                                          isDinner1 = newValue!;
                                          // dinnerAmount = isDinner1 ? 1015000 : 0;
                                          calculateDisTotal();
                                        });
                                      }
                                    : null),
                            if (isDinner1) ...[
                              Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(10),
                                  color: const Color(0xffffe37e),
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
                                  color: const Color(0xffffeeb2),
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
                                  color: const Color(0xffffe37e),
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
                                        '$totalDis * $lunchAmount',
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
                            isBreakfast1 = false;
                            isLunch1 = false;
                            isDinner1 = false;

                            isBreakfast = false;
                            isLunch = false;
                            isDinner = false;
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
                            hintText: "Select District",
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
                            fillColor: const Color(0xffff8f),
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
                        ),
                        DropdownButtonFormField<Map<String, dynamic>>(
                          value: selectedState,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: InputDecoration(
                            hintText: "Select City",
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
                            fillColor: const Color(0xffff8f),
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
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        DropdownButtonFormField<Map<String, dynamic>>(
                          value: selectedCity,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: InputDecoration(
                            hintText: "Select Canteen",
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
                            fillColor: const Color(0xffff8f),
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
                        ),
                        CheckboxListTile(
                            title: const Text(
                              "Breakfast",
                              style: TextStyle(fontSize: 20),
                            ),
                            value: isBreakfast2,
                            onChanged: (selectedCity != null)
                                ? (newValue) {
                                    setState(() {
                                      isBreakfast2 = newValue!;
                                      calculateTotal();
                                    });
                                  }
                                : null),
                        if (isBreakfast2) ...[
                          Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(10),
                              color: const Color(0xffffe37e),
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
                              color: const Color(0xffffeeb2),
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
                                    '1',
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
                              color: const Color(0xffffe37e),
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
                            value: isLunch2,
                            onChanged: (selectedCity != null)
                                ? (newValue) {
                                    setState(() {
                                      isLunch2 = newValue!;
                                      // lunchAmount = isLunch2 ? 1015000 : 0;
                                      calculateTotal();
                                    });
                                  }
                                : null),
                        if (isLunch2) ...[
                          Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(10),
                              color: const Color(0xffffe37e),
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
                              color: const Color(0xffffeeb2),
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
                                    '1',
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
                              color: const Color(0xffffe37e),
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
                            value: isDinner2,
                            onChanged: (selectedCity != null)
                                ? (newValue) {
                                    setState(() {
                                      isDinner2 = newValue!;
                                      // dinnerAmount = isDinner2 ? 1015000 : 0;
                                      calculateTotal();
                                    });
                                  }
                                : null),
                        if (isDinner2) ...[
                          Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(10),
                              color: const Color(0xffffe37e),
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
                              color: const Color(0xffffeeb2),
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
                                    '1',
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
                              color: const Color(0xffffe37e),
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
                            if (_formKey2.currentState!.validate()) {
                              Contribution(
                                  totalAmount.toString(),
                                  phone2Controller.text,
                                  name2Controller.text,
                                  formattedDateTime);
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
          ],
        ),
      ),
    );
  }

  Future<void> _selectDateTime() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2051),
    );

    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
        formattedDateTime = DateFormat('yyyy-MM-dd').format(selectedDate);
        _dateController.text = formattedDateTime;
      });

      print('Selected DateTime: $formattedDateTime');
    } else {
      DateTime now = DateTime.now();
      setState(() {
        formattedDateTime = DateFormat('yyyy-MM-dd').format(now);
        _dateController.text = formattedDateTime;
        print('formattedDateTime${_dateController.text}');
      });

      print('No Date Selected, using current DateTime: $formattedDateTime');
    }
  }

  void calculateTotal() {
    // Summing amounts based on conditions
    totalAmount = (isBreakfast2 ? breakfastAmount : 0) +
        (isLunch2 ? lunchAmount : 0) +
        (isDinner2 ? dinnerAmount : 0);

    print('Total Amount: $totalAmount');
  }

  void calculateState() {
    totalAmount = (isBreakfast ? breakfastAmount * totalCanteen! : 0) +
        (isLunch ? lunchAmount * totalCanteen! : 0) +
        (isDinner ? dinnerAmount * totalCanteen! : 0);

    Statebrack = breakfastAmount * totalCanteen!;
    Statelunch = lunchAmount * totalCanteen!;
    Statedine = dinnerAmount * totalCanteen!;

    print('Total Amount: $totalAmount');
  }

  void calculateDisTotal() {
    totalAmount = (isBreakfast1 ? totalDis! * breakfastAmount : 0) +
        (isLunch1 ? totalDis! * lunchAmount : 0) +
        (isDinner1 ? totalDis! * dinnerAmount : 0);

    print(
        'Total Amount: $totalAmount'); // Optional: Print the total amount for debugging
  }

  Future<void> sendPostRequest(
      String amount, String ponumber, String name, String Dates) async {
    final url = 'https://annacanteenstrust.ap.gov.in/sbipaygateway.aspx';
    String mahesh = DateFormat('yyyy-MM-dd').format(DateTime.now());
    final data = {
      'Amount': amount,
      'Phonenumber': ponumber,
      "Name": name,
      "Date": mahesh,
    };
    final response = await http.post(
      Uri.parse(url),
      //headers: headers,
      body: data,
    );
    print("whatdata$data");

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

  Future<void> Contribution(
      String amount, String ponumber, String name, String date) async {
    final url = 'https://annacanteenstrust.ap.gov.in/sbipaygateway.aspx';
    final data = {
      'Amount': amount,
      'Phonenumber': ponumber,
      "Name": name,
      "Date": date
    };
    final response = await http.post(
      Uri.parse(url),
      //headers: headers,
      body: data,
    );

    print('contrydate$data');

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
          disbrack = breakfastAmount + totalDis!;
          dislucnch = lunchAmount + totalDis!;
          disdin = dinnerAmount + totalDis!;
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
          totalDis = data.length;

          for (var item in data) {
            stateList.add({
              'id': item['id'],
              'name': item['name'],
            });
          }
        });
        calculateDisTotal();
      } else {
        print('Failed to get states');
        print('Response body: ${response.body}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> canteenlenth() async {
    String url =
        'http://20.192.27.119/apac/DistrictHandler.ashx?action=getCanteensall';

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

        totalCanteen = jsondata.length;
        print(' totalCanteen$totalCanteen');
      } else {
        print('Failed to get cities');
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

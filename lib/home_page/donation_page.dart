import 'package:flutter/material.dart';

class DonetionPage extends StatefulWidget {
  @override
  _DonetionPage createState() => _DonetionPage();
}

class _DonetionPage extends State<DonetionPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController amount = TextEditingController();

  String selectedOption = "Contribution on Special Occasion";
  String locationType = "Preferred location";
  String selectedDistrict = "District";
  String selectedCity = "City";
  String selectedState = "State";
  String selectedAddress = "Address";
  bool isBreakfast = false;
  bool isLunch = false;
  bool isDinner = false;
  bool donation = false;

  double breakfastAmount = 5950;
  double lunchAmount = 0;
  double dinnerAmount = 0;
  double totalAmount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Donation Form',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xffE20736),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Container(
                    height: 250,
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    // margin: EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                        // borderRadius: BorderRadius.circular(40),
                        image: DecorationImage(
                            image: AssetImage(
                              'assets/images/image.jpg',
                            ),
                            fit: BoxFit.cover))),
                // Contribution Type

                RadioListTile<String>(
                  title: const Text('Donation'),
                  value: 'Donation',
                  groupValue: selectedOption,
                  onChanged: (value) {
                    setState(() {
                      selectedOption = value!;
                    });
                  },
                ),
                if (selectedOption == 'Donation')
                  Column(
                    children: [
                      // Three text fields for donation
                      TextFormField(
                        controller: nameController,
                        decoration: const InputDecoration(labelText: 'Name'),
                      ),
                      TextFormField(
                        controller: phoneController,
                        decoration:
                            const InputDecoration(labelText: 'Phone number'),
                        keyboardType: TextInputType.number,
                      ),
                      TextFormField(
                        controller: amount,
                        decoration: const InputDecoration(labelText: 'Amount'),
                        keyboardType: TextInputType.number,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {}
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('Donate now'),
                      ),
                    ],
                  ),
                RadioListTile<String>(
                  title: const Text('Contribution on Special Occasion'),
                  value: 'Contribution on Special Occasion',
                  groupValue: selectedOption,
                  onChanged: (value) {
                    setState(() {
                      selectedOption = value!;
                    });
                  },
                ),

                if (selectedOption == 'Contribution on Special Occasion')
                  Column(
                    children: [
                      const Text('Location'),
                      RadioListTile<String>(
                        title: const Text('State'),
                        value: "State",
                        groupValue: locationType,
                        onChanged: (value) {
                          setState(() {
                            locationType = value!;
                            donation = true;
                          });
                        },
                      ),
                      if (donation)
                        Column(
                          children: [
                            // Three text fields for donation
                            TextFormField(
                              controller: nameController,
                              decoration:
                                  const InputDecoration(labelText: 'Name'),
                            ),

                            TextFormField(
                              controller: amount,
                              decoration:
                                  const InputDecoration(labelText: 'Amount'),
                              keyboardType: TextInputType.number,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {}
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                                foregroundColor: Colors.white,
                              ),
                              child: const Text('Donate now'),
                            ),
                          ],
                        ),
                      RadioListTile<String>(
                        title: const Text('District'),
                        value: "District",
                        groupValue: locationType,
                        onChanged: (value) {
                          setState(() {
                            locationType = value!;
                          });
                        },
                      ),
                      RadioListTile<String>(
                        title: const Text('Preferred location'),
                        value: "Preferred location",
                        groupValue: locationType,
                        onChanged: (value) {
                          setState(() {
                            locationType = value!;
                          });
                        },
                      ),

                      DropdownButtonFormField<String>(
                        value: selectedDistrict,
                        decoration:
                            const InputDecoration(labelText: "District"),
                        items: <String>['District', 'District 1', 'District 2']
                            .map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            selectedDistrict = newValue!;
                          });
                        },
                      ),
                      DropdownButtonFormField<String>(
                        value: selectedCity,
                        decoration: const InputDecoration(labelText: "City"),
                        items: <String>['City', 'City 1', 'City 2']
                            .map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            selectedCity = newValue!;
                          });
                        },
                      ),
                      DropdownButtonFormField<String>(
                        value: selectedAddress,
                        decoration: const InputDecoration(labelText: "Address"),
                        items: <String>['Address', 'Address 1', 'Address 2']
                            .map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            selectedAddress = newValue!;
                          });
                        },
                      ),
                      const SizedBox(height: 20),

                      // Meals Selection
                      CheckboxListTile(
                        title: const Text("Breakfast"),
                        value: isBreakfast,
                        onChanged: (newValue) {
                          setState(() {
                            isBreakfast = newValue!;
                            calculateTotal();
                          });
                        },
                      ),
                      if (isBreakfast) ...[
                        const Text("Beneficiaries per Canteen: 350"),
                        const Text("Number of Canteens: 35"),
                        const Text("Meal Price: 75"),
                        Text("Amount: $breakfastAmount"),
                      ],
                      CheckboxListTile(
                        title: const Text("Lunch"),
                        value: isLunch,
                        onChanged: (newValue) {
                          setState(() {
                            isLunch = newValue!;
                            lunchAmount = isLunch ? 6500 : 0;
                            calculateTotal();
                          });
                        },
                      ),
                      CheckboxListTile(
                        title: const Text("Dinner"),
                        value: isDinner,
                        onChanged: (newValue) {
                          setState(() {
                            isDinner = newValue!;
                            dinnerAmount = isDinner ? 7000 : 0;
                            calculateTotal();
                          });
                        },
                      ),

                      const SizedBox(height: 20),
                      Text("Total Amount: $totalAmount",
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // Handle donation submission
                          }
                        },
                        child: const Text('Donate now'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void calculateTotal() {
    totalAmount = (isBreakfast ? breakfastAmount : 0) +
        (isLunch ? lunchAmount : 0) +
        (isDinner ? dinnerAmount : 0);
  }
}

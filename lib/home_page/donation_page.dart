import 'package:flutter/material.dart';
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

  String selectedOption = "Contribution on Special Occasion";
  String locationType = "Preferred location";
  String state = "state";
  String? selectedDistrict;
  List<String> districtNames = ['District 1', 'District 2', 'District 3'];
  List<String> cityNames = ['City 1', 'City 2', 'City 3'];
  List<String> addressNames = ['Address 1', 'Address 2', 'Address 3'];

  String? selectedCity; // Selected city from dropdown
  String? selectedAddress; // Selected address from dropdown




  String selectedState = "State";

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffE20736),
        title: Text('Donation',  style:
        TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.white)),
      ),
      body:
      SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 350,

              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/image.jpg'),
                      fit: BoxFit.cover

                  )

              ),
            ),
            SizedBox(height: 10,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('End Hunger Today', style: TextStyle(fontSize: 26, color: Colors.red,
                    fontWeight: FontWeight.w900),),
                SizedBox(width: 10,),
                Text('Donate Food, Spread Hope',  style: TextStyle(fontSize: 24, color: Colors.brown,
                    fontWeight: FontWeight.w600),),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 50),
              child: Divider(
                thickness: 1,
                color: Colors.orange,
              ),
            ),
            // SizedBox(height: 20,),

            RadioListTile<String>(
              title: const Text('Donation', style: TextStyle(color: Colors.red, fontSize: 22,
                  fontWeight: FontWeight.w600),),
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
                child: Column(
                  children: [
                    TextFormField(
                      controller: nameController,
                      decoration:
                      const InputDecoration(

                        labelText: 'Full Name',
                        labelStyle: TextStyle(color: Colors.black, fontSize: 18,),
                        hintText: 'Enter your full name',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(



                        ),
                        prefixIcon: Icon(Icons.person, color: Colors.orange,),



                      ),



                      keyboardType: TextInputType.text,

                    ),
                    SizedBox(height: 10,),

                    TextFormField(
                      controller: phoneController,
                      decoration:
                      const InputDecoration(

                        labelText: 'Phone Number',
                        labelStyle: TextStyle(color: Colors.black, fontSize: 18,),
                        hintText: 'Enter your mobile number',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(



                        ),
                        prefixIcon: Icon(Icons.phone_android, color: Colors.orange,),



                      ),



                      keyboardType: TextInputType.number,

                    ),

                    SizedBox(height: 10,),



                    TextFormField(
                      controller: amount,
                      decoration:
                      const InputDecoration(

                        labelText: 'Donation Amount',
                        labelStyle: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w900 ),
                        hintText: 'Enter Amount',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(



                        ),
                        prefixIcon: Icon(Icons.currency_rupee, color: Colors.orange,),



                      ),



                      keyboardType: TextInputType.number,

                    ),
                    SizedBox(height: 20,),

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
                            borderRadius: BorderRadius.circular(10), // Set the border radius to 10
                          ),
                        ),


                        child: const Text('Donate now', style: TextStyle(
                            fontSize: 24
                        ),),
                      ),
                    ),


                  ],
                ),
              ),
            Padding(
              padding: const EdgeInsets.only(left: 100, right: 100),
              child: Divider(
                thickness: 1,
                color: Colors.grey,
              ),
            ),


            RadioListTile<String>(
              title: const Text('Contribution on Special Occasion',  style: TextStyle(color: Colors.red, fontSize: 22,
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
            if(selectedOption=='Contribution on Special Occasion')

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    TextFormField(
                      controller: name2Controller,
                      decoration:
                      const InputDecoration(

                        labelText: 'Full Name',
                        labelStyle: TextStyle(color: Colors.black, fontSize: 18,),
                        hintText: 'Enter your full name',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(



                        ),
                        prefixIcon: Icon(Icons.person, color: Colors.orange,),



                      ),



                      keyboardType: TextInputType.text,

                    ),
                    SizedBox(height: 10,),

                    TextFormField(
                      controller: phone2Controller,
                      decoration:
                      const InputDecoration(

                        labelText: 'Phone Number',
                        labelStyle: TextStyle(color: Colors.black, fontSize: 18,),
                        hintText: 'Enter your mobile number',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(



                        ),
                        prefixIcon: Icon(Icons.phone_android, color: Colors.orange,),



                      ),



                      keyboardType: TextInputType.number,

                    ),

                    SizedBox(height: 10,),
                    TextFormField(

                      decoration:
                      const InputDecoration(

                        labelText: 'Date',
                        labelStyle: TextStyle(color: Colors.black, fontSize: 18,),
                        hintText: 'Enter your mobile number',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(



                        ),
                        prefixIcon: Icon(Icons.date_range, color: Colors.orange,),



                      ),



                      keyboardType: TextInputType.number,

                    ),

                    RadioListTile<String>(
                      title: Text('State', style: TextStyle(color: Colors.lime[900], fontSize: 20,
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
                    if(locationType == 'state')

                      Column(
                        children: [
                          CheckboxListTile(
                            title: const Text("Breakfast", style: TextStyle(fontSize: 20),),
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
                                padding: EdgeInsets.all(10),
                                color: Color(0xffffecec),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Beneficiaries per Canteen', style: TextStyle(
                                        fontSize: 18,fontWeight: FontWeight.w400
                                    ),),
                                    Text('350', style: TextStyle(
                                        fontSize: 18,fontWeight: FontWeight.w900
                                    ),
                                    ),
                                  ],
                                )
                            ),
                            SizedBox(height: 10,),
                            Container(
                                width: double.infinity,
                                padding: EdgeInsets.all(10),
                                color: Color(0xffffdbda),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Number of Canteens', style: TextStyle(
                                        fontSize: 18,fontWeight: FontWeight.w400
                                    ),),
                                    Text('100', style: TextStyle(
                                        fontSize: 18,fontWeight: FontWeight.w900
                                    ),
                                    ),
                                  ],
                                )
                            ),
                            SizedBox(height: 10,),
                            Container(
                                width: double.infinity,
                                padding: EdgeInsets.all(10),
                                color: Color(0xffffecec),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Meal Price', style: TextStyle(
                                        fontSize: 18,fontWeight: FontWeight.w400
                                    ),),
                                    Text('17', style: TextStyle(
                                        fontSize: 18,fontWeight: FontWeight.w900
                                    ),
                                    ),
                                  ],
                                )
                            ),
                            SizedBox(height: 10,),

                            Container(
                                width: double.infinity,
                                padding: EdgeInsets.all(10),
                                color: Color(0xffe37c31),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Amount: ", style: TextStyle(
                                        fontSize: 18,fontWeight: FontWeight.w400, color: Colors.white
                                    ),),
                                    Text('$breakfastAmount', style: TextStyle(
                                        fontSize: 18,fontWeight: FontWeight.w900, color: Colors.white
                                    ),
                                    ),
                                  ],
                                )
                            ),

                          ],



                          CheckboxListTile(
                            title: const Text("Lunch", style: TextStyle(fontSize: 20),),
                            value: isLunch,
                            onChanged: (newValue) {
                              setState(() {
                                isLunch = newValue!;
                                lunchAmount=isLunch ? 1015000:0;
                                calculateTotal();
                              });
                            },
                          ),
                          if(isLunch)...[

                            Container(
                                width: double.infinity,
                                padding: EdgeInsets.all(10),
                                color: Color(0xffffecec),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Beneficiaries per Canteen', style: TextStyle(
                                        fontSize: 18,fontWeight: FontWeight.w400
                                    ),),
                                    Text('350', style: TextStyle(
                                        fontSize: 18,fontWeight: FontWeight.w900
                                    ),
                                    ),
                                  ],
                                )
                            ),
                            SizedBox(height: 10,),
                            Container(
                                width: double.infinity,
                                padding: EdgeInsets.all(10),
                                color: Color(0xffffdbda),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Number of Canteens', style: TextStyle(
                                        fontSize: 18,fontWeight: FontWeight.w400
                                    ),),
                                    Text('100', style: TextStyle(
                                        fontSize: 18,fontWeight: FontWeight.w900
                                    ),
                                    ),
                                  ],
                                )
                            ),
                            SizedBox(height: 10,),
                            Container(
                                width: double.infinity,
                                padding: EdgeInsets.all(10),
                                color: Color(0xffffecec),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Meal Price', style: TextStyle(
                                        fontSize: 18,fontWeight: FontWeight.w400
                                    ),),
                                    Text('29', style: TextStyle(
                                        fontSize: 18,fontWeight: FontWeight.w900
                                    ),
                                    ),
                                  ],
                                )
                            ),
                            SizedBox(height: 10,),

                            Container(
                                width: double.infinity,
                                padding: EdgeInsets.all(10),
                                color: Color(0xffe37c31),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Amount: ", style: TextStyle(
                                        fontSize: 18,fontWeight: FontWeight.w400, color: Colors.white
                                    ),),
                                    Text('$lunchAmount', style: TextStyle(
                                        fontSize: 18,fontWeight: FontWeight.w900, color: Colors.white
                                    ),
                                    ),
                                  ],
                                )
                            ),

                          ],



                          CheckboxListTile(
                            title: const Text("Dinner", style: TextStyle(fontSize: 20),),
                            value: isDinner,
                            onChanged: (newValue) {
                              setState(() {
                                isDinner = newValue!;
                                dinnerAmount=isDinner ? 1015000:0;
                                calculateTotal();
                              });
                            },
                          ),
                          if(isDinner)...[

                            Container(
                                width: double.infinity,
                                padding: EdgeInsets.all(10),
                                color: Color(0xffffecec),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Beneficiaries per Canteen', style: TextStyle(
                                        fontSize: 18,fontWeight: FontWeight.w400
                                    ),),
                                    Text('350', style: TextStyle(
                                        fontSize: 18,fontWeight: FontWeight.w900
                                    ),
                                    ),
                                  ],
                                )
                            ),
                            SizedBox(height: 10,),
                            Container(
                                width: double.infinity,
                                padding: EdgeInsets.all(10),
                                color: Color(0xffffdbda),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Number of Canteens', style: TextStyle(
                                        fontSize: 18,fontWeight: FontWeight.w400
                                    ),),
                                    Text('100', style: TextStyle(
                                        fontSize: 18,fontWeight: FontWeight.w900
                                    ),
                                    ),
                                  ],
                                )
                            ),
                            SizedBox(height: 10,),
                            Container(
                                width: double.infinity,
                                padding: EdgeInsets.all(10),
                                color: Color(0xffffecec),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Meal Price', style: TextStyle(
                                        fontSize: 18,fontWeight: FontWeight.w400
                                    ),),
                                    Text('29', style: TextStyle(
                                        fontSize: 18,fontWeight: FontWeight.w900
                                    ),
                                    ),
                                  ],
                                )
                            ),
                            SizedBox(height: 10,),

                            Container(
                                width: double.infinity,
                                padding: EdgeInsets.all(10),
                                color: Color(0xffe37c31),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Amount: ", style: TextStyle(
                                        fontSize: 18,fontWeight: FontWeight.w400, color: Colors.white
                                    ),),
                                    Text('$lunchAmount', style: TextStyle(
                                        fontSize: 18,fontWeight: FontWeight.w900, color: Colors.white
                                    ),
                                    ),
                                  ],
                                )
                            ),

                          ],

                        ],
                      ),


                    RadioListTile<String>(
                      title: Text('District',  style: TextStyle(color: Colors.lime[900], fontSize: 20,
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
                    if (locationType == 'District') // Show dropdown only when District is selected
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: DropdownButtonFormField<String>(
                          decoration: const InputDecoration(
                              labelText: "Select District",
                              labelStyle: TextStyle(
                                  color: Colors.black, fontSize: 20
                              )),

                          dropdownColor: Color(0xfffff8f8),
                          value: selectedDistrict,
                          items: districtNames.map((String value) {
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

                      ),

                    if (locationType == 'District')


                      Column(
                        children: [
                          CheckboxListTile(
                            title: const Text("Breakfast", style: TextStyle(fontSize: 20),),
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
                                padding: EdgeInsets.all(10),
                                color: Color(0xffffecec),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Beneficiaries per Canteen', style: TextStyle(
                                        fontSize: 18,fontWeight: FontWeight.w400
                                    ),),
                                    Text('350', style: TextStyle(
                                        fontSize: 18,fontWeight: FontWeight.w900
                                    ),
                                    ),
                                  ],
                                )
                            ),
                            SizedBox(height: 10,),
                            Container(
                                width: double.infinity,
                                padding: EdgeInsets.all(10),
                                color: Color(0xffffdbda),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Number of Canteens', style: TextStyle(
                                        fontSize: 18,fontWeight: FontWeight.w400
                                    ),),
                                    Text('100', style: TextStyle(
                                        fontSize: 18,fontWeight: FontWeight.w900
                                    ),
                                    ),
                                  ],
                                )
                            ),
                            SizedBox(height: 10,),
                            Container(
                                width: double.infinity,
                                padding: EdgeInsets.all(10),
                                color: Color(0xffffecec),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Meal Price', style: TextStyle(
                                        fontSize: 18,fontWeight: FontWeight.w400
                                    ),),
                                    Text('17', style: TextStyle(
                                        fontSize: 18,fontWeight: FontWeight.w900
                                    ),
                                    ),
                                  ],
                                )
                            ),
                            SizedBox(height: 10,),

                            Container(
                                width: double.infinity,
                                padding: EdgeInsets.all(10),
                                color: Color(0xffe37c31),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Amount: ", style: TextStyle(
                                        fontSize: 18,fontWeight: FontWeight.w400, color: Colors.white
                                    ),),
                                    Text('$breakfastAmount', style: TextStyle(
                                        fontSize: 18,fontWeight: FontWeight.w900, color: Colors.white
                                    ),
                                    ),
                                  ],
                                )
                            ),

                          ],


                          CheckboxListTile(
                            title: const Text("Lunch", style: TextStyle(fontSize: 20),),
                            value: isLunch1,
                            onChanged: (newValue) {
                              setState(() {
                                isLunch1 = newValue!;
                                lunchAmount=isLunch1 ? 1015000:0;
                                calculateTotal();
                              });
                            },
                          ),
                          if(isLunch1)...[

                            Container(
                                width: double.infinity,
                                padding: EdgeInsets.all(10),
                                color: Color(0xffffecec),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Beneficiaries per Canteen', style: TextStyle(
                                        fontSize: 18,fontWeight: FontWeight.w400
                                    ),),
                                    Text('350', style: TextStyle(
                                        fontSize: 18,fontWeight: FontWeight.w900
                                    ),
                                    ),
                                  ],
                                )
                            ),
                            SizedBox(height: 10,),
                            Container(
                                width: double.infinity,
                                padding: EdgeInsets.all(10),
                                color: Color(0xffffdbda),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Number of Canteens', style: TextStyle(
                                        fontSize: 18,fontWeight: FontWeight.w400
                                    ),),
                                    Text('100', style: TextStyle(
                                        fontSize: 18,fontWeight: FontWeight.w900
                                    ),
                                    ),
                                  ],
                                )
                            ),
                            SizedBox(height: 10,),
                            Container(
                                width: double.infinity,
                                padding: EdgeInsets.all(10),
                                color: Color(0xffffecec),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Meal Price', style: TextStyle(
                                        fontSize: 18,fontWeight: FontWeight.w400
                                    ),),
                                    Text('29', style: TextStyle(
                                        fontSize: 18,fontWeight: FontWeight.w900
                                    ),
                                    ),
                                  ],
                                )
                            ),
                            SizedBox(height: 10,),

                            Container(
                                width: double.infinity,
                                padding: EdgeInsets.all(10),
                                color: Color(0xffe37c31),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Amount: ", style: TextStyle(
                                        fontSize: 18,fontWeight: FontWeight.w400, color: Colors.white
                                    ),),
                                    Text('$lunchAmount', style: TextStyle(
                                        fontSize: 18,fontWeight: FontWeight.w900, color: Colors.white
                                    ),
                                    ),
                                  ],
                                )
                            ),

                          ],


                          CheckboxListTile(
                            title: const Text("Dinner", style: TextStyle(fontSize: 20),),
                            value: isDinner1,
                            onChanged: (newValue) {
                              setState(() {
                                isDinner1 = newValue!;
                                dinnerAmount=isDinner1 ? 1015000:0;
                                calculateTotal();
                              });
                            },
                          ),
                          if(isDinner1)...[

                            Container(
                                width: double.infinity,
                                padding: EdgeInsets.all(10),
                                color: Color(0xffffecec),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Beneficiaries per Canteen', style: TextStyle(
                                        fontSize: 18,fontWeight: FontWeight.w400
                                    ),),
                                    Text('350', style: TextStyle(
                                        fontSize: 18,fontWeight: FontWeight.w900
                                    ),
                                    ),
                                  ],
                                )
                            ),
                            SizedBox(height: 10,),
                            Container(
                                width: double.infinity,
                                padding: EdgeInsets.all(10),
                                color: Color(0xffffdbda),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Number of Canteens', style: TextStyle(
                                        fontSize: 18,fontWeight: FontWeight.w400
                                    ),),
                                    Text('100', style: TextStyle(
                                        fontSize: 18,fontWeight: FontWeight.w900
                                    ),
                                    ),
                                  ],
                                )
                            ),
                            SizedBox(height: 10,),
                            Container(
                                width: double.infinity,
                                padding: EdgeInsets.all(10),
                                color: Color(0xffffecec),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Meal Price', style: TextStyle(
                                        fontSize: 18,fontWeight: FontWeight.w400
                                    ),),
                                    Text('29', style: TextStyle(
                                        fontSize: 18,fontWeight: FontWeight.w900
                                    ),
                                    ),
                                  ],
                                )
                            ),
                            SizedBox(height: 10,),

                            Container(
                                width: double.infinity,
                                padding: EdgeInsets.all(10),
                                color: Color(0xffe37c31),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Amount: ", style: TextStyle(
                                        fontSize: 18,fontWeight: FontWeight.w400, color: Colors.white
                                    ),),
                                    Text('$lunchAmount', style: TextStyle(
                                        fontSize: 18,fontWeight: FontWeight.w900, color: Colors.white
                                    ),
                                    ),
                                  ],
                                )
                            ),

                          ],

                        ],
                      ),

                    RadioListTile<String>(
                      title: Text('Preferred Location', style: TextStyle(color: Colors.lime[900], fontSize: 20,
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
                    SizedBox(height: 15,),
                    if (locationType == 'Preferred location') ...[
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          labelText: 'Selected District',
                          labelStyle: TextStyle(
                              color: Colors.black, fontSize: 20
                          ),
                          border: OutlineInputBorder(),
                        ),
                        value: selectedDistrict,
                        items: districtNames.map((String value) {
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

                      SizedBox(height: 16),
                      // City dropdown
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          labelText: ' Selected City',
                          labelStyle: TextStyle(
                              color: Colors.black, fontSize: 20
                          ),
                          border: OutlineInputBorder(),
                        ),
                        value: selectedCity,
                        items: cityNames.map((String value) {
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

                      SizedBox(height: 16),
                      // Address dropdown
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          labelText: 'Selected Anna Canteen',
                          labelStyle: TextStyle(
                              color: Colors.black, fontSize: 20
                          ),
                          border: OutlineInputBorder(),
                        ),
                        value: selectedAddress,
                        items: addressNames.map((String value) {
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

                      CheckboxListTile(
                        title: const Text("Breakfast", style: TextStyle(fontSize: 20),),
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
                            padding: EdgeInsets.all(10),
                            color: Color(0xffffecec),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Beneficiaries per Canteen', style: TextStyle(
                                    fontSize: 18,fontWeight: FontWeight.w400
                                ),),
                                Text('350', style: TextStyle(
                                    fontSize: 18,fontWeight: FontWeight.w900
                                ),
                                ),
                              ],
                            )
                        ),
                        SizedBox(height: 10,),
                        Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(10),
                            color: Color(0xffffdbda),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Number of Canteens', style: TextStyle(
                                    fontSize: 18,fontWeight: FontWeight.w400
                                ),),
                                Text('100', style: TextStyle(
                                    fontSize: 18,fontWeight: FontWeight.w900
                                ),
                                ),
                              ],
                            )
                        ),
                        SizedBox(height: 10,),
                        Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(10),
                            color: Color(0xffffecec),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Meal Price', style: TextStyle(
                                    fontSize: 18,fontWeight: FontWeight.w400
                                ),),
                                Text('17', style: TextStyle(
                                    fontSize: 18,fontWeight: FontWeight.w900
                                ),
                                ),
                              ],
                            )
                        ),
                        SizedBox(height: 10,),

                        Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(10),
                            color: Color(0xffe37c31),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Amount: ", style: TextStyle(
                                    fontSize: 18,fontWeight: FontWeight.w400, color: Colors.white
                                ),),
                                Text('$breakfastAmount', style: TextStyle(
                                    fontSize: 18,fontWeight: FontWeight.w900, color: Colors.white
                                ),
                                ),
                              ],
                            )
                        ),

                      ],

                      CheckboxListTile(
                        title: const Text("Lunch", style: TextStyle(fontSize: 20),),
                        value: isLunch1,
                        onChanged: (newValue) {
                          setState(() {
                            isLunch1 = newValue!;
                            lunchAmount=isLunch1 ? 1015000:0;
                            calculateTotal();
                          });
                        },
                      ),
                      if(isLunch1)...[

                        Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(10),
                            color: Color(0xffffecec),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Beneficiaries per Canteen', style: TextStyle(
                                    fontSize: 18,fontWeight: FontWeight.w400
                                ),),
                                Text('350', style: TextStyle(
                                    fontSize: 18,fontWeight: FontWeight.w900
                                ),
                                ),
                              ],
                            )
                        ),
                        SizedBox(height: 10,),
                        Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(10),
                            color: Color(0xffffdbda),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Number of Canteens', style: TextStyle(
                                    fontSize: 18,fontWeight: FontWeight.w400
                                ),),
                                Text('100', style: TextStyle(
                                    fontSize: 18,fontWeight: FontWeight.w900
                                ),
                                ),
                              ],
                            )
                        ),
                        SizedBox(height: 10,),
                        Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(10),
                            color: Color(0xffffecec),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Meal Price', style: TextStyle(
                                    fontSize: 18,fontWeight: FontWeight.w400
                                ),),
                                Text('29', style: TextStyle(
                                    fontSize: 18,fontWeight: FontWeight.w900
                                ),
                                ),
                              ],
                            )
                        ),
                        SizedBox(height: 10,),

                        Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(10),
                            color: Color(0xffe37c31),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Amount: ", style: TextStyle(
                                    fontSize: 18,fontWeight: FontWeight.w400, color: Colors.white
                                ),),
                                Text('$lunchAmount', style: TextStyle(
                                    fontSize: 18,fontWeight: FontWeight.w900, color: Colors.white
                                ),
                                ),
                              ],
                            )
                        ),

                      ],


                      CheckboxListTile(
                        title: const Text("Dinner", style: TextStyle(fontSize: 20),),
                        value: isDinner1,
                        onChanged: (newValue) {
                          setState(() {
                            isDinner1 = newValue!;
                            dinnerAmount=isDinner1 ? 1015000:0;
                            calculateTotal();
                          });
                        },
                      ),
                      if(isDinner1)...[

                        Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(10),
                            color: Color(0xffffecec),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Beneficiaries per Canteen', style: TextStyle(
                                    fontSize: 18,fontWeight: FontWeight.w400
                                ),),
                                Text('350', style: TextStyle(
                                    fontSize: 18,fontWeight: FontWeight.w900
                                ),
                                ),
                              ],
                            )
                        ),
                        SizedBox(height: 10,),
                        Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(10),
                            color: Color(0xffffdbda),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Number of Canteens', style: TextStyle(
                                    fontSize: 18,fontWeight: FontWeight.w400
                                ),),
                                Text('100', style: TextStyle(
                                    fontSize: 18,fontWeight: FontWeight.w900
                                ),
                                ),
                              ],
                            )
                        ),
                        SizedBox(height: 10,),
                        Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(10),
                            color: Color(0xffffecec),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Meal Price', style: TextStyle(
                                    fontSize: 18,fontWeight: FontWeight.w400
                                ),),
                                Text('29', style: TextStyle(
                                    fontSize: 18,fontWeight: FontWeight.w900
                                ),
                                ),
                              ],
                            )
                        ),
                        SizedBox(height: 10,),

                        Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(10),
                            color: Color(0xffe37c31),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Amount: ", style: TextStyle(
                                    fontSize: 18,fontWeight: FontWeight.w400, color: Colors.white
                                ),),
                                Text('$lunchAmount', style: TextStyle(
                                    fontSize: 18,fontWeight: FontWeight.w900, color: Colors.white
                                ),
                                ),
                              ],
                            )
                        ),

                      ],


                    ],


                    SizedBox(
                      height: 20,
                    ),

                    Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(10),
                        color: Color(0xff900c3f),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Total Amount: ", style: TextStyle(
                                fontSize: 22,fontWeight: FontWeight.w400, color: Colors.white
                            ),),
                            Text('₹  $totalAmount', style: TextStyle(
                                fontSize: 22,fontWeight: FontWeight.w900, color: Colors.yellow
                            ),
                            ),
                          ],
                        )
                    ),

                    SizedBox(height: 20,),
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
                            borderRadius: BorderRadius.circular(10), // Set the border radius to 10
                          ),
                        ),


                        child: const Text('Donate now', style: TextStyle(
                            fontSize: 24
                        ),),
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

    print('Total Amount: $totalAmount'); // Optional: Print the total amount for debugging
  }
}

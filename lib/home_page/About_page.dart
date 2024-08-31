import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffE20736),
        title: const Text(
          'About',
          style: TextStyle(
              fontWeight: FontWeight.w700, fontSize: 20, color: Colors.white),
        ),
      ),
      backgroundColor: Colors.white,
      body: const Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About',
              style: TextStyle(fontSize: 29, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 400,
              child: Text(
                  'After the state bifurcation, the state of Andhra Pradeshconsists of the 13 districts namely, Srikakulam, Vizianagaram, Visakhapatnam, East Godavari,West Godavari, Krishna, Guntur, Prakasam, SPS Nellore,Chittoor, Anantapur, Kurnool and YSR Kadapa with14 corporations and 96 municipalities & Nagar Panchayats.'),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 400,
              child: Text(
                  'The Directorate of Municipal Administration (DMA) is the apex authority of Municipal Administration Department of Government of Andhra Pradesh (GoAP), which provides guidance to Municipal Corporations and Municipalities in performing their day to day activities in adherence to the policies, procedures and guidelines provided by Municipal Administration and Urban Development Department to achieve effective civic administration. The Directorate is headed by the Director of Municipal Administration(DMA).'),
            )
          ],
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';

// class DonetionPage extends StatefulWidget {
//   @override
//   _DonetionPage createState() => _DonetionPage();
// }

// class _DonetionPage extends State<DonetionPage> {
//   final _formKey = GlobalKey<FormState>();

//   String contributionType = "Contribution on Special Occasion";
//   String locationType = "Preferred location";
//   String selectedDistrict = "District";
//   String selectedCity = "City";
//   String selectedAddress = "Address";
//   bool isBreakfast = false;
//   bool isLunch = false;
//   bool isDinner = false;
//   bool donation = false;

//   double breakfastAmount = 5950;
//   double lunchAmount = 0;
//   double dinnerAmount = 0;
//   double totalAmount = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Donation Form'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           child: Form(
//             key: _formKey,
//             child: Column(
//               children: <Widget>[
//                 Container(
//                     height: 250,
//                     width: double.infinity,
//                     padding: const EdgeInsets.all(20),
//                     // margin: EdgeInsets.all(10),
//                     decoration: const BoxDecoration(
//                         // borderRadius: BorderRadius.circular(40),
//                         image: DecorationImage(
//                             image: AssetImage(
//                               'assets/images/image.jpg',
//                             ),
//                             fit: BoxFit.cover))),
//                 // Contribution Type
//                 const Text('Contribution Type'),
//                 RadioListTile<String>(
//                   title: const Text('Donation'),
//                   value: "Donation",
//                   groupValue: contributionType,
//                   onChanged: (value) {
//                     setState(() {
//                       donation = true;
//                     });
//                   },
//                 ),
//                 RadioListTile<String>(
//                   title: const Text('Contribution on Special Occasion'),
//                   value: "Contribution on Special Occasion",
//                   groupValue: contributionType,
//                   onChanged: (value) {
//                     setState(() {
//                       contributionType = value!;
//                     });
//                   },
//                 ),
//                 const SizedBox(height: 20),

//                 if(donation)

//                 // Location
//                 const Text('Location'),
//                 RadioListTile<String>(
//                   title: const Text('State'),
//                   value: "State",
//                   groupValue: locationType,
//                   onChanged: (value) {
//                     setState(() {
//                       locationType = value!;
//                     });
//                   },
//                 ),
//                 RadioListTile<String>(
//                   title: const Text('District'),
//                   value: "District",
//                   groupValue: locationType,
//                   onChanged: (value) {
//                     setState(() {
//                       locationType = value!;
//                     });
//                   },
//                 ),
//                 RadioListTile<String>(
//                   title: const Text('Preferred location'),
//                   value: "Preferred location",
//                   groupValue: locationType,
//                   onChanged: (value) {
//                     setState(() {
//                       locationType = value!;
//                     });
//                   },
//                 ),

//                 // Dropdown Menus
//                 DropdownButtonFormField<String>(
//                   value: selectedDistrict,
//                   decoration: const InputDecoration(labelText: "District"),
//                   items: <String>['District', 'District 1', 'District 2']
//                       .map((String value) {
//                     return DropdownMenuItem<String>(
//                       value: value,
//                       child: Text(value),
//                     );
//                   }).toList(),
//                   onChanged: (newValue) {
//                     setState(() {
//                       selectedDistrict = newValue!;
//                     });
//                   },
//                 ),
//                 DropdownButtonFormField<String>(
//                   value: selectedCity,
//                   decoration: const InputDecoration(labelText: "City"),
//                   items:
//                       <String>['City', 'City 1', 'City 2'].map((String value) {
//                     return DropdownMenuItem<String>(
//                       value: value,
//                       child: Text(value),
//                     );
//                   }).toList(),
//                   onChanged: (newValue) {
//                     setState(() {
//                       selectedCity = newValue!;
//                     });
//                   },
//                 ),
//                 DropdownButtonFormField<String>(
//                   value: selectedAddress,
//                   decoration: const InputDecoration(labelText: "Address"),
//                   items: <String>['Address', 'Address 1', 'Address 2']
//                       .map((String value) {
//                     return DropdownMenuItem<String>(
//                       value: value,
//                       child: Text(value),
//                     );
//                   }).toList(),
//                   onChanged: (newValue) {
//                     setState(() {
//                       selectedAddress = newValue!;
//                     });
//                   },
//                 ),
//                 const SizedBox(height: 20),

//                 // Meals Selection
//                 CheckboxListTile(
//                   title: const Text("Breakfast"),
//                   value: isBreakfast,
//                   onChanged: (newValue) {
//                     setState(() {
//                       isBreakfast = newValue!;
//                       calculateTotal();
//                     });
//                   },
//                 ),
//                 if (isBreakfast) ...[
//                   const Text("Beneficiaries per Canteen: 350"),
//                   const Text("Number of Canteens: 35"),
//                   const Text("Meal Price: 75"),
//                   Text("Amount: $breakfastAmount"),
//                 ],
//                 CheckboxListTile(
//                   title: const Text("Lunch"),
//                   value: isLunch,
//                   onChanged: (newValue) {
//                     setState(() {
//                       isLunch = newValue!;
//                       lunchAmount = isLunch ? 6500 : 0;
//                       calculateTotal();
//                     });
//                   },
//                 ),
//                 CheckboxListTile(
//                   title: const Text("Dinner"),
//                   value: isDinner,
//                   onChanged: (newValue) {
//                     setState(() {
//                       isDinner = newValue!;
//                       dinnerAmount = isDinner ? 7000 : 0;
//                       calculateTotal();
//                     });
//                   },
//                 ),

//                 const SizedBox(height: 20),
//                 Text("Total Amount: $totalAmount",
//                     style: const TextStyle(fontWeight: FontWeight.bold)),
//                 const SizedBox(height: 20),
//                 ElevatedButton(
//                   onPressed: () {
//                     if (_formKey.currentState!.validate()) {
//                       // Handle donation submission
//                     }
//                   },
//                   child: const Text('Donate now'),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.red,
//                     foregroundColor: Colors.white,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   void calculateTotal() {
//     totalAmount = (isBreakfast ? breakfastAmount : 0) +
//         (isLunch ? lunchAmount : 0) +
//         (isDinner ? dinnerAmount : 0);
//   }
// }


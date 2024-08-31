// import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';

// class RatingPage extends StatefulWidget {
//   @override
//   _RatingPageState createState() => _RatingPageState();
// }

// class _RatingPageState extends State<RatingPage> {
//   double _rating = 0;

//   void _submitRating(double rating) {
//     // Implement your rating submission logic here
//     print("Rating submitted: $rating");
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Star Rating Example'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             RatingBar.builder(
//               initialRating: _rating,
//               minRating: 1,
//               itemSize: 40,
//               itemBuilder: (context, _) => const Icon(
//                 Icons.star,
//                 color: Colors.amber,
//               ),
//               onRatingUpdate: (rating) {
//                 setState(() {
//                   _rating = rating;
//                 });
//                 _submitRating(rating);
//               },
//             ),
//             const SizedBox(height: 20),
//             Text(
//               'Your Rating: $_rating',
//               style: const TextStyle(fontSize: 20),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

// //   Future<double> _fetchAverageRating() async {
// //     final response =
// //         await http.get(Uri.parse('https://yourapi.com/get-average-rating'));

// //     if (response.statusCode == 200) {
// //       final data = jsonDecode(response.body);
// //       return data['averageRating'];
// //     } else {
// //       throw Exception('Failed to load average rating');
// //     }
// //   }

// //   @override
// //   void initState() {
// //     super.initState();
// //     _fetchAverageRating().then((rating) {
// //       setState(() {
// //         _rating = rating;
// //       });
// //     });
// //   }
// // }

// // Future<void> _submitRating(double rating) async {
// //   final response = await http.post(
// //     Uri.parse('https://yourapi.com/submit-rating'),
// //     headers: <String, String>{
// //       'Content-Type': 'application/json; charset=UTF-8',
// //     },
// //     body: jsonEncode(<String, double>{
// //       'rating': rating,
// //     }),
// //   );

// //   if (response.statusCode == 200) {
// //     // Handle successful submission
// //     print('Rating submitted successfully');
// //   } else {
// //     // Handle error
// //     print('Failed to submit rating');
// //   }
// // }
// }

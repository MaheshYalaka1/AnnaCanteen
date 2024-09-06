import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class Reviewis extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('data'),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              sendPostRequest();
            },
            child: Text('mahesh')),
      ),
    );
  }

  Future<void> sendPostRequest() async {
    final url = 'https://annacanteenstrust.ap.gov.in/sbipaygateway.aspx';
    final data = {'Amount': '1', 'Phonenumber': "9553611852", "Name": 'fire'};
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
}

import 'package:flutter/material.dart';

import 'package:contactus/contactus.dart';

class Contact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:
     Scaffold(
        backgroundColor: Colors.teal,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 10),
          child: ContactUs(
            logo: AssetImage('images/logo.jpg'),
            email: 'rajaajamil23@gmail.com',
            companyName: 'Get Clinic Group',
            phoneNumber: '+967775174940',
            tagLine: 'Flutter Developer',
          ),
        ),
        bottomNavigationBar: ContactUsBottomAppBar(
          companyName: 'Get Clinic Group',
          textColor: Colors.white,
          backgroundColor: Colors.teal.shade300,
          email: 'rajaajamil23@gmail.com',
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Image.asset("assets/images/saloon.jpg"),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 20.0, right: 20.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(color: Color(0xff2c3925)),
                child: Column(
                  children: [
                    SizedBox(height: 20.0),
                    Text(
                      "  A professional beauty salon offering hair, nail, and skin services in a clean, relaxing environment, focused on expert care, quality products, and customer satisfaction.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: const Color.fromARGB(195, 255, 255, 255),
                        fontWeight: FontWeight.w500,
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(height: 30.0),
                    Container(
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(color: Color(0xfffdece7)),
                      child: Text(
                        "BOOK NOW",
                        style: TextStyle(
                          color: Color(0xff2c3925),
                          fontWeight: FontWeight.bold,
                          fontSize: 24.0,
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
}

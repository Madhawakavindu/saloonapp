import 'package:flutter/material.dart';
import 'package:saloon/services/widget_support.dart';

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
                    SizedBox(height: 50.0),
                    Text(
                      "  A professional beauty salon offering hair, nail, and skin services in a clean, relaxing environment, focused on expert care, quality products, and customer satisfaction.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: const Color.fromARGB(195, 255, 255, 255),
                        fontWeight: FontWeight.w500,
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(height: 90.0),
                    Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        height: 70.0,
                        width: 280.0,
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: Color(0xfffdece7),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            "BOOK NOW",
                            style: AppWidget.healineTextStyle(24.0),
                          ),
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

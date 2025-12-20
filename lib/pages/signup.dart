import 'package:flutter/material.dart';
import 'package:saloon/pages/login.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff172ca2),
      body: Container(
        margin: EdgeInsets.only(top: 50.0, left: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Row(children: [Image.asset("assets/images/pixel.jpg")]),
            Text(
              "Hello....!\nCreate an Account",
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Pacifico',
                fontWeight: FontWeight.bold,
                fontSize: 35.0,
              ),
            ),
            SizedBox(height: 80),
            Padding(
              padding: const EdgeInsets.only(right: 15.0, left: 5.0),
              child: Container(
                height: 55,
                decoration: BoxDecoration(
                  color: const Color(0xff4c5aa5),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,

                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(vertical: 16),
                    prefixIcon: const Icon(Icons.person, color: Colors.white),
                    hintText: "Name",
                    hintStyle: const TextStyle(color: Colors.white70),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30.0),

            Padding(
              padding: const EdgeInsets.only(right: 15, left: 5),
              child: Container(
                height: 55,
                decoration: BoxDecoration(
                  color: const Color(0xff4c5aa5),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,

                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(vertical: 16),
                    prefixIcon: const Icon(Icons.email, color: Colors.white),
                    hintText: "Email",
                    hintStyle: const TextStyle(color: Colors.white70),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30.0),

            Padding(
              padding: const EdgeInsets.only(right: 15, left: 5),
              child: Container(
                height: 55,
                decoration: BoxDecoration(
                  color: const Color(0xff4c5aa5),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,

                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(vertical: 16),
                    prefixIcon: const Icon(Icons.password, color: Colors.white),
                    hintText: "Password",
                    hintStyle: const TextStyle(color: Colors.white70),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30.0),

            Padding(
              padding: const EdgeInsets.only(right: 15, left: 5),
              child: Container(
                height: 55,
                decoration: BoxDecoration(
                  color: const Color(0xff4c5aa5),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,

                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(vertical: 16),
                    prefixIcon: const Icon(Icons.password, color: Colors.white),
                    hintText: "Confirm Password",
                    hintStyle: const TextStyle(color: Colors.white70),
                  ),
                ),
              ),
            ),
            SizedBox(height: 70.0),
            Center(
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  color: Color(0xfff85f3c),
                  borderRadius: BorderRadius.circular(60),
                ),
                width: 150,
                child: Center(
                  child: Text(
                    "Sign Up",

                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 150.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account ?",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(width: 5),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: Color(0xfff85f3c),
                      fontWeight: FontWeight.bold,
                      fontSize: 22.0,
                    ),
                  ),
                ),
              ],
            ),
            // Row(children: [Image.asset("assets/images/pixel.jpg")]),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color.fromARGB(255, 79, 18, 101),
      body: Container(
        child: Stack(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset("assets/images/pixel.jpg"),
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height / 3.5,
                left: 20.0,
              ),
              child: Column(
                children: [
                  Text(
                    "Welcome Back",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Pacifico',
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 35.0),

                  Container(
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
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 16,
                        ),
                        prefixIcon: const Icon(
                          Icons.email,
                          color: Colors.white,
                        ),
                        hintText: "Email",
                        hintStyle: const TextStyle(color: Colors.white70),
                      ),
                    ),
                  ),
                  SizedBox(height: 25.0),
                  Container(
                    height: 55,
                    decoration: BoxDecoration(
                      color: const Color(0xff4c5aa5),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: TextField(
                      obscureText: true, // shows dots ●●●
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 16,
                        ),
                        prefixIcon: const Icon(Icons.lock, color: Colors.white),
                        hintText: "Password",
                        hintStyle: const TextStyle(color: Colors.white70),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Forgot Password?",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                    ],
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
                          "Login",

                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 24.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 80.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "New User ? ",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 18.0,
                        ),
                      ),
                      Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Color(0xfff85f3c),
                          fontWeight: FontWeight.bold,
                          fontSize: 22.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

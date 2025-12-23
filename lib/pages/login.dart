import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:saloon/pages/signup.dart';
import 'package:saloon/pages/home.dart'; // ✅ ADDED THIS

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> userLogin() async {
    String email = emailController.text.trim();
    String password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please fill in both email and password"),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // ✅ PERFECT - Go to your Home page with bottom nav!
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const Home(), // Your salon home page!
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      String message;
      if (e.code == 'user-not-found') {
        message = "No User Found for that Email";
      } else if (e.code == 'wrong-password') {
        message = "Wrong Password Provided by User";
      } else {
        message = "An error occurred: ${e.message}";
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message, style: const TextStyle(color: Colors.white)),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 79, 18, 101),
      body: Container(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height / 3.5,
                left: 20.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Welcome Back",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Pacifico',
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 35.0),

                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Container(
                      height: 55,
                      decoration: BoxDecoration(
                        color: const Color(0xff4c5aa5),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TextField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(vertical: 16),
                          prefixIcon: Icon(Icons.email, color: Colors.white),
                          hintText: "Email",
                          hintStyle: TextStyle(color: Colors.white70),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 25.0),

                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Container(
                      height: 55,
                      decoration: BoxDecoration(
                        color: const Color(0xff4c5aa5),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TextField(
                        controller: passwordController,
                        obscureText: true,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(vertical: 16),
                          prefixIcon: Icon(Icons.lock, color: Colors.white),
                          hintText: "Password",
                          hintStyle: TextStyle(color: Colors.white70),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: const Text(
                          "Forgot Password?",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 70.0),

                  Center(
                    child: GestureDetector(
                      onTap: userLogin, // Direct call - clean and working
                      child: Container(
                        height: 60,
                        width: 150,
                        decoration: BoxDecoration(
                          color: const Color(0xfff85f3c),
                          borderRadius: BorderRadius.circular(60),
                        ),
                        child: const Center(
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
                  ),
                  const SizedBox(height: 80.0),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "New User ? ",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 18.0,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Signup(),
                            ),
                          );
                        },
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(
                            color: Color(0xfff85f3c),
                            fontWeight: FontWeight.bold,
                            fontSize: 22.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // ... YOUR ENTIRE UI CODE REMAINS EXACTLY THE SAME ...
            // GestureDetector onTap: userLogin stays perfect
          ],
        ),
      ),
    );
  }
}

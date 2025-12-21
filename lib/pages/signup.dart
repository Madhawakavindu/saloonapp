import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';
import 'package:saloon/pages/home.dart';
import 'package:saloon/pages/login.dart';
import 'package:saloon/services/shared_pref.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController mailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController confirmpasswordcontroller = TextEditingController();

  Future<void> registration() async {
    // ✅ CHECK EMPTY FIELDS
    if (namecontroller.text.trim().isEmpty ||
        mailcontroller.text.trim().isEmpty ||
        passwordcontroller.text.trim().isEmpty ||
        confirmpasswordcontroller.text.trim().isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Please fill all fields")));
      return;
    }

    // ✅ CHECK PASSWORD MATCH
    if (passwordcontroller.text.trim() !=
        confirmpasswordcontroller.text.trim()) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Passwords do not match")));
      return;
    }

    try {
      // ✅ FIREBASE AUTH
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: mailcontroller.text.trim(),
            password: passwordcontroller.text.trim(),
          );

      // ✅ RANDOM USER ID
      String id = randomAlphaNumeric(10);

      // ✅ FIRESTORE SAVE
      await FirebaseFirestore.instance.collection("users").doc(id).set({
        "Id": id,
        "Name": namecontroller.text.trim(),
        "Email": mailcontroller.text.trim(),
        "FirebaseUid": userCredential.user!.uid,
      });

      // ✅ SHARED PREFERENCES SAVE
      await SharedpreferenceHelper().saveUserId(id);
      await SharedpreferenceHelper().saveUserName(namecontroller.text.trim());
      await SharedpreferenceHelper().saveUserEmail(mailcontroller.text.trim());

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Account created successfully")),
      );

      // ✅ NAVIGATE TO LOGIN
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Home()),
      );
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.message ?? "Signup failed")));
    }
  }

  // ✅ COMMON TEXT FIELD WIDGET
  Widget buildField({
    required TextEditingController controller,
    required IconData icon,
    required String hint,
    bool isPassword = false,
  }) {
    return Container(
      height: 55,
      decoration: BoxDecoration(
        color: const Color(0xff4c5aa5),
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(icon, color: Colors.white),
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.white70),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff172ca2),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              const Text(
                "Hello....!\nCreate an Account",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 60),

              buildField(
                controller: namecontroller,
                icon: Icons.person,
                hint: "Name",
              ),
              const SizedBox(height: 25),

              buildField(
                controller: mailcontroller,
                icon: Icons.email,
                hint: "Email",
              ),
              const SizedBox(height: 25),

              buildField(
                controller: passwordcontroller,
                icon: Icons.lock,
                hint: "Password",
                isPassword: true,
              ),
              const SizedBox(height: 25),

              buildField(
                controller: confirmpasswordcontroller,
                icon: Icons.lock,
                hint: "Confirm Password",
                isPassword: true,
              ),
              const SizedBox(height: 50),

              Center(
                child: GestureDetector(
                  onTap: registration,
                  child: Container(
                    height: 60,
                    width: 150,
                    decoration: BoxDecoration(
                      color: const Color(0xfff85f3c),
                      borderRadius: BorderRadius.circular(60),
                    ),
                    child: const Center(
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 80),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account ? ",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Login()),
                      );
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        color: Color(0xfff85f3c),
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

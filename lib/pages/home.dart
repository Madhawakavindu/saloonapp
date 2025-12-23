import 'package:flutter/material.dart';
import 'package:saloon/services/widget_support.dart';
import 'package:saloon/pages/booking.dart'; // Your full booking page with payment

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const BookingPage(), // Uses the real BookingPage from booking.dart (serviceName is optional)
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xfffdece7),
        selectedItemColor: const Color(0xff2c3925),
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Bookings',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2c3925),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 50.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  "GOOD MORNING",
                  style: TextStyle(
                    color: const Color(0xfffdece7),
                    fontSize: 22.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  "MADHAWA",
                  style: TextStyle(
                    color: const Color(0xfffdece7),
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 120.0),
                child: Divider(color: const Color(0xfffdece7), thickness: 4.0),
              ),
              const SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Text(
                  "A professional beauty salon offering expert hair, nail, and skin care in a clean, relaxing environment.",
                  style: TextStyle(
                    color: const Color.fromARGB(195, 255, 255, 255),
                    fontWeight: FontWeight.w500,
                    fontSize: 16.0,
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(color: Color(0xfffdece7)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Divider(color: const Color(0xff2c3925), thickness: 8.0),
                    const SizedBox(height: 10.0),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text(
                        "SERVICES",
                        style: AppWidget.greenTextStyle(28.0),
                      ),
                    ),
                    const SizedBox(height: 20.0),

                    // HAIR CUT
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const BookingPage(serviceName: "HAIR CUT"),
                          ),
                        );
                      },
                      child: serviceRow(
                        context,
                        "assets/images/scissors.png",
                        "HAIR CUT",
                        "Professional beauty salon for hair,\n nail, and skin care.",
                      ),
                    ),

                    const SizedBox(height: 10.0),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                      child: Divider(
                        color: const Color(0xff2c3925),
                        thickness: 4.0,
                      ),
                    ),
                    const SizedBox(height: 20.0),

                    // SHAVING
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const BookingPage(serviceName: "SHAVING"),
                          ),
                        );
                      },
                      child: serviceRow(
                        context,
                        "assets/images/razor.webp",
                        "SHAVING",
                        "Professional shaving services with clean,\n smooth results.",
                      ),
                    ),

                    const SizedBox(height: 10.0),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                      child: Divider(
                        color: const Color(0xff2c3925),
                        thickness: 4.0,
                      ),
                    ),
                    const SizedBox(height: 20.0),

                    // CREAMBATH
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const BookingPage(serviceName: "CREAMBATH"),
                          ),
                        );
                      },
                      child: serviceRow(
                        context,
                        "assets/images/care.png",
                        "CREAMBATH",
                        "Relaxing creambath treatment for healthy,\n smooth hair.",
                      ),
                    ),

                    const SizedBox(height: 10.0),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                      child: Divider(
                        color: const Color(0xff2c3925),
                        thickness: 4.0,
                      ),
                    ),
                    const SizedBox(height: 20.0),

                    // HAIR COLORING
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const BookingPage(serviceName: "HAIR COLORING"),
                          ),
                        );
                      },
                      child: serviceRow(
                        context,
                        "assets/images/color.png",
                        "HAIR COLORING",
                        "Professional hair coloring for a fresh,\n stylish look.",
                      ),
                    ),

                    const SizedBox(height: 10.0),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                      child: Divider(
                        color: const Color(0xff2c3925),
                        thickness: 4.0,
                      ),
                    ),
                    const SizedBox(height: 20.0),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget serviceRow(
    BuildContext context,
    String imagePath,
    String title,
    String description,
  ) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(2.0),
            decoration: BoxDecoration(
              color: const Color(0xfffdece7),
              border: Border.all(color: const Color(0xff2c3925), width: 5.0),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: const Color(0xff2c3925),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(
                imagePath,
                height: 50,
                width: 50,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 20.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: AppWidget.greenTextStyle(24.0)),
              const SizedBox(height: 5.0),
              Text(
                description,
                style: const TextStyle(
                  color: Color(0xff2c3925),
                  fontWeight: FontWeight.w500,
                  fontSize: 14.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Profile Page (placeholder - you can improve later)
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      body: const Center(
        child: Text('Profile Page', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}

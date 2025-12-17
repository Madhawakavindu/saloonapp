import 'package:flutter/material.dart';
import 'package:saloon/services/widget_support.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  // Pages for BottomNavigationBar
  final List<Widget> _pages = [
    const HomePage(),
    const BookingPage(),
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
      backgroundColor: Color(0xff2c3925),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 50.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "GOOD MORNING",
                      style: TextStyle(
                        color: Color(0xfffdece7),
                        fontSize: 22.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                "MADHAWA",
                style: TextStyle(
                  color: Color(0xfffdece7),
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 120.0),
                child: Divider(color: Color(0xfffdece7), thickness: 4.0),
              ),
              SizedBox(height: 10.0),
              Text(
                "A professional beauty salon offering expert hair, nail, and skin care in a clean, relaxing environment.",
                style: TextStyle(
                  color: const Color.fromARGB(195, 255, 255, 255),
                  fontWeight: FontWeight.w500,
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(color: Color(0xfffdece7)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Divider(color: Color(0xff2c3925), thickness: 8.0),
                    SizedBox(height: 10.0),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text(
                        "SERVICES",
                        style: AppWidget.greenTextStyle(28.0),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(2.0),
                            decoration: BoxDecoration(
                              color: Color(0xfffdece7),
                              border: Border.all(
                                color: Color(0xff2c3925),
                                width: 5.0,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Container(
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                color: Color(0xff2c3925),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Image.asset(
                                "assets/images/scissors.png",
                                height: 50,
                                width: 50,
                                fit: BoxFit.cover,
                                //color: Color(0xfffdece7),
                              ),
                            ),
                          ),
                          SizedBox(width: 20.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "HAIR CUT",
                                style: AppWidget.greenTextStyle(24.0),
                              ),
                              SizedBox(height: 5.0),
                              Text(
                                " Professional beauty salon for hair,\n nail, and skin care.",
                                // textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: Color(0xff2c3925),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14.0,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                      child: Divider(color: Color(0xff2c3925), thickness: 4.0),
                    ),
                    SizedBox(height: 20.0),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(2.0),
                            decoration: BoxDecoration(
                              color: Color(0xfffdece7),
                              border: Border.all(
                                color: Color(0xff2c3925),
                                width: 5.0,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Container(
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                color: Color(0xff2c3925),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Image.asset(
                                "assets/images/razor.webp",
                                height: 50,
                                width: 50,
                                fit: BoxFit.cover,
                                //color: Color(0xfffdece7),
                              ),
                            ),
                          ),
                          SizedBox(width: 20.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "SHAVING",
                                style: AppWidget.greenTextStyle(24.0),
                              ),
                              SizedBox(height: 5.0),
                              Text(
                                " Professional shaving services with clean,\n smooth results.",
                                // textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: Color(0xff2c3925),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14.0,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                      child: Divider(color: Color(0xff2c3925), thickness: 4.0),
                    ),
                    SizedBox(height: 20.0),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(2.0),
                            decoration: BoxDecoration(
                              color: Color(0xfffdece7),
                              border: Border.all(
                                color: Color(0xff2c3925),
                                width: 5.0,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Container(
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                color: Color(0xff2c3925),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Image.asset(
                                "assets/images/care.png",
                                height: 50,
                                width: 50,
                                fit: BoxFit.cover,
                                //color: Color(0xfffdece7),
                              ),
                            ),
                          ),
                          SizedBox(width: 20.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "CREAMBATH",
                                style: AppWidget.greenTextStyle(24.0),
                              ),
                              SizedBox(height: 5.0),
                              Text(
                                " Relaxing creambath treatment for healthy,\n smooth hair.",
                                // textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: Color(0xff2c3925),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14.0,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                      child: Divider(color: Color(0xff2c3925), thickness: 4.0),
                    ),
                    SizedBox(height: 20.0),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(2.0),
                            decoration: BoxDecoration(
                              color: Color(0xfffdece7),
                              border: Border.all(
                                color: Color(0xff2c3925),
                                width: 5.0,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Container(
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                color: Color(0xff2c3925),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Image.asset(
                                "assets/images/color.png",
                                height: 50,
                                width: 50,
                                fit: BoxFit.cover,
                                //color: Color(0xfffdece7),
                              ),
                            ),
                          ),
                          SizedBox(width: 20.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "HAIR COLORING",
                                style: AppWidget.greenTextStyle(24.0),
                              ),
                              SizedBox(height: 5.0),
                              Text(
                                " Professional hair coloring for a fresh,\n stylish look.",
                                // textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: Color(0xff2c3925),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14.0,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                      child: Divider(color: Color(0xff2c3925), thickness: 4.0),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Booking Page Placeholder
class BookingPage extends StatelessWidget {
  const BookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[100],
      body: const Center(
        child: Text('Booking Page', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}

// Profile Page Placeholder
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

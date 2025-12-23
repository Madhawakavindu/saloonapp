import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class BookingPage extends StatefulWidget {
  final String? serviceName; // ← Optional: null when coming from bottom tab

  const BookingPage({super.key, this.serviceName});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  int selectedDayIndex = 1; // Default: Tue
  int? selectedTimeIndex;

  bool isBookingConfirmed = false;

  final List<String> days = ['Fri', 'Sat', 'Sun', 'Mon', 'Tue', 'Wed', 'Thu'];
  final List<int> dates = [5, 6, 7, 8, 9, 10, 11];

  final List<String> times = [
    '09:00 AM',
    '10:00 AM',
    '11:00 AM',
    '12:00 PM',
    '01:00 PM',
    '02:00 PM',
    '03:00 PM',
    '04:00 PM',
    '05:00 PM',
    '06:00 PM',
    '07:00 PM',
    '08:00 PM',
    '09:00 PM',
  ];

  // Mock payment intent (replace with real backend later)
  Future<Map<String, dynamic>> createPaymentIntent(
    String amount,
    String currency,
  ) async {
    // For testing only — in production, call your server
    await Future.delayed(const Duration(seconds: 1));
    return {
      'client_secret': 'pi_3XXXX_secret_XXXX', // Use Stripe test secret
    };
  }

  Future<void> makePayment() async {
    if (selectedTimeIndex == null) return;

    try {
      final paymentIntentData = await createPaymentIntent('5000', 'USD'); // $50

      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntentData['client_secret'],
          merchantDisplayName: 'Madhawa Saloon',
          style: ThemeMode.dark,
        ),
      );

      await Stripe.instance.presentPaymentSheet();

      setState(() {
        isBookingConfirmed = true;
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Row(
              children: [
                Icon(Icons.check_circle, color: Colors.white),
                SizedBox(width: 10),
                Text("Payment Successful"),
              ],
            ),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Payment failed: $e"),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2c3925),
      appBar: AppBar(
        backgroundColor: const Color(0xff2c3925),
        foregroundColor: Colors.white,
        title: Text(
          widget.serviceName != null
              ? "Booking - ${widget.serviceName}"
              : "Choose Your Slot",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Optional: Show selected service at top
              if (widget.serviceName != null) ...[
                Center(
                  child: Text(
                    widget.serviceName!,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Color(0xfffdece7),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
              ],

              // Profile Header (only show if no service name — for general bookings tab)
              if (widget.serviceName == null)
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/images/barber.jpg'),
                    ),
                    const SizedBox(width: 15),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "JOHN DOE",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "Barberman",
                          style: TextStyle(fontSize: 16, color: Colors.white70),
                        ),
                      ],
                    ),
                  ],
                ),

              if (widget.serviceName == null) const SizedBox(height: 40),

              const Text(
                "CHOOSE YOUR SLOT",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),

              // Date Selector
              SizedBox(
                height: 80,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: days.length,
                  itemBuilder: (context, index) {
                    bool isSelected = selectedDayIndex == index;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedDayIndex = index;
                          selectedTimeIndex = null;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 12),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? const Color(0xfffdece7)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: const Color(0xfffdece7),
                            width: 2,
                          ),
                        ),
                        child: Column(
                          children: [
                            Text(
                              days[index],
                              style: TextStyle(
                                color: isSelected
                                    ? const Color(0xff2c3925)
                                    : const Color(0xfffdece7),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              dates[index].toString(),
                              style: TextStyle(
                                color: isSelected
                                    ? const Color(0xff2c3925)
                                    : const Color(0xfffdece7),
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 40),

              const Text(
                "CHOOSE YOUR TIME",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),

              // Time Grid
              Expanded(
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 2.5,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                  ),
                  itemCount: times.length,
                  itemBuilder: (context, index) {
                    bool isSelected = selectedTimeIndex == index;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedTimeIndex = index;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: isSelected
                              ? const Color(0xfffdece7)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                            color: const Color(0xfffdece7),
                            width: 2,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            times[index],
                            style: TextStyle(
                              color: isSelected
                                  ? const Color(0xff2c3925)
                                  : const Color(0xfffdece7),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              // Success Banner
              if (isBookingConfirmed)
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    color: Colors.green[800],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Text(
                    "Your Slot has been Booked Successfully!",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

              const SizedBox(height: 10),

              // BOOK NOW Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: (selectedTimeIndex == null || isBookingConfirmed)
                      ? null
                      : makePayment,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xfffdece7),
                    foregroundColor: const Color(0xff2c3925),
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    isBookingConfirmed ? "BOOKED" : "BOOK NOW",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;

class BookingPage extends StatefulWidget {
  final String? serviceName;

  const BookingPage({super.key, this.serviceName});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  int selectedDayIndex = 0;
  int? selectedTimeIndex;

  late List<DateTime> weekDates;
  Timer? _midnightTimer;

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

  @override
  void initState() {
    super.initState();
    _generateWeekDates();
    _scheduleMidnightUpdate();
  }

  void _generateWeekDates() {
    final today = DateTime.now();
    weekDates = List.generate(
      7,
      (index) => DateTime(today.year, today.month, today.day + index),
    );
    selectedDayIndex = 0;
    selectedTimeIndex = null;
  }

  void _scheduleMidnightUpdate() {
    final now = DateTime.now();
    final nextMidnight = DateTime(now.year, now.month, now.day + 1);
    final duration = nextMidnight.difference(now);

    _midnightTimer?.cancel();
    _midnightTimer = Timer(duration, () {
      if (!mounted) return;
      setState(_generateWeekDates);
      _scheduleMidnightUpdate();
    });
  }

  @override
  void dispose() {
    _midnightTimer?.cancel();
    super.dispose();
  }

  // ================= STRIPE PAYMENT =================

  Future<void> _makePayment() async {
    try {
      final response = await http.post(
        Uri.parse("http://10.0.2.2:4242/create-payment-intent"),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "amount": 1000, // 1000 cents = LKR 1000
          "currency": "lkr",
        }),
      );

      final data = jsonDecode(response.body);

      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: data['clientSecret'],
          merchantDisplayName: 'Salon App',
        ),
      );

      await Stripe.instance.presentPaymentSheet();

      _showSuccess();
    } on StripeException catch (e) {
      _showError(e.error.message ?? "Payment cancelled");
    } catch (e) {
      _showError("Payment failed");
    }
  }

  void _showSuccess() {
    final selectedDate = weekDates[selectedDayIndex];
    final dateText = DateFormat('EEEE, MMM d').format(selectedDate);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: const Color(0xff2c3925),
        content: Text(
          "Booking Confirmed\n$dateText at ${times[selectedTimeIndex!]}",
        ),
      ),
    );
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(backgroundColor: Colors.red, content: Text(message)),
    );
  }

  // ================= UI =================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2c3925),
      appBar: AppBar(
        backgroundColor: const Color(0xff2c3925),
        foregroundColor: Colors.white,
        title: Text("Booking - ${widget.serviceName ?? ''}"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                widget.serviceName ?? '',
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color(0xfffdece7),
                ),
              ),
            ),

            const SizedBox(height: 30),
            const Text(
              "CHOOSE YOUR SLOT",
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 20),

            SizedBox(
              height: 80,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: weekDates.length,
                itemBuilder: (context, index) {
                  final date = weekDates[index];
                  final selected = selectedDayIndex == index;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedDayIndex = index;
                        selectedTimeIndex = null;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 12),
                      width: 70,
                      decoration: BoxDecoration(
                        color: selected
                            ? const Color(0xfffdece7)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.white),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            DateFormat('EEE').format(date),
                            style: TextStyle(
                              color: selected
                                  ? const Color(0xff2c3925)
                                  : Colors.white,
                            ),
                          ),
                          Text(
                            date.day.toString(),
                            style: TextStyle(
                              fontSize: 22,
                              color: selected
                                  ? const Color(0xff2c3925)
                                  : Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 30),
            const Text(
              "CHOOSE YOUR TIME",
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 20),

            Expanded(
              child: GridView.builder(
                itemCount: times.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 2.8,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemBuilder: (context, index) {
                  final selected = selectedTimeIndex == index;

                  return GestureDetector(
                    onTap: () => setState(() => selectedTimeIndex = index),
                    child: Container(
                      decoration: BoxDecoration(
                        color: selected
                            ? const Color(0xfffdece7)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: Colors.white),
                      ),
                      child: Center(
                        child: Text(
                          times[index],
                          style: TextStyle(
                            color: selected
                                ? const Color(0xff2c3925)
                                : Colors.white,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: selectedTimeIndex == null ? null : _makePayment,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xfffdece7),
                  foregroundColor: const Color(0xff2c3925),
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text("BOOK & PAY", style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

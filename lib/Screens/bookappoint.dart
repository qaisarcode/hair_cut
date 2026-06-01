import 'package:flutter/material.dart';
import 'package:hair_cut/Screens/appoint_you.dart';
import 'package:hair_cut/Utils/elevated_bu.dart';
import 'package:hair_cut/provider/booking_provider.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class Bookappoint extends StatefulWidget {
  const Bookappoint({super.key});

  @override
  State<Bookappoint> createState() => _BookappointState();
}

class _BookappointState extends State<Bookappoint> {
  DateTime today = DateTime.now();
  DateTime focusedDay = DateTime.now();
  int selectedIndex = 0;
  int _selectedTime = -1; // -1 matlab koi select nahi

  final List<Map<String, dynamic>> timeSlots = [
    {"time": "08:00", "available": true},
    {"time": "08:30", "available": true},
    {"time": "09:00", "available": false},
    {"time": "09:30", "available": true},
    {"time": "10:00", "available": true},
    {"time": "10:30", "available": true},
    {"time": "11:30", "available": true},
    {"time": "13:00", "available": true},
    {"time": "15:30", "available": true},
    {"time": "16:00", "available": false},
    {"time": "17:00", "available": true},
    {"time": "17:30", "available": true},
  ];

  List services = [
    {
      "image": "assets/images/cs1.png",
      "name": "Basic haircut",
      "price": "\$20",
    },
    {"image": "assets/images/cs2.png", "name": "Kids haircut", "price": "\$15"},
    {
      "image": "assets/images/cs3.png",
      "name": "Hair coloring",
      "price": "\$30",
    },
    {"image": "assets/images/cs4.png", "name": "Hair styling", "price": "\$25"},
  ];

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    final booking = Provider.of<BookingProvider>(context);
    return Scaffold(
      appBar: AppBar(title: const Text("Book Appointment")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),

            // ✅ Calendar
            const Text(
              "Choose date",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            TableCalendar(
              focusedDay: booking.focustoday,
              firstDay: DateTime(2020),
              lastDay: DateTime(2030),
              selectedDayPredicate: (day) => isSameDay(booking.today, day),
              onDaySelected: (selectedDay, focused) {
                context.read<BookingProvider>().updatedate(
                  selectedDay,
                  focused,
                );
              },
              headerStyle: const HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
                leftChevronIcon: Icon(Icons.chevron_left),
                rightChevronIcon: Icon(Icons.chevron_right),
              ),
              calendarStyle: const CalendarStyle(
                todayDecoration: BoxDecoration(
                  color: Color(0xff363062),
                  shape: BoxShape.circle,
                ),
                selectedDecoration: BoxDecoration(
                  color: Color(0xff363062),
                  shape: BoxShape.circle,
                ),
                weekendTextStyle: TextStyle(color: Colors.black),
              ),
            ),

            const SizedBox(height: 24),

            // ✅ Choose Service
            const Text(
              "Choose Service",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: screenHeight * 0.15,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: services.length,
                itemBuilder: (context, index) {
                  final service = services[index];
                  bool isSelected = booking.selectedSrevicesindex == index;

                  return GestureDetector(
                    onTap: () {
                      context.read<BookingProvider>().updatteservices(
                        index,
                        service['name'],
                        service["price"],
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Column(
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              CircleAvatar(
                                radius: 35,
                                backgroundImage: AssetImage(service["image"]),
                              ),
                              if (isSelected)
                                Container(
                                  width: screenHeight * 0.08,
                                  height: screenHeight * 0.08,
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.4),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              if (isSelected)
                                const Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: 30,
                                ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            service["name"],
                            style: const TextStyle(fontSize: 14),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            service["price"],
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 24),
            const Text(
              "Available time",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: List.generate(timeSlots.length, (index) {
                final slot = timeSlots[index];
                final bool isAvailable = slot["available"];
                final bool isSelected = booking.selectedTime == index;

                return GestureDetector(
                  onTap: isAvailable
                      ? () {
                          context.read<BookingProvider>().updatetime(
                            index,
                            slot["time"],
                          );
                        }
                      : null,
                  child: Container(
                    width: 80,
                    height: screenHeight * 0.05,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: isSelected
                          ? Color(0xff363062)
                          : isAvailable
                          ? Color(0xffFFFFFF)
                          : Color(0xffF3F4F6),
                      border: Border.all(
                        color: isSelected
                            ? Color(0xff363062)
                            : isAvailable
                            ? Color(0xffCBD5E1)
                            : Color(0xffE5E7EB),
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      slot["time"],
                      style: TextStyle(
                        color: isSelected
                            ? Color(0xffFFFFFF)
                            : isAvailable
                            ? Color(0xff111827)
                            : Color(0xffD1D5DB),
                        fontSize: 14,
                        fontWeight: isSelected
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                  ),
                );
              }),
            ),

            const SizedBox(height: 24),
            const Text(
              "Payment summary",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xffF9FAFB),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Color(0xffE5E7EB)),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(services[booking.selectedSrevicesindex]["name"]),
                      Text(services[booking.selectedSrevicesindex]["price"]),
                    ],
                  ),
                  const Divider(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [Text("Admin fee"), Text("\$10")],
                  ),
                  const Divider(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Total",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        services[selectedIndex]["price"],
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),
            Align(
              alignment: Alignment.center,
              child: ElevatedBu(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AppointYou()),
                  );
                },
                name: "Deal booking",
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

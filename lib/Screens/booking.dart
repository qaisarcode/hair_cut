import 'package:flutter/material.dart';
import 'package:hair_cut/Utils/nare_shops.dart';
import 'package:hair_cut/Utils/our_tim.dart';
import 'package:hair_cut/res/app_color.dart';

class Booking extends StatefulWidget {
  const Booking({super.key});

  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  int currentStep = 0; // 0=Booked, 1=Waiting, 2=On Process, 3=Finished

  final List<Map<String, dynamic>> steps = [
    {"label": "Booked", "icon": Icons.calendar_today_outlined},
    {"label": "Waiting", "icon": Icons.timer_outlined},
    {"label": "On Process", "icon": Icons.content_cut_outlined},
    {"label": "Finished", "icon": Icons.verified_outlined},
  ];
  final List<OurTim> ldata = [
    OurTim(
      image: "assets/images/c1.png",
      name: "Basic haircut",
      subtitle: "Basic haircut & vitamint",
      addyou: "\$20",
      icon: null,
    ),
    OurTim(
      image: "assets/images/c2.png",
      name: "Kids haircut",
      subtitle: "Special kids haircut",
      addyou: "\$15",
      icon: null,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: AppColor.white),
          backgroundColor: AppColor.blue,
          title: Row(
            children: [
              Text("Booking", style: TextStyle(color: AppColor.white)),
              Spacer(),
              Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(),
                child: Image.asset("assets/images/logo.png"),
              ),
              SizedBox(width: 10),
              Text("Hair cut", style: TextStyle(color: AppColor.white)),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 18, right: 18, top: 18),
          child: Column(
            children: [
              // ✅ TabBar
              Container(
                padding: EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColor.perpel,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: TabBar(
                  indicator: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  indicatorSize: TabBarIndicatorSize.tab,
                  dividerColor: Colors.transparent,
                  labelColor: AppColor.blue,
                  unselectedLabelColor: AppColor.gray,
                  labelStyle: TextStyle(fontWeight: FontWeight.bold),
                  tabs: [
                    Tab(text: "Active booking"),
                    Tab(text: "History"),
                  ],
                ),
              ),

              // ✅ TabBarView
              Expanded(
                child: TabBarView(
                  children: [
                    // ── Active Booking Tab ──
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // ✅ Step Progress Indicator
                            // _buildStepIndicator(),
                            Column(
                              children: [
                                // Icons Row
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: List.generate(steps.length, (
                                    index,
                                  ) {
                                    bool isActive = index <= currentStep;
                                    return Icon(
                                      steps[index]["icon"],
                                      color: isActive
                                          ? AppColor.blue
                                          : Colors.grey.shade300,
                                      size: 26,
                                    );
                                  }),
                                ),

                                SizedBox(height: 10),

                                // Progress Line + Circles
                                Stack(
                                  alignment: Alignment.centerLeft,
                                  children: [
                                    // Grey background line
                                    Container(
                                      height: 4,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade200,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),

                                    // Orange active line
                                    LayoutBuilder(
                                      builder: (context, constraints) {
                                        double totalWidth =
                                            constraints.maxWidth;
                                        double stepWidth =
                                            totalWidth / (steps.length - 1);
                                        double progressWidth =
                                            currentStep * stepWidth;

                                        return AnimatedContainer(
                                          duration: Duration(milliseconds: 400),
                                          height: 4,
                                          width: progressWidth,
                                          decoration: BoxDecoration(
                                            color: Colors.orange,
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                          ),
                                        );
                                      },
                                    ),

                                    // Circles
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: List.generate(steps.length, (
                                        index,
                                      ) {
                                        bool isActive = index <= currentStep;
                                        bool isCurrent = index == currentStep;

                                        return AnimatedContainer(
                                          duration: Duration(milliseconds: 400),
                                          width: isCurrent ? 22 : 14,
                                          height: isCurrent ? 22 : 14,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: isActive
                                                ? Colors.orange
                                                : Colors.grey.shade200,
                                            border: Border.all(
                                              color: isCurrent
                                                  ? Colors.white
                                                  : Colors.transparent,
                                              width: 3,
                                            ),
                                            boxShadow: isCurrent
                                                ? [
                                                    BoxShadow(
                                                      color: Colors.orange
                                                          .withOpacity(0.4),
                                                      blurRadius: 6,
                                                      spreadRadius: 2,
                                                    ),
                                                  ]
                                                : [],
                                          ),
                                        );
                                      }),
                                    ),
                                  ],
                                ),

                                SizedBox(height: 14),

                                // Labels Row
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: List.generate(steps.length, (
                                    index,
                                  ) {
                                    bool isActive = index <= currentStep;

                                    return AnimatedContainer(
                                      duration: Duration(milliseconds: 400),
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 6,
                                      ),
                                      decoration: BoxDecoration(
                                        color: isActive
                                            ? AppColor.blue
                                            : Colors.grey.shade200,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Text(
                                        steps[index]["label"],
                                        style: TextStyle(
                                          color: isActive
                                              ? AppColor.white
                                              : Colors.grey,
                                          fontSize: 11,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    );
                                  }),
                                ),
                              ],
                            ),
                            SizedBox(height: 30),
                            NareShops(
                              image: "assets/images/sho1.png",
                              sname:
                                  "Master piece Barbershop - Haircut styling",
                              duration: "Jogja Expo Centre  (2 km)",
                              reating: "5.0",
                            ),
                            SizedBox(height: 30),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Icon(Icons.location_on, color: AppColor.blue),
                                Icon(Icons.chat, color: AppColor.blue),
                                SizedBox(width: 40),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColor.blue,
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadiusGeometry.circular(10),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: Text(
                                    "Cancel",
                                    style: TextStyle(color: AppColor.white),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            currentStep == 1
                                ? Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 10,
                                    ),
                                    width: screenwidth * 3,
                                    height: 52,
                                    decoration: BoxDecoration(
                                      color: AppColor.perpel,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(Icons.timer),
                                        SizedBox(width: 10),
                                        Text(
                                          "Time Estimation",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Spacer(),
                                        Text(
                                          "-50 Menit",
                                          style: TextStyle(
                                            color: AppColor.gray,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                : SizedBox.shrink(),
                            currentStep == 2
                                ? Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 10,
                                    ),
                                    width: screenwidth * 3,
                                    height: 52,
                                    decoration: BoxDecoration(
                                      color: AppColor.perpel,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(Icons.cut),
                                        SizedBox(width: 10),
                                        Text(
                                          "On process",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Spacer(),
                                        Text(
                                          "30 Menit",
                                          style: TextStyle(
                                            color: AppColor.gray,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                : SizedBox.shrink(),
                            SizedBox(height: 10),
                            // ✅ Next/Back Buttons (test ke liye)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColor.perpel,
                                  ),
                                  onPressed: currentStep > 0
                                      ? () => setState(() => currentStep--)
                                      : null,
                                  child: Text(
                                    "Back",
                                    style: TextStyle(color: AppColor.white),
                                  ),
                                ),
                                SizedBox(width: 16),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColor.blue,
                                  ),
                                  onPressed: currentStep < steps.length - 1
                                      ? () => setState(() => currentStep++)
                                      : null,
                                  child: Text(
                                    "Next",
                                    style: TextStyle(color: AppColor.white),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.calendar_month),
                                Text("Date & time"),
                              ],
                            ),
                            Text("Sun, 15 Jan  - 08:00 AM"),
                            SizedBox(height: 30),
                            Row(
                              children: [
                                Icon(Icons.cut),
                                Text(
                                  "Service selected",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: ldata.length,
                              itemBuilder: (context, index) {
                                final d = ldata[index];
                                return OurTim(
                                  image: d.image,
                                  name: d.name,
                                  subtitle: d.subtitle,
                                  addyou: d.addyou,
                                );
                              },
                            ),
                            Row(
                              children: [
                                Icon(Icons.person),
                                Text(
                                  "Master barber",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            OurTim(
                              image: "assets/images/e1.png",
                              name: "Luther Hammes",
                              subtitle: "Specialist Haircut",
                              addyou: "",
                            ),
                          ],
                        ),
                      ),
                    ),
                    // ── History Tab ──
                    Center(child: Text("History here")),
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

import 'package:flutter/material.dart';
import 'package:hair_cut/Utils/nare_shops.dart';
import 'package:hair_cut/res/app_color.dart';

class AddReview extends StatefulWidget {
  const AddReview({super.key});

  @override
  State<AddReview> createState() => _AddReviewState();
}

class _AddReviewState extends State<AddReview> {
  // ✅ Selected chips
  List<String> selectedChips = [];

  // ✅ Star rating
  int selectedStar = 4;

  // ✅ All chips
  final List<String> allChips = [
    "Overall good",
    "Good service",
    "Satisfying",
    "Comfortable",
    "Recommended",
    "Cheap",
    "Perfect results",
    "Accurate estimate",
  ];
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.blue,
        iconTheme: IconThemeData(color: AppColor.white),
        title: Text("Rating & review", style: TextStyle(color: AppColor.white)),
      ),
      body: Stack(
        children: [
          // ✅ Blue top section
          Container(
            padding: EdgeInsets.symmetric(horizontal: 18, vertical: 40),
            width: double.infinity,
            decoration: BoxDecoration(color: AppColor.blue),
            child: Column(
              children: [
                NareShops(
                  image: "assets/images/sho1.png",
                  sname: "Twinsky Monkey Barber & Men Stuff",
                  duration: "Jogja Expo Centre  (2 km)",
                  reating: "5.0",
                  onTap: () {},
                ),
              ],
            ),
          ),

          // ✅ White bottom sheet
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 24),
              width: double.infinity,
              height: screenHeight * 0.60,
              decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ✅ Rating stars
                    Text(
                      "Rating",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(height: 6),
                    Row(
                      children: List.generate(5, (index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedStar = index + 1;
                            });
                          },
                          child: Icon(
                            index < selectedStar
                                ? Icons.star
                                : Icons.star_border,
                            color: Colors.amber,
                            size: 45,
                          ),
                        );
                      }),
                    ),

                    SizedBox(height: 14),

                    // ✅ Review text box — chips upar show honge
                    Text(
                      "Review",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(height: 6),
                    Container(
                      width: double.infinity,
                      height: screenHeight * 0.20,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // ✅ Selected chips upar box mein
                          if (selectedChips.isNotEmpty)
                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: selectedChips.map((chip) {
                                return Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 5,
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey.shade400,
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        chip,
                                        style: TextStyle(fontSize: 12),
                                      ),
                                      SizedBox(width: 4),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            selectedChips.remove(chip);
                                          });
                                        },
                                        child: Icon(
                                          Icons.close,
                                          size: 14,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }).toList(),
                            ),
                        ],
                      ),
                    ),

                    SizedBox(height: 14),

                    // ✅ Neeche wale chips — select karne ke liye
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: allChips.map((chip) {
                        bool isSelected = selectedChips.contains(chip);
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              if (isSelected) {
                                selectedChips.remove(chip);
                              } else {
                                selectedChips.add(chip);
                              }
                            });
                          },
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 200),
                            padding: EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? AppColor.blue
                                  : Colors.transparent,
                              border: Border.all(
                                color: isSelected
                                    ? AppColor.blue
                                    : Colors.grey.shade400,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              chip,
                              style: TextStyle(
                                fontSize: 13,
                                color: isSelected
                                    ? Colors.white
                                    : Colors.black87,
                                fontWeight: isSelected
                                    ? FontWeight.w600
                                    : FontWeight.normal,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),

                    SizedBox(height: 24),

                    // ✅ Submit button
                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          "Submit Review",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

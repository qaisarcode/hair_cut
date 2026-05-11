import 'package:flutter/material.dart';

class ReviewCo extends StatelessWidget {
  final String image;
  final String name;
  final String addreview;
  double reating;
  ReviewCo({
    super.key,
    required this.image,
    required this.name,
    required this.addreview,
    required this.reating,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(radius: 25, backgroundImage: AssetImage(image)),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: TextStyle(fontSize: 20)),
                Row(
                  children: [
                    Row(
                      children: List.generate(
                        5,
                        (index) => Icon(
                          index < reating ? Icons.star : Icons.star_border,
                          color: Colors.amber,
                          size: 22,
                        ),
                      ),
                    ),
                    Text(
                      "("
                      "$reating"
                      ")",
                      style: TextStyle(color: Color(0xff6B7280)),
                    ),
                  ],
                ),
                Text(addreview, style: TextStyle(color: Color(0xff6B7280))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

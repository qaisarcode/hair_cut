import 'package:flutter/material.dart';

class NareShops extends StatelessWidget {
  final String image;
  final String sname;
  final String duration;
  final String reating;
  const NareShops({
    super.key,
    required this.image,
    required this.sname,
    required this.duration,
    required this.reating,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 339,
      decoration: BoxDecoration(color: Color(0xffFFFFFF)),
      child: Row(
        children: [
          Image.asset(image, height: 100),
          SizedBox(width: 5),
          Expanded(
            child: Column(
              children: [
                Text(sname),
                Row(
                  children: [
                    Icon(Icons.location_on, size: 20, color: Color(0xff8683A1)),
                    SizedBox(width: 5),
                    Text(duration, style: TextStyle(color: Color(0xff8683A1))),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.star, size: 20, color: Color(0xff8683A1)),
                    SizedBox(width: 5),
                    Text(reating, style: TextStyle(color: Color(0xff8683A1))),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

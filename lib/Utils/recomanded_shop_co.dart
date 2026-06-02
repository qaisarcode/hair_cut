import 'package:flutter/material.dart';

class RecomandedShopCo extends StatelessWidget {
  final String image1;
  final String name;
  final String location;
  final String reating;
  final String buttonname;
  final IconData? icon;
  final IconData? licon;
  final IconData? ricon;
  final VoidCallback? onTap;

  const RecomandedShopCo({
    super.key,
    required this.image1,
    required this.name,
    required this.location,
    required this.reating,
    required this.buttonname,
    this.icon,
    this.licon,
    this.ricon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(image1),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  bottom: -5,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff363062),
                      elevation: 0,
                      padding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {},
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          buttonname,
                          style: TextStyle(
                            color: Color(0xffFFFFFF),
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(width: 6),
                        Icon(icon, color: Color(0xffFFFFFF), size: 16),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            if (licon != null)
              Padding(
                padding: EdgeInsets.only(top: 6),
                child: Row(
                  children: [
                    Icon(licon, color: Color(0xff8683A1), size: 16),
                    SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        location,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Color(0xff8683A1),
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            if (ricon != null)
              Padding(
                padding: EdgeInsets.only(top: 6),
                child: Row(
                  children: [
                    Icon(ricon, color: Color(0xff8683A1), size: 16),
                    SizedBox(width: 6),
                    Text(
                      reating,
                      style: TextStyle(color: Color(0xff8683A1), fontSize: 13),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

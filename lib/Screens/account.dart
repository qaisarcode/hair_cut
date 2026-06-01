import 'package:flutter/material.dart';
import 'package:hair_cut/Utils/elevated_bu.dart';
import 'package:hair_cut/Utils/passtxt_field.dart';
import 'package:hair_cut/Utils/txt_field.dart';
import 'package:hair_cut/res/app_color.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(title: Text("Account")),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage("assets/images/prfile.png"),
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 3, vertical: 5),
                  width: 70,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.timer, size: 10),
                      Text("Platinum", style: TextStyle(fontSize: 10)),
                    ],
                  ),
                ),
                Text(
                  "Joe Samanta",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColor.blue,
                  ),
                ),
                Align(alignment: Alignment.bottomLeft, child: Text("Email")),
                SizedBox(height: 10),
                TxtField(
                  hintText: "Joesamanta@gmail.com",
                  icon: Icons.email,
                  onchangeed: (p0) {},
                ),
                SizedBox(height: 10),
                Align(alignment: Alignment.bottomLeft, child: Text("Password")),
                SizedBox(height: 10),
                PasstxtField(
                  prefixIcon: Icons.key,
                  hintText: "********",
                  suffixIcon: Icons.remove_red_eye,
                ),
                Spacer(),
                ElevatedBu(onPressed: () {}, name: "Save"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hair_cut/Screens/home_screen.dart';
import 'package:hair_cut/Utils/elevated_bu.dart';
import 'package:hair_cut/botom_br.dart';

class AthanicationCode extends StatefulWidget {
  const AthanicationCode({super.key});

  @override
  State<AthanicationCode> createState() => _AthanicationCodeState();
}

class _AthanicationCodeState extends State<AthanicationCode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 125, left: 18, right: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Authentication",
                style: TextStyle(
                  color: Color(0xff363062),
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Please enter the authentication code that\n we have sent to your email",
                style: TextStyle(color: Color(0xff6B7280)),
              ),

              Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedBu(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => BotomBr()),
                    );
                  },
                  name: "send",
                ),
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.center,
                child: Text('Have not receive code?'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_app/screens/home.dart';
import 'package:furniture_app/main.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      alignment: Alignment.centerRight,
      children: [
        Image.asset(
          "assets/images/background.png",
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        const Positioned(
          bottom: 80,
          left: 25,
          child: SizedBox(
            width: 250,
            child: Text(
              "Find the best home furniture for your room.",
              style: TextStyle(
                  fontFamily: "Hauora",
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  fontSize: 28),
            ),
          ),
        ),
        Positioned(
          right: 25,
          bottom: 55,
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
              );
            },
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  color: accentColor, borderRadius: BorderRadius.circular(7)),
              child: Center(
                child: SizedBox(
                  width: 20,
                  height: 20,
                  child: SvgPicture.asset(
                    "assets/icons/arrow_forward.svg",
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    ));
  }
}

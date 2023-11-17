import 'package:flutter/material.dart';
import 'package:flutter_ui/yoga/onboarding/OnBoarding.dart';
import 'package:flutter_ui/yoga/widgets/PrimaryAppButton.dart';

class EntrySceen extends StatelessWidget {
  const EntrySceen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0),
      body: Stack(
        fit: StackFit.expand,
        alignment: Alignment.bottomCenter,
        children: [
          Image.asset("assert/images/four.jpg", fit: BoxFit.fill),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  "Get filter, stronger and embarace a leatchhier lifestyle",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 10),
                PrimaryAppButton(
                  text: "Sign in",
                  onClick: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OnBoardingScreen())),
                ),
                const SizedBox(height: 20)
              ],
            ),
          ),
        ],
      ),
    );
  }
}

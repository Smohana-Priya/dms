import 'dart:async';
import 'package:flutter/material.dart';
import '../../router.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  SplashState createState() => SplashState();
}

class SplashState extends State<Splash> {

  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
            () async =>  await Navigator.pushNamedAndRemoveUntil(context,
        AppRoutes.loginScreen, (Route<dynamic> route) => false)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.65,
                    height: MediaQuery.of(context).size.width * 0.25,
                    child: Image.asset("assets/png/logoicons1.png")),
              ),
              const Center(
                child: Text("Your unified global Identity wallet!",style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 16
                ),),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

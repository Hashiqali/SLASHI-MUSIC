import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:slashi_music/Screens/mainscreen/mainscreen.dart';
import 'package:slashi_music/Screens/splash&welcome/welcome1.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    splashtime(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.black,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                        width: 40,
                        image: AssetImage('assets/images/play (2).png')),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'SLASHI',
                      style: TextStyle(
                          fontFamily: 'SLASHI',
                          color: Colors.white,
                          fontSize: 40),
                    )
                  ],
                ),
              ],
            ),
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SpinKitSpinningLines(
                color: Colors.orange,
                size: 45.0,
              ),
              SizedBox(
                height: 100,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Future<void> splashtime(context) async {
  final shared = await SharedPreferences.getInstance();
  final key1 = shared.getBool(key);
  if (key1 == null || key1 == false) {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => const Welcome1(),
      ),
    );
  } else {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (ctx) => const Maniscreen(),
      ),
      (route) => false,
    );
  }
}

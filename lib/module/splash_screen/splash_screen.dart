import 'package:flutter/material.dart';
import 'package:image_gallery/module/home_screen/home_screen.dart';
import 'package:image_gallery/utils/const.dart';
import 'package:image_gallery/utils/orientation_check.dart';

import '../../main.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 1000), () {
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context) => HomeScreen()), (Route<dynamic> route) => false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          isPortrait.value = orientation == Orientation.portrait;
          return ValueListenableBuilder(
            valueListenable: isPortrait,
            builder: (context, value, child) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      Assets.splashImage,
                      width: (DeviceType().getDeviceType() == "phone") ? 200 : 500,
                      height: (DeviceType().getDeviceType() == "phone") ? 200 : 500,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    const CircularProgressIndicator(
                      color: Palette.primaryColor,
                      strokeWidth: 1,
                    )
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}

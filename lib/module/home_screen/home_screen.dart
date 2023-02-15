import 'package:flutter/material.dart';
import 'package:image_gallery/utils/const.dart';
import 'package:image_gallery/utils/orientation_check.dart';

import '../../main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selected = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Image Gallery', style: TextStyle(color: Colors.white)), backgroundColor: Palette.primaryColor),
      body: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          isPortrait.value = orientation == Orientation.portrait;
          return ValueListenableBuilder(
            valueListenable: isPortrait,
            builder: (context, value, child) {
              return Center(
                  child: GridView.count(
                crossAxisCount: (DeviceType().getDeviceType() == "phone")
                    ? orientation == Orientation.portrait
                        ? 2
                        : 3
                    : orientation == Orientation.portrait
                        ? 2
                        : 4,
                children: List.generate(10, (index) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Stack(
                      children: [
                        GestureDetector(
                          onLongPress: () {
                            selected = index;
                            setState(() {});
                          },
                          onLongPressEnd: (dsd) {
                            selected = -1;
                            setState(() {});
                          },
                          child: ClipRRect(
                            borderRadius: const BorderRadius.all(Radius.circular(15)),
                            child: Image.network(
                              fit: BoxFit.contain,
                              'https://picsum.photos/500/500?random=$index',
                            ),
                          ),
                        ),
                        GestureDetector(
                          child: Visibility(
                            visible: selected == index,
                            child: ClipRRect(
                              borderRadius: const BorderRadius.all(Radius.circular(15)),
                              child: Container(
                                alignment: Alignment.center,
                                color: Colors.grey.withOpacity(0.8),
                                child: Text(
                                  'https://picsum.photos/500/500?random=$index',
                                  style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ));
            },
          );
        },
      ),
    );
  }
}

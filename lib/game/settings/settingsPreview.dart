import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/game/dataParams/constants.dart';

class SettingsPreview extends StatefulWidget {
  @override
  State<SettingsPreview> createState() => _SettingsPreviewState();
}

class _SettingsPreviewState extends State<SettingsPreview> {
  bool switchValueSound = true;
  bool switchValueVibro = false;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    return Scaffold(
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.landscape) {
            return Stack(
              children: [
                Container(
                  height: ParamsAxis(context).height,
                  width: ParamsAxis(context).width,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/images/bg/bgMainScreenChooseGame.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            width: 40,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              height: 40,
                              width: 40,
                              child: Image.asset(
                                  'assets/images/icons/arrowBack.png'),
                            ),
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              height: 30,
                              width: 150,
                              child: Image.asset(
                                  'assets/images/texts/settings.png'),
                            ),
                          ),
                          const SizedBox(
                            width: 40,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Spacer(),
                          Container(
                            height: 40,
                            width: 100,
                            child: Image.asset('assets/images/texts/sound.png'),
                          ),
                          const SizedBox(
                            width: 200,
                          ),
                          CupertinoSwitch(
                            value: switchValueSound,
                            onChanged: (value) {
                              setState(() {
                                switchValueSound = value;
                              });
                            },
                          ),
                          const Spacer(),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Spacer(),
                          Container(
                            height: 40,
                            width: 100,
                            child: Image.asset('assets/images/texts/vibro.png'),
                          ),
                          const SizedBox(
                            width: 200,
                          ),
                          CupertinoSwitch(
                            value: switchValueVibro,
                            onChanged: (value) {
                              setState(() {
                                switchValueVibro = value;
                              });
                            },
                          ),
                          const Spacer(),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: 50,
                        width: ParamsAxis(context).width * .38,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color.fromARGB(217, 29, 11, 35),
                              Color.fromARGB(202, 135, 33, 142)
                            ],
                          ),
                        ),
                        child: Center(
                          child:
                              Image.asset('assets/images/texts/termsOfUse.png'),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 50,
                        width: ParamsAxis(context).width * .38,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color.fromARGB(217, 29, 11, 35),
                              Color.fromARGB(202, 135, 33, 142)
                            ],
                          ),
                        ),
                        child: Center(
                          child:
                              Image.asset('assets/images/texts/privacyPolicy.png'),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      )
                    ],
                  ),
                ),
              ],
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

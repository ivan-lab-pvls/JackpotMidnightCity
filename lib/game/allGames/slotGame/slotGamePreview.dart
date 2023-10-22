import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/game/dataParams/constants.dart';
import 'package:flutter_slot_machine/slot_machine.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SlotGame extends StatefulWidget {
  @override
  State<SlotGame> createState() => _RewardCoinsState();
}

class _RewardCoinsState extends State<SlotGame> {
  int coins = 0;
  late SlotMachineController _controller;
  @override
  void initState() {
    super.initState();
    _loadCoins();
  }

  void onButtonTap({required int index}) {
    _controller.stop(reelIndex: index);
  }

  void onStart() {
    final index = Random().nextInt(20);
    _controller.start(hitRollItemIndex: index < 5 ? index : null);
  }

  Future<void> _loadCoins() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      coins = prefs.getInt('coins') ?? 0;
    });
    print(coins);
  }

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
            return Container(
              height: ParamsAxis(context).height,
              width: ParamsAxis(context).width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/bg/bgSlotsPreview.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            width: 80,
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
                          const SizedBox(
                            width: 20,
                          ),
                          Container(
                            height: ParamsAxis(context).height * .7,
                            width: ParamsAxis(context).width * .6,
                            child: SlotMachine(
                              rollItems: [
                                RollItem(
                                    index: 0,
                                    child: Container(
                                      height: 30,
                                      width: 30,
                                      child: Image.asset(
                                          "assets/images/slots/1.png"),
                                    )),
                                RollItem(index: 1, child: Text("Y")),
                                RollItem(index: 2, child: Text("Z")),
                              ],
                              onCreated: (controller) {
                                _controller = controller;
                              },
                              onFinished: (resultIndexes) {
                                print('Result: $resultIndexes');
                              },
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Container(
                              height: ParamsAxis(context).height * .7,
                              width: 160,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                      'assets/images/texts/balance.png'),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    coins.toString(),
                                    style: GoogleFonts.bebasNeue(
                                      color: const Color.fromARGB(
                                          255, 134, 57, 147),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 35,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    height: ParamsAxis(context).height * .42,
                                    width: 85,
                                    child: Center(
                                      child: Stack(
                                        children: [
                                          Container(
                                            height: ParamsAxis(context).height *
                                                .35,
                                            width: 85,
                                            child: Image.asset(
                                                'assets/images/icons/bg.png'),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 5.0),
                                            child: Align(
                                              alignment: Alignment.topCenter,
                                              child: InkWell(
                                                onTap: () {
                                                  //plus bet
                                                },
                                                child: Container(
                                                  height: ParamsAxis(context)
                                                          .height *
                                                      .15,
                                                  width: 85,
                                                  child: Image.asset(
                                                      'assets/images/icons/plus.png'),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 30.0),
                                            child: Align(
                                              alignment: Alignment.bottomCenter,
                                              child: InkWell(
                                                onTap: () {
                                                  //minus bet
                                                },
                                                child: Container(
                                                  height: ParamsAxis(context)
                                                          .height *
                                                      .15,
                                                  width: 85,
                                                  child: Image.asset(
                                                      'assets/images/icons/minus.png'),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30, right: 60),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: InkWell(
                        onTap: () {
                          //spin
                        },
                        child: Container(
                          height: 67,
                          width: 99,
                          child: Image.asset('assets/images/icons/spin.png'),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 35.0, right: 100.0),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/texts/win.png'),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            '0',
                            style: GoogleFonts.bebasNeue(
                              color: const Color.fromARGB(255, 134, 57, 147),
                              fontWeight: FontWeight.bold,
                              fontSize: 35,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

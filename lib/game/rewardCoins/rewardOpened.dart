import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/game/dataParams/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class RewardOpened extends StatefulWidget {
  final int coins;
  const RewardOpened({super.key, required this.coins});
  @override
  State<RewardOpened> createState() => _RewardOpenedState();
}

class _RewardOpenedState extends State<RewardOpened> {
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
                  image:
                      AssetImage('assets/images/bg/bgMainScreenChooseGame.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
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
                          child:
                              Image.asset('assets/images/icons/arrowBack.png'),
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            width: 100,
                          ),
                          Container(
                            height: ParamsAxis(context).height * .7,
                            width: ParamsAxis(context).width * .5,
                            child: Image.asset(
                              'assets/images/icons/chestOpened.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            width: 50,
                          ),
                          Text(
                            'WE GIVE YOU ${widget.coins}\nCOINS FOR DAILY\nLOGIN TO THE APPLICATION. WE ARE\nWAITING FOR YOU IN\n24 HOURS!',
                            style: GoogleFonts.bebasNeue(
                              color: const Color.fromARGB(255, 196, 48, 222),
                              fontWeight: FontWeight.w400,
                              fontSize: 24,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 400.0, top: 200),
                        child: Align(
                          alignment: Alignment.center,
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              height: 65,
                              width: ParamsAxis(context).width * .15,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                gradient: const LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Color.fromARGB(236, 29, 11, 35),
                                    Color.fromARGB(232, 135, 33, 142)
                                  ],
                                ),
                              ),
                              child: Center(
                                child: Image.asset(
                                    'assets/images/texts/getReward.png'),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
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

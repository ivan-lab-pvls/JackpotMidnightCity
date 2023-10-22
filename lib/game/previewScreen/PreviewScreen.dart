import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/game/allGames/rouleteGame/rouletePreview.dart';
import 'package:flutter_application_1/game/allGames/slotGame/slotGamePreview.dart';
import 'package:flutter_application_1/game/articles/articlesPreviewScreen.dart';
import 'package:flutter_application_1/game/dataParams/constants.dart';
import 'package:flutter_application_1/game/music.dart';
import 'package:flutter_application_1/game/rewardCoins/rewardCoins.dart';
import 'package:flutter_application_1/game/settings/settingsPreview.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'chooseGame/chooseGame.dart';

class PreviewScreenGame extends StatefulWidget {
  @override
  State<PreviewScreenGame> createState() => _PreviewScreenGameState();
}

class _PreviewScreenGameState extends State<PreviewScreenGame> {
  final audioControl = AudioControl();

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      audioControl.stopAudio();
    } else if (state == AppLifecycleState.resumed) {
      audioControl.playAudio();
    } else if (state == AppLifecycleState.detached) {
      audioControl.stopAudio();
    }
  }

  @override
  void initState() {
    super.initState();
    _loadSharedPreferences();
  }

  Future<void> _loadSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
    bool soundValue = prefs.getBool('music') ?? false;
    bool vibroValue = prefs.getBool('vibro') ?? false;

    print('play = $soundValue');
    print('vibro = $vibroValue');

    if (soundValue == false) {
      audioControl.stopAudio();
    } else if (soundValue == true) {
      audioControl.playAudio();
    }
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
                  image:
                      AssetImage('assets/images/bg/bgMainScreenChooseGame.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 40,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => RewardCoins(),
                            ),
                          );
                        },
                        child: Container(
                          height: 80,
                          width: 80,
                          child: Image.asset(
                              'assets/images/icons/rewardDaily.png'),
                        ),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => SettingsPreview(),
                            ),
                          );
                        },
                        child: Container(
                          height: 80,
                          width: 80,
                          child:
                              Image.asset('assets/images/icons/settings.png'),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 50,
                      ),
                      gameItemchoose(context, () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => SlotGame(),
                          ),
                        );
                      }, 'assets/images/texts/slotMachine.png',
                          'assets/images/gamesChoose/slot.png'),
                      gameItemchoose(
                          context,
                          () {},
                          'assets/images/texts/pookies.png',
                          'assets/images/gamesChoose/pook.png'),
                      gameItemchoose(context, () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => RouleletePreviewScreen(),
                          ),
                        );
                      }, 'assets/images/texts/roulette.png',
                          'assets/images/gamesChoose/roulete.png'),
                      gameItemchoose(context, () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ArticlesPreviewScreen(),
                          ),
                        );
                      }, 'assets/images/texts/articles.png',
                          'assets/images/gamesChoose/article.png'),
                      const SizedBox(
                        width: 50,
                      ),
                    ],
                  )
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

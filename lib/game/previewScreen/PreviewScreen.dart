import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/game/allGames/pookies/pookies_game.dart';
import 'package:flutter_application_1/game/allGames/slotGame/slotGamePreview.dart';
import 'package:flutter_application_1/game/articles/articlesPreviewScreen.dart';
import 'package:flutter_application_1/game/dataParams/constants.dart';
import 'package:flutter_application_1/game/rewardCoins/rewardCoins.dart';
import 'package:flutter_application_1/game/settings/settingsPreview.dart';

import 'chooseGame/chooseGame.dart';

class PreviewScreenGame extends StatelessWidget {
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
              height: double.infinity,
              width: double.infinity,
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
                  Spacer(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Spacer(
                        flex: 10,
                      ),
                      gameItemchoose(context, () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => SlotGame(),
                          ),
                        );
                      }, 'assets/images/texts/slotMachine.png',
                          'assets/images/gamesChoose/slot.png'),
                      Spacer(),
                      gameItemchoose(context, () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => PookiesGame(),
                          ),
                        );
                      }, 'assets/images/texts/pookies.png',
                          'assets/images/gamesChoose/pook.png'),
                      Spacer(),
                      gameItemchoose(
                          context,
                          () {},
                          'assets/images/texts/roulette.png',
                          'assets/images/gamesChoose/roulete.png'),
                      Spacer(),
                      gameItemchoose(context, () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ArticlesPreviewScreen(),
                          ),
                        );
                      }, 'assets/images/texts/articles.png',
                          'assets/images/gamesChoose/article.png'),
                      Spacer(
                        flex: 10,
                      ),
                    ],
                  ),
                  Spacer(),
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

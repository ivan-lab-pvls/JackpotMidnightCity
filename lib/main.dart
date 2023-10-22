import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'game/dataParams/constants.dart';
import 'game/previewScreen/PreviewScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomeScreen(),
    );
  }
}

class MyHomeScreen extends StatefulWidget {
  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  Future<bool> checkCoinsData() async {
    await Future.delayed(Duration(milliseconds: 10));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    return Scaffold(
      body: Center(
        child: FutureBuilder<bool>(
          future: checkCoinsData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return OrientationBuilder(builder: (context, orientation) {
                if (orientation == Orientation.landscape) {
                  return Container(
                    height: ParamsAxis(context).height,
                    width: ParamsAxis(context).width,
                    child: Image.asset(
                      'assets/images/bg/bgPreviewHorizontal.png',
                      fit: BoxFit.fill,
                    ),
                  );
                } else {
                  return Container(
                    height: ParamsAxis(context).height,
                    width: ParamsAxis(context).width,
                    child: Image.asset(
                      'assets/images/bg/bgPreview.png',
                      fit: BoxFit.fill,
                    ),
                  );
                }
              });
            } else if (snapshot.data == true) {
              return PreviewScreenGame();
            } else {
              return Text('Данные не загружены');
            }
          },
        ),
      ),
    );
  }
}

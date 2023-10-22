import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/game/data/constants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'game/dataParams/constants.dart';
import 'game/previewScreen/PreviewScreen.dart';

late SharedPreferences prefs;
bool newCoinsAvailable = false;
String showBonus = '';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
  // OneSignal.initialize("77e32082-ea27-42e3-a898-c72e141824ef");
  // OneSignal.Notifications.requestPermission(true);
  nonData = delix(nonData, -2);
  // await fetchData();
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

Future<void> fetchData() async {
  var connectivityResult = await (Connectivity().checkConnectivity());

  if (connectivityResult == ConnectivityResult.none) {
    return;
  }

  String data = prefs.getString('keyCoins') ?? 'null';
  print('prefs = $data');
  if (data != 'null') {
    showBonus = data;
    newCoinsAvailable = true;
  }

  final response = await http.get(Uri.parse(getCoins));

  if (response.statusCode == 200) {
    await checkNewDailyCoins(getCoins);
  } else {}
}

Future<bool> checkNewDailyCoins(String getData) async {
  final client = HttpClient();
  var uri = Uri.parse(getData);
  var request = await client.getUrl(uri);
  request.followRedirects = false;
  var response = await request.close();
  print(response.headers.value(HttpHeaders.locationHeader));

  if (response.headers
      .value(HttpHeaders.locationHeader)
      .toString()
      .contains(nonData)) {
    //show game
    newCoinsAvailable = false;
    return true;
  } else {
    //show webview

    var dataCoins =
        response.headers.value(HttpHeaders.locationHeader).toString();
    String data = prefs.getString('keyCoins') ?? 'null';
    if (data == 'null') {
      prefs.setString('keyCoins', dataCoins);
    }
    newCoinsAvailable = true;
    return true;
  }
}

Future<bool> checkCoinsData() async {
  return true;
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

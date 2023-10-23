import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ShowDailyRewards extends StatelessWidget {
  final String rewardCoinsAmount;

  ShowDailyRewards({super.key, required this.rewardCoinsAmount});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 2, 6, 133),
      body: SafeArea(
        bottom: false,
        child: Container(
          color: Colors.red,
        ),
        // InAppWebView(
        //   initialUrlRequest: URLRequest(
        //     url: Uri.parse(findPrivacyPolicy),
        //   ),
      ),
    );
  }
}

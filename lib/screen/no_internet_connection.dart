import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_project/screen/home_view.dart';

class NoConnection extends StatefulWidget {
  const NoConnection({super.key});

  @override
  State<NoConnection> createState() => _NoConnectionState();
}

class _NoConnectionState extends State<NoConnection> {
  final noInternetLottie = Lottie.asset("assets/lottie/noInternet.json");
  final noInternetMessage = "No Internet Connection";
  @override
  void initState() {
    super.initState();
    _checkInternetConnection();
  }

  Future<void> _checkInternetConnection() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    while (true) {
      if (connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi) {
        await Future.delayed(Duration(seconds: 2));
        Get.off(HomeView());
      } else {
        await Future.delayed(Duration(seconds: 2));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            noInternetMessage,
            style: Theme.of(context).textTheme.headline4,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.5,
            child: noInternetLottie,
          ),
        ],
      ),
    );
  }
}

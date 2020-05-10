import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';

final spinkit = SpinKitThreeBounce(
  color: Colors.white,
  size: 40,
);

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: spinkit,
      ),
    );
  }
}
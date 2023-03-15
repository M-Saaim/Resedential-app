import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:resedentialapp/shared/constants.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const SpinKitThreeBounce(
        color: kAmaranth,
        size: 30.0,
      ),
    );
  }
}

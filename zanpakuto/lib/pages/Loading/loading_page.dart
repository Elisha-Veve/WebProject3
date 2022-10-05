import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SpinKitHourGlass(
      color: Theme.of(context).colorScheme.primary,
      size: 50.0,
    ));
  }
}

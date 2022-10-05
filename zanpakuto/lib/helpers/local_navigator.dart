import 'package:flutter/material.dart';
import 'package:zanpakuto/constants/controllers.dart';
import 'package:zanpakuto/routes/router.dart';
import 'package:zanpakuto/routes/routes.dart';

Navigator localNavigator() => Navigator(
      key: navigationController.navigatorKey,
      initialRoute: DashboardPageRoute,
      onGenerateRoute: generateRoute,
    );

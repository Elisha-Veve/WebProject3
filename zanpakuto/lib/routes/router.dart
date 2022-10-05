import 'package:flutter/material.dart';
import 'package:zanpakuto/pages/conversations/conversations.dart';
import 'package:zanpakuto/pages/dashboard/dasboard.dart';
import 'package:zanpakuto/pages/events/events.dart';
import 'package:zanpakuto/pages/settings/setting.dart';
import 'package:zanpakuto/pages/submissions/submissions.dart';
import 'package:zanpakuto/routes/routes.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case DashboardPageRoute:
      return MaterialPageRoute(builder: (_) => DashboardPage());
    case ConversationsPageRoute:
      return MaterialPageRoute(builder: (_) => ConversationsPage());
    case CalenderPageRoute:
      return MaterialPageRoute(builder: (_) => EventsPage());
    case SubmissionsPageRoute:
      return MaterialPageRoute(builder: (_) => SubmissionsPage());
    case SettingsPageRoute:
      return MaterialPageRoute(builder: (_) => SettingsPage());
    default:
      return MaterialPageRoute(builder: (_) => DashboardPage());
  }
}

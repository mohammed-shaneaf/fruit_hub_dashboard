import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/app/app_name.dart';
import 'package:fruit_hub_dashboard/features/dashboard/views/add_data_view.dart';
import 'package:fruit_hub_dashboard/features/dashboard/views/dashboard_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppName.dashboardView:
      return MaterialPageRoute(builder: (context) => DashboardView());

    case AppName.addDataView:
      return MaterialPageRoute(builder: (context) => const AddDataView());
    default:
      return MaterialPageRoute(
        builder: (context) => Scaffold(
          body: Center(child: Text('No route defined for ${settings.name}')),
        ),
      );
  }
}

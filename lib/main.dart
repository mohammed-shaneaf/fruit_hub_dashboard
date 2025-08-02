import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/app/app_manager.dart';
import 'package:fruit_hub_dashboard/app/app_name.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
      initialRoute: AppName.dashboardView,
    );
  }
}

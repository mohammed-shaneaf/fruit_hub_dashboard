import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/app/app_name.dart';
import 'package:fruit_hub_dashboard/features/add_product/presentation/views/add_product_view.dart';
import 'package:fruit_hub_dashboard/features/dashboard/views/dashboard_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppName.dashboardView:
      return MaterialPageRoute(builder: (context) => DashboardView());

    // case AppName.addDataView:
    //   return MaterialPageRoute(builder: (context) => const AddDataView());

    case AppName.addproductView:
      return MaterialPageRoute(builder: (context) => const AddProductView());
    default:
      return MaterialPageRoute(
        builder: (context) => Scaffold(
          body: Center(child: Text('No route defined for ${settings.name}')),
        ),
      );
  }
}

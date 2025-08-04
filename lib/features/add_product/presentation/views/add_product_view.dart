import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/common/widgets/build_app_bar.dart';
import 'package:fruit_hub_dashboard/features/add_product/presentation/views/widgets/add_product_view_body.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(text: 'Add Product'),
      body: SafeArea(child: AddProductViewBody()),
    );
  }
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub_dashboard/common/widgets/custom_button.dart';
import 'package:fruit_hub_dashboard/common/widgets/custom_text_form_field.dart';
import 'package:fruit_hub_dashboard/common/widgets/is_featured_check_box.dart';
import 'package:fruit_hub_dashboard/features/add_product/domain/entities/add_product_input_entity.dart';
import 'package:fruit_hub_dashboard/features/add_product/presentation/views/widgets/image_field.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String? name, code, description;
  num? price;
  File? image;
  bool isFeatured = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              22.verticalSpace,
              CustomTextFormField(
                onSaved: (value) => name = value,
                textInputType: TextInputType.text,
                hintText: 'Enter Product Name',
              ),
              16.verticalSpace,
              CustomTextFormField(
                onSaved: (value) => price = num.tryParse(value ?? ''),
                textInputType: TextInputType.number,
                hintText: 'Enter Product Price',
              ),
              16.verticalSpace,
              CustomTextFormField(
                onSaved: (value) => code = value,
                textInputType: TextInputType.text,
                hintText: 'Enter Product Code',
              ),
              16.verticalSpace,
              CustomTextFormField(
                onSaved: (value) => description = value,
                textInputType: TextInputType.multiline,
                hintText: 'Enter Product Description',
                maxLines: 5,
              ),
              16.verticalSpace,
              ImageField(
                onImageSelected: (file) {
                  setState(() {
                    image = file;
                  });
                },
              ),
              16.verticalSpace,
              IsFeaturedCheckbox(
                onChanged: (value) {
                  setState(() {
                    isFeatured = value;
                  });
                },
              ),
              24.verticalSpace,
              CustomButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    if (image == null) {
                      showError(context);
                      return;
                    }
                    formKey.currentState!.save();
                    autovalidateMode = AutovalidateMode.disabled;
                    AddProductInputEntity addProductInputEntity =
                        AddProductInputEntity(
                          name: name!,
                          price: price,
                          code: code!,
                          description: description!,
                          imageFile: image,
                          isFeatured: isFeatured,
                          imageUrl: '',
                        );
                    // Now all fields are collected and you can use them
                    debugPrint('Name: $name');
                    debugPrint('Price: $price');
                    debugPrint('Code: $code');
                    debugPrint('Description: $description');
                    debugPrint('Image path: ${image!.path}');
                    debugPrint('Is Featured: $isFeatured');
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
                text: 'Add Product',
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showError(BuildContext context) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Please select an image')));
  }
}

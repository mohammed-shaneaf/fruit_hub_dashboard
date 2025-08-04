import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub_dashboard/common/widgets/custom_text_form_field.dart';
import 'package:fruit_hub_dashboard/common/widgets/is_featured_check_box.dart';
import 'package:fruit_hub_dashboard/features/add_product/presentation/views/widgets/image_field.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

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
                textInputType: TextInputType.text,
                hintText: 'Enter Product Name',
              ),
              16.verticalSpace,
              CustomTextFormField(
                textInputType: TextInputType.number,
                hintText: 'Enter Product Price',
              ),
              16.verticalSpace,
              CustomTextFormField(
                textInputType: TextInputType.text,
                hintText: 'Enter Product Code',
              ),
              16.verticalSpace,
              CustomTextFormField(
                textInputType: TextInputType.multiline,
                hintText: 'Enter Product Description',
                maxLines: 5,
              ),
              16.verticalSpace,
              ImageField(onImageSelected: (file) {}),
              16.verticalSpace,
              IsFeaturedCheckbox(onChanged: (value) {}),
            ],
          ),
        ),
      ),
    );
  }
}

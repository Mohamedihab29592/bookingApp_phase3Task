import 'package:flutter/material.dart';

import '../../../../../core/component/custom_text.dart';
import '../../../../../core/utilis/constants/colors.dart';


class BuildSettingItem extends StatelessWidget {
  final Widget widget;
  final String label;
  const BuildSettingItem({Key? key, required this.widget, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children:  [
            CustomText(text: label,fontSize: 18,color: AppColors.white,),
            const Spacer(),
            widget,
          ],
        ),
        const SizedBox(height: 15,),
        const Divider(height: 1,color: AppColors.grey,),
        const SizedBox(height: 15,),
      ],
    );
  }
}

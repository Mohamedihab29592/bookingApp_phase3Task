import 'package:flutter/material.dart';

import '../../../../core/utilis/constants/colors.dart';
import '../../../../core/utilis/constants/values_manger.dart';
import '../../../auth/widgets/my_text.dart';

class CardOfHotel extends StatelessWidget {
  const CardOfHotel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.s130,
      width: double.infinity,
      child: Card(
        color: AppColors.darkGrey,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              "assets/images/Egypt.jpg",
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width / 3,
              height: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 15, left: 7, right: 3, bottom: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(
                    text: "Royal Grand Hotel",
                    fontSize: 15,
                    fontWeight: FontWeight.w900,
                  ),

                  MyText(
                    text: "Wembly , London",
                    fontSize: 14,
                    fontWeight: FontWeight.w900,
                    colors: AppColors.grey,
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: AppColors.teal,
                        size: 11,
                      ),

                      MyText(
                          text: "2.0 Km to City",
                          fontSize: 14,
                          colors: AppColors.grey),
                      SizedBox(
                        width: 36,
                      ),
                      MyText(
                        text: "\$180",
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),

                  Row(
                    children:  [
                      MyText(
                          text: "Rate : 8/10",
                          fontSize: 14,
                          colors: AppColors.teal),
                      SizedBox(
                        width: 50,
                      ),
                      MyText(
                          text: "/per night",
                          fontSize: 16,
                          colors: Colors.grey.shade800,),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

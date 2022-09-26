import 'package:flutter/material.dart';

import 'build_upcoming_item.dart';

class UpcomingWidget extends StatelessWidget {
  const UpcomingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(),
        itemBuilder:  (context, index) =>
            BuildUpcomingItem(
              urlImage:
              'https://images.ctfassets.net/hrltx12pl8hq/a2hkMAaruSQ8haQZ4rBL9/8ff4a6f289b9ca3f4e6474f29793a74a/nature-image-for-website.jpg?fit=fill&w=1024&h=683&fm=webp',
              startDate: '25 Sep',
              endDate: '29 Sep',
              roomsNumber: index+1,
              peopleNumber: (index+1)*2,
              isFavorite: index%2==0?false:true,
              hotelName: 'Grand Royal Hotel',
              city: 'Cairo',
              day: 'Sunday',
              location: '$index.0km to hotelhotelhotelhotelhotel',
              price: 180,
              initialRating: index+.5,
            ),
        itemCount: 7,
      ),
    );
  }
}
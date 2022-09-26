import 'package:flutter/material.dart';

import 'build_finished_item.dart';

class FinishedWidget extends StatelessWidget {
  const FinishedWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) => const BuildFinishedItem(
          urlImage:
              'https://images.ctfassets.net/hrltx12pl8hq/a2hkMAaruSQ8haQZ4rBL9/8ff4a6f289b9ca3f4e6474f29793a74a/nature-image-for-website.jpg?fit=fill&w=1024&h=683&fm=webp',
          startDate: '25 Sep',
          endDate: '29 Sep',
          roomsNumber: 2,
          peopleNumber: 1,
          hotelName: 'Grand Royal Hotel',
          city: 'Minya',
          day: 'Sunday',
          location: ' 2.0km to city',
          price: 180,
          initialRating: 1,
        ),
        itemCount: 6,
        physics: const BouncingScrollPhysics(),
      ),
    );
  }
}

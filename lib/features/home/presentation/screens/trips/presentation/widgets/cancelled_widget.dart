import 'package:flutter/material.dart';

import 'build_favorites_item.dart';


class FavoritesWidget extends StatelessWidget {
  const FavoritesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) => const BuildFavoritesItem(
          urlImage:
              'https://images.ctfassets.net/hrltx12pl8hq/a2hkMAaruSQ8haQZ4rBL9/8ff4a6f289b9ca3f4e6474f29793a74a/nature-image-for-website.jpg?fit=fill&w=1024&h=683&fm=webp',
          hotelName: 'Grand Royal Hotel',
          city: 'Cairo',
          day: 'Sunday',
          location: ' 2.0km to city',
          price: 180,
          initialRating: 1,
        ),
        itemCount: 8,
        physics: const BouncingScrollPhysics(),
      ),
    );

  }

}

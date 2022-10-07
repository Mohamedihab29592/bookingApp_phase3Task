import 'package:booking_app/features/search/data/models/search_model.dart';
import 'package:booking_app/features/search/presentation/widgets/hotelsOnGoogleCard.dart';
import 'package:flutter/material.dart';

import '../../../../core/services/MapsWithList.dart';



class HotelsOnMapPage extends StatefulWidget {
  const HotelsOnMapPage({Key? key, required this.hotelsMap}) : super(key: key);
  final List<DataHotelModel> hotelsMap;
  @override
  State<HotelsOnMapPage> createState() => _HotelsOnMapPageState();
}

class _HotelsOnMapPageState extends State<HotelsOnMapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Maps'),),
      body: Stack(
        children: [
          HotelsOnGoogleMapWidget(hotels: widget.hotelsMap),
          Positioned(
            left: 10,
            right: 10,
            bottom: 10,
            child: SizedBox(
                height: 145,
                width: MediaQuery.of(context).size.width * 0.9,
                child: HotelsOnGoogleMapCardWidget(
                    searchHotels: widget.hotelsMap)),
          ),
        ],
      ),
    );
  }
}
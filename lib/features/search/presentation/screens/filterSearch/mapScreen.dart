import 'package:booking_app/core/services/maps.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class MapScreen extends StatefulWidget {
  final String lat;
  final String long;
  const MapScreen({Key? key, required this.lat, required this.long}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Maps"),
        centerTitle: true,
        elevation: 10,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.close),
        ),
      ),
      body: Column(
        children: [
          Expanded(

              child: Maps(lat: widget.lat, long: widget.long)),

        ],
      ),
    );
  }
}

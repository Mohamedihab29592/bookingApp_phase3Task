import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../../core/app_localization/cubit/locale_cubit.dart';


class MapsList extends StatefulWidget {
  const MapsList({Key? key,  required this.hotels, })
      : super(key: key);

  final List<dynamic> hotels;

  @override
  MapsListState createState() =>
      MapsListState();
}

class MapsListState extends State<MapsList> {
  GoogleMapController? mapController; //contrller for Google map
  final Set<Marker> markers = {}; //markers for google map
//location to show in map

  getLocations() async {
    getMarkers();
  }

  @override
  void initState() {
    getLocations();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      //Map widget from google_maps_flutter package
      zoomGesturesEnabled: true, //enable Zoom in, out on map
      initialCameraPosition: CameraPosition(
        target: LatLng(double.parse(widget.hotels[0].latitude),double.parse(widget.hotels[0].longitude)),
        zoom: 10,
      ),
      markers: getMarkers(), //markers to show on map
      mapType:LocaleCubit.get(context).isDarkMode? MapType.satellite: MapType.normal,
    //map type
      onMapCreated: (controller) {
        //method called when map is created
        setState(() {
          mapController = controller;
        });
      },
      myLocationEnabled: true,
      myLocationButtonEnabled: true,
      // on below line we have enabled compass
      compassEnabled: false,
    );
  }

  Set<Marker> getMarkers() {
    //final Uint8List markerIcon = await getBytesFromCanvas(200, 100);//markers to place on map
    for (var hotel in widget.hotels)
    {
      markers.add(Marker(
        //add second marker

        markerId: const MarkerId("1"),
        position: LatLng(double.parse(hotel.latitude),double.parse(hotel.longitude)
        ), //position of marker
        infoWindow: InfoWindow(
          //popup info
          title: '${hotel.name} ',
          snippet: '${hotel.price}\$',
        ),
        icon: BitmapDescriptor
            .defaultMarker, //fromBytes(markerIcon), //Icon for Marker
      ));
    }



    return markers;
  }
  Set<Marker> getMarkersLat() {
    //final Uint8List markerIcon = await getBytesFromCanvas(200, 100);//markers to place on map
    markers.add(Marker(
      //add second marker

      markerId: const MarkerId("1"),
      position: LatLng(double.parse(widget.hotels[0].latitude),double.parse(widget.hotels[0].longitude)
      ), //position of marker
      infoWindow: InfoWindow(
        //popup info
        title: '${widget.hotels[0].name} ',
        snippet: '${widget.hotels[0].price}\$',
      ),
      icon: BitmapDescriptor
          .defaultMarker, //fromBytes(markerIcon), //Icon for Marker
    ));
    return markers;
  }

  Future<BitmapDescriptor> createCustomMarkerBitmap(String title) async {
    TextSpan span = TextSpan(
      style: const TextStyle(
        color: Colors.black,
        fontSize: 35.0,
        fontWeight: FontWeight.bold,
      ),
      text: title,
    );

    TextPainter tp = TextPainter(
      text: span,
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    tp.text = TextSpan(
      text: title,
      style: TextStyle(
        fontSize: 35.0,
        color: Theme.of(context).colorScheme.secondary,
        letterSpacing: 1.0,
      ),
    );

    PictureRecorder recorder = PictureRecorder();
    Canvas c = Canvas(recorder);

    tp.layout();
    tp.paint(c, const Offset(20.0, 10.0));

    /* Do your painting of the custom icon here, including drawing text, shapes, etc. */

    Picture p = recorder.endRecording();
    ByteData? pngBytes =
    await (await p.toImage(tp.width.toInt() + 40, tp.height.toInt() + 20))
        .toByteData(format: ImageByteFormat.png);

    Uint8List data = Uint8List.view(pngBytes!.buffer);

    return BitmapDescriptor.fromBytes(data);
  }

  Future<Uint8List> getBytesFromCanvas(int width, int height) async {
    final PictureRecorder pictureRecorder = PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);
    final Paint paint = Paint()..color = Colors.blue;
    const Radius radius = Radius.circular(30.0);
    canvas.drawRRect(
        RRect.fromRectAndCorners(
          Rect.fromLTWH(0.0, 0.0, width.toDouble(), height.toDouble()),
          topLeft: radius,
          topRight: radius,
          bottomLeft: radius,
          bottomRight: radius,
        ),
        paint);
    TextPainter painter = TextPainter(textDirection: TextDirection.ltr);
    painter.text = const TextSpan(
      text: '200',
      style: TextStyle(fontSize: 25.0, color: Colors.white),
    );
    painter.layout();
    painter.paint(
        canvas,
        Offset((width * 0.5) - painter.width * 0.5,
            (height * 0.5) - painter.height * 0.5));
    final img = await pictureRecorder.endRecording().toImage(width, height);
    final data = await img.toByteData(format: ImageByteFormat.png);
    return data!.buffer.asUint8List();
  }
}
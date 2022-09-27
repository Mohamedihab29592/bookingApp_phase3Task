import 'dart:async';
import 'package:permission_handler/permission_handler.dart';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Maps extends StatefulWidget {


  const Maps({Key? key}) : super(key: key);

  @override
  _MapsState createState() => _MapsState();
}

class _MapsState extends State<Maps> {

// created controller for displaying Google Maps
  final Completer<GoogleMapController> _controller = Completer();

// given camera position
  static const CameraPosition _kGoogle = CameraPosition(
    target: LatLng(19.0759837, 72.8776559),
    zoom: 15,
  );

  Uint8List? marketimages;
  List<String> images = ['images/car.png','images/bus.png', 'images/travelling.png', 'images/bycicle.png', 'images/food-delivery.png'];

// created empty list of markers
  final List<Marker> _markers = <Marker>[];

// created list of coordinates of various locations
  final List<LatLng> _latLen = <LatLng>[

    LatLng(19.0759837, 72.8776559),
    LatLng(28.679079, 77.069710),
    LatLng(26.850000, 80.949997),
    LatLng(24.879999, 74.629997),
    LatLng(16.166700, 74.833298),
    LatLng(12.971599, 77.594563),
  ];

// declared method to get Images
  Future<Uint8List> getImages(String path, int width) async{
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetHeight: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return(await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();

  }

  void _checkPermission() async{
  if (await Permission.location.serviceStatus.isEnabled )
  {
  // permission is enabled
  }
  else
  {
    var status = await Permission.location.status;
    if(status.isGranted)
      {

      }
    else if (status.isDenied)
      {
        Map<Permission,PermissionStatus> status = await [Permission.location,].request();

      }
    if (await Permission.location.isPermanentlyDenied)
      {
        openAppSettings();
      }

  }

}

  @override
  void initState() {
    _checkPermission();
    super.initState();
    // initialize loadData method
    loadData();
  }

// created method for displaying custom markers according to index
  loadData() async{
    for(int i=0 ;i<images.length; i++){
      final Uint8List markIcons = await getImages(images[i], 100);
      // makers added according to index
      _markers.add(
        const Marker(
          markerId: MarkerId("1"),
          position: LatLng(30.699285146824476, 76.69179040341325),
          icon: BitmapDescriptor.defaultMarker,
        ),
      );
      setState(() {
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return  GoogleMap(
      // given camera position
      initialCameraPosition: _kGoogle,
      // set markers on google map
      markers: Set<Marker>.of(_markers),
      // on below line we have given map type
      mapType: MapType.normal,
      // on below line we have enabled location
      myLocationEnabled: true,
      myLocationButtonEnabled: true,
      // on below line we have enabled compass
      compassEnabled: false,
      // below line displays google map in our app
      onMapCreated: (GoogleMapController controller){
        _controller.complete(controller);
      },
    );
  }
}

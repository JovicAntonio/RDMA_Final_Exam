import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Maps extends StatefulWidget {
  const Maps({super.key});

  @override
  State<StatefulWidget> createState() {
    return _Maps();
  }
}

class _Maps extends State<Maps> {

  final List<Marker> markers = <Marker>[];
    
  // created list of coordinates of various locations
  final List<LatLng> _latLen = <LatLng>[
  
    const LatLng(45.34675042728017, 14.43095729384356),
    const LatLng(45.347711279214465, 14.433652166925507),
    const LatLng(45.35255379985314, 14.429565478198825),
    const LatLng(45.353889100747345, 14.427277659959953),
    const LatLng(45.35598409989911, 14.426746907684693),
    const LatLng(45.35689263889851, 14.424666281834506),
  ];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async{
    for(int i=0 ;i<_latLen.length; i++){
      markers.add(
        Marker(
          markerId: MarkerId(i.toString()),
          icon: BitmapDescriptor.defaultMarker,
          position: _latLen[i],
          infoWindow: InfoWindow(
            title: 'Location: $i',
          ),
        )
      );
      setState(() {
      });
    }
  }

  final Completer<GoogleMapController> _controller = Completer();

  final LatLng center = const LatLng(45.35237289595436, 14.428633450065433);

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      onMapCreated: (GoogleMapController controller){
                _controller.complete(controller);
            },
      mapType: MapType.hybrid,
      compassEnabled: true,
      markers: Set<Marker>.of(markers),
      initialCameraPosition: CameraPosition(
        target: center,
        zoom: 14.5,
      ),
    );
  }
}

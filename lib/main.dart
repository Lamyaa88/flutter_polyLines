import 'dart:async';
import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(Main());

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  Set<Polyline> lines = {};

  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
      target: LatLng(26.5590737, 31.6956705),
      zoom: 13
  );

  @override
  void initState() {
    super.initState();
    lines.add(
      Polyline(
        width: 5,
          points: [
            LatLng(26.5590737, 31.6956705),
            LatLng(26.2346033, 32.98883190000001),
//            LatLng(12.969406, 77.471301)
          ],
          endCap: Cap.roundCap,
          geodesic: false,
          polylineId: PolylineId("line_one"),
          patterns: [PatternItem.dot, PatternItem.gap(1),],color: Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Polylines',
      home: Scaffold(
        body: GoogleMap(
          initialCameraPosition: _kGooglePlex,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
          polylines: lines,
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapBoraped extends StatefulWidget {
  const MapBoraped({super.key});

  @override
  State<MapBoraped> createState() => _MapBorapedState();
}

class _MapBorapedState extends State<MapBoraped> {

  late GoogleMapController mapController;

  // ตำแหน่งบึงบอระเพ็ด
  final LatLng _boRaPedLocation =
  const LatLng(15.683786952321581, 100.24995703314431);

  // ชุดของ marker สำหรับบึงบอระเพ็ด
  final Set<Marker> _markers = {};

  // เมื่อสร้างแผนที่เสร็จสิ้น
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    _addWatChaiMarker();
  }

  // ฟังก์ชันสำหรับเพิ่ม marker สำหรับบึงบอระเพ็ด
  void _addWatChaiMarker() {
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId(_boRaPedLocation.toString()),
          position: _boRaPedLocation,
          infoWindow: InfoWindow(
            title: 'บึงบอระเพ็ด',
            snippet: 'ตำบล พระนอน อำเภอเมืองนครสวรรค์ นครสวรรค์ 60000',
          ),
          icon: BitmapDescriptor.defaultMarker,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('แสดงแผนที่บึงบอระเพ็ด'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Column(
        children: [
          Expanded(
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _boRaPedLocation,
                zoom: 15.0,
              ),
              mapType: MapType.normal,
              markers: _markers,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton.icon(
              onPressed: () {
                mapController.animateCamera(
                  CameraUpdate.newCameraPosition(
                    CameraPosition(target: _boRaPedLocation, zoom: 18.0),
                  ),
                );
              },
              icon: Icon(Icons.map, color: Colors.black),
              label: Text(
                'นำทางไปที่บึงบอระเพ็ด',
                style: TextStyle(color: Colors.black),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlueAccent,
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

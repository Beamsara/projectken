import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSawan extends StatefulWidget {
  const MapSawan({super.key});

  @override
  State<MapSawan> createState() => _MapSawanState();
}

class _MapSawanState extends State<MapSawan> {

  late GoogleMapController mapController;

  // ตำแหน่งอุทยานสวรรค์
  final LatLng _sawanLocation =
  const LatLng(15.698188701430041, 100.12219311207205);

  // ชุดของ marker สำหรับอุทยานสวรรค์
  final Set<Marker> _markers = {};

  // เมื่อสร้างแผนที่เสร็จสิ้น
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    _addWatChaiMarker();
  }

  // ฟังก์ชันสำหรับเพิ่ม marker สำหรับอุทยานสวรรค์
  void _addWatChaiMarker() {
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId(_sawanLocation.toString()),
          position: _sawanLocation,
          infoWindow: InfoWindow(
            title: 'อุทยานสวรรค์',
            snippet: 'ตำบลตะเคียนเลื่อน อำเภอเมืองนครสวรรค์ นครสวรรค์ 60000',
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
        title: Text('แสดงแผนที่อุทยานสวรรค์'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Column(
        children: [
          Expanded(
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _sawanLocation,
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
                    CameraPosition(target: _sawanLocation, zoom: 18.0),
                  ),
                );
              },
              icon: Icon(Icons.map, color: Colors.black),
              label: Text(
                'นำทางไปที่อุทยานสวรรค์',
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

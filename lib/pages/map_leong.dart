import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapLeong extends StatefulWidget {
  const MapLeong({super.key});

  @override
  State<MapLeong> createState() => _MapLeongState();
}

class _MapLeongState extends State<MapLeong> {

  late GoogleMapController mapController;

  // ตำแหน่งภัตตาคารเล่งหงษ์
  final LatLng _leongLocation =
  const LatLng(15.72041571243663, 100.1000491145205);

  // ชุดของ marker สำหรับภัตตาคารเล่งหงษ์
  final Set<Marker> _markers = {};

  // เมื่อสร้างแผนที่เสร็จสิ้น
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    _addWatChaiMarker();
  }

  // ฟังก์ชันสำหรับเพิ่ม marker สำหรับภัตตาคารเล่งหงษ์
  void _addWatChaiMarker() {
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId(_leongLocation.toString()),
          position: _leongLocation,
          infoWindow: InfoWindow(
            title: 'ภัตตาคารเล่งหงษ์',
            snippet: '99/990 ถ. พรหมนิมิตร ตำบลวัดไทร อำเภอเมืองนครสวรรค์ นครสวรรค์ 60000',
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
        title: Text('แสดงแผนที่ภัตตาคารเล่งหงษ์'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Column(
        children: [
          Expanded(
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _leongLocation,
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
                    CameraPosition(target: _leongLocation, zoom: 18.0),
                  ),
                );
              },
              icon: Icon(Icons.map, color: Colors.black),
              label: Text(
                'นำทางไปที่ภัตตาคารเล่งหงษ์',
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

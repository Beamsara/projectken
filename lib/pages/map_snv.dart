import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSnv extends StatefulWidget {
  const MapSnv({super.key});

  @override
  State<MapSnv> createState() => _MapSnvState();
}

class _MapSnvState extends State<MapSnv> {

  late GoogleMapController mapController;

  // ตำแหน่งห้องอาหาร เอส&วี
  final LatLng _snvLocation =
  const LatLng(15.707513050728274, 100.11285604937699);

  // ชุดของ marker สำหรับห้องอาหาร เอส&วี
  final Set<Marker> _markers = {};

  // เมื่อสร้างแผนที่เสร็จสิ้น
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    _addWatChaiMarker();
  }

  // ฟังก์ชันสำหรับเพิ่ม marker สำหรับห้องอาหาร เอส&วี
  void _addWatChaiMarker() {
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId(_snvLocation.toString()),
          position: _snvLocation,
          infoWindow: InfoWindow(
            title: 'ห้องอาหาร เอส&วี',
            snippet: '737/6 หมู่ที่ 10 ถนน มาตุลี ตำบลปากน้ำโพ อ.เมือง นครสวรรค์ 60000',
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
        title: Text('แสดงแผนที่ห้องอาหาร เอส&วี'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Column(
        children: [
          Expanded(
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _snvLocation,
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
                    CameraPosition(target: _snvLocation, zoom: 18.0),
                  ),
                );
              },
              icon: Icon(Icons.map, color: Colors.black),
              label: Text(
                'นำทางไปที่ห้องอาหาร เอส&วี',
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

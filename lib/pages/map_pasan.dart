import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPasan extends StatefulWidget {
  const MapPasan({super.key});

  @override
  State<MapPasan> createState() => _MapPasanState();
}

class _MapPasanState extends State<MapPasan> {

  late GoogleMapController mapController;

  // ตำแหน่งพาสาน
  final LatLng _paSanLocation =
  const LatLng(15.701339412128227, 100.14271340952288);

  // ชุดของ marker สำหรับพาสาน
  final Set<Marker> _markers = {};

  // เมื่อสร้างแผนที่เสร็จสิ้น
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    _addWatChaiMarker();
  }

  // ฟังก์ชันสำหรับเพิ่ม marker สำหรับพาสาน
  void _addWatChaiMarker() {
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId(_paSanLocation.toString()),
          position: _paSanLocation,
          infoWindow: InfoWindow(
            title: 'พาสาน',
            snippet: 'แหลมเกาะยม ตำบลปากน้ำโพ เมือง, นครสวรรค์ 60000',
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
        title: Text('แสดงแผนที่พาสาน'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Column(
        children: [
          Expanded(
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _paSanLocation,
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
                    CameraPosition(target: _paSanLocation, zoom: 18.0),
                  ),
                );
              },
              icon: Icon(Icons.map, color: Colors.black),
              label: Text(
                'นำทางไปที่พาสาน',
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

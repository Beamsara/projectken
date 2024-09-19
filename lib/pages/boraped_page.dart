import 'package:flutter/material.dart';
import 'package:projectken/pages/home_page.dart';
import 'package:projectken/pages/leong_page.dart';
import 'package:projectken/pages/snv_page.dart';
import 'package:projectken/pages/travel_page.dart';

class BorapedPage extends StatelessWidget {
  const BorapedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
            hintText: 'ค้นหา',
            prefixIcon: Icon(Icons.search),
          ),
        ),
        backgroundColor: Colors.blue[300],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'เมนู',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.restaurant),
              title: Text('แนะนำร้านอาหารดัง'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.place),
              title: Text('แนะนำสถานที่ท่องเที่ยว'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TravelPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blueGrey[100], // พื้นหลังสไตล์ฟ้า
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'assets/images/boraped_travel1.jpg', //
                        fit: BoxFit.cover,
                        height: 200,
                        width: 400,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'พิกัด: https://maps.app.goo.gl/LjTBWTRA5DpSKD3x8',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      'โทร. 0-5627-4522',
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'เวลาเปิด: สามารถเที่ยวชมได้ตลอดทั้งวัน',
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'ที่อยู่: ตำบลพระนอน อำเภอเมืองนครสวรรค์ จังหวัดนครสวรรค์',
                      style: TextStyle(fontSize: 14),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    Text(
                      'เว็บไซต์: https://www.facebook.com/buengboraphetnakonsawan',
                      style: TextStyle(fontSize: 14),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.place),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TravelPage()),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.restaurant),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

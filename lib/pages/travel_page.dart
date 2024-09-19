import 'package:flutter/material.dart';
import 'package:projectken/pages/boraped_page.dart';
import 'package:projectken/pages/home_page.dart';
import 'package:projectken/pages/leong_page.dart';
import 'package:projectken/pages/sawan_page.dart';
import 'package:projectken/pages/snv_page.dart';

class TravelPage extends StatelessWidget {
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
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center, // จัดตรงกลางในแนวนอน
          children: [
            SizedBox(height: 20),
            Text(
              'แนะนำสถานที่ท่องเที่ยว',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SawanPage()),
                );
              },
              child: Container(
                margin: EdgeInsets.all(10),
                width: 300, // ขนาดความกว้างคงที่ของบล็อก
                height: 200, // ขนาดความสูงคงที่ของบล็อก
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 150, // ขนาดความกว้างของรูปภาพคงที่
                      height: 150, // ขนาดความสูงของรูปภาพคงที่
                      child: Image.asset(
                        'assets/images/sawan.jpg',
                        fit: BoxFit.cover, // ปรับขนาดรูปภาพให้พอดี
                      ),
                    ),
                    SizedBox(height: 10), // ระยะห่างระหว่างรูปภาพและข้อความ
                    Text(
                      'อุทยานสวรรค์',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BorapedPage()),
                );
              },
              child: Container(
                margin: EdgeInsets.all(10),
                width: 300, // ขนาดความกว้างคงที่ของบล็อก
                height: 200, // ขนาดความสูงคงที่ของบล็อก
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 150, // ขนาดความกว้างของรูปภาพคงที่
                      height: 150, // ขนาดความสูงของรูปภาพคงที่
                      child: Image.asset(
                        'assets/images/boraped.jpg',
                        fit: BoxFit.cover, // ปรับขนาดรูปภาพให้พอดี
                      ),
                    ),
                    SizedBox(height: 10), // ระยะห่างระหว่างรูปภาพและข้อความ
                    Text(
                      'บึงบอระเพ็ด',
                      style: TextStyle(fontSize: 18),
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

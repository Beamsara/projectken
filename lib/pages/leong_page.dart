import 'package:flutter/material.dart';
import 'package:projectken/pages/home_page.dart';
import 'package:projectken/pages/travel_page.dart';

class LeongPage extends StatelessWidget {
  const LeongPage({super.key});

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
                    // ภาพอาหารที่แสดง
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'assets/images/leongrestaurant_food1.jpg', // ใส่รูปอาหาร 1
                        fit: BoxFit.cover,
                        height: 200,
                        width: 400,
                      ),
                    ),
                    SizedBox(height: 10),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'assets/images/leongrestaurant_food2.jpg', // ใส่รูปอาหาร 2
                        fit: BoxFit.cover,
                        height: 200,
                        width: 400,
                      ),
                    ),
                    SizedBox(height: 20),

                    // ข้อความรายละเอียดร้านอาหาร
                    Row(
                      children: [
                        Icon(Icons.facebook), // ไอคอนที่จะแสดง
                        SizedBox(width: 8), // ระยะห่างระหว่างไอคอนกับข้อความ
                        Text(
                          'ติดต่อเรา: FB S&V Restaurant Nakhonsawan',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'โทร. 081 785 5789',
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'เวลาเปิดร้าน: ทุกวัน 11.00-22.00 น.',
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'ที่อยู่: ถนนนครสวรรค์ตก อ.เมือง จ.นครสวรรค',
                      style: TextStyle(fontSize: 14),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
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

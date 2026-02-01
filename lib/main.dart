import 'package:flutter/material.dart';

void main() => runApp(HunterRadarApp());

class HunterRadarApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'رادار الصياد',
      theme: ThemeData(primarySwatch: Colors.green),
      debugShowCheckedModeBanner: false,
      home: HunterHomePage(),
    );
  }
}

class HunterHomePage extends StatefulWidget {
  @override
  _HunterHomePageState createState() => _HunterHomePageState();
}

class _HunterHomePageState extends State<HunterHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('رادار الصياد - نسخة اللاسلكي'),
        backgroundColor: Color(0xFF1B5E20), // لون أخضر غامق
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart), // أيقونة المتجر التي طلبتها
            onPressed: () => print('فتح المتجر'),
          ),
        ],
      ),
      body: Stack(
        children: [
          // خلفية مؤقتة للخريطة
          Container(color: Colors.grey[200], child: Center(child: Icon(Icons.map, size: 100, color: Colors.grey))),
          
          // حقوق الصياد في الزاوية
          Positioned(
            top: 20,
            right: 20,
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(color: Colors.black54, borderRadius: BorderRadius.circular(10)),
              child: Text('برمجة: عبدالمعطي عسيري', style: TextStyle(color: Colors.white, fontSize: 12)),
            ),
          ),

          // زر اللاسلكي (اضغط للتحدث PTT)
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onLongPressStart: (_) => print('جاري الإرسال...'),
                    onLongPressEnd: (_) => print('تم الإرسال'),
                    child: CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.red[900],
                      child: Icon(Icons.mic, size: 60, color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text('اضغط مطولاً للتحدث (PTT)', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

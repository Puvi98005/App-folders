import "package:flutter/material.dart";

class Realme extends StatelessWidget {
  Realme({super.key});

  final List<String> _realmelist = [

'''📱 1) Realme Narzo 60 5G — Overview & Specs
📌 Mid-range Smartphone

The Realme Narzo 60 5G offers a stylish design, smooth display, and reliable performance for daily use.

📊 Key Specifications

📺 Display
6.43-inch Super AMOLED
FHD+ resolution
90 Hz refresh rate

⚡ Performance
MediaTek Dimensity 6020 processor
8 GB RAM
128 GB internal storage

📸 Camera
Rear: 64 MP main + 2 MP depth sensor
Front: 16 MP selfie camera

🔋 Battery
5000 mAh battery
33W SuperVOOC fast charging

📱 Software
Realme UI 4.0 based on Android 13

👉 Best for: Students and users looking for style + performance.''',

'''📱 2) Realme C55 — Overview & Specs
📌 Budget Smartphone

Realme C55 is a budget-friendly phone with a large display and long battery life.

📊 Key Specifications

📺 Display
6.72-inch IPS LCD
FHD+ resolution

⚡ Performance
MediaTek Helio G88 processor
4 GB / 6 GB RAM
64 GB / 128 GB storage (expandable)

📸 Camera
Rear: 64 MP main camera
Front: 8 MP selfie camera

🔋 Battery
5000 mAh battery
33W fast charging

📱 Software
Realme UI 4.0 based on Android 13

👉 Best for: Budget users, students, basic gaming & media.''',

'''📱 3) Realme GT 2 Pro — Overview & Specs
📌 Flagship Smartphone

The Realme GT 2 Pro is a premium phone with top-tier performance and a stunning display.

📊 Key Specifications

📺 Display
6.7-inch AMOLED
2K resolution
120 Hz refresh rate
HDR10+ support

⚡ Performance
Qualcomm Snapdragon 8 Gen 1 processor
Up to 12 GB RAM
128 GB / 256 GB storage

📸 Camera
Rear:
50 MP main (Sony IMX766)
50 MP ultra-wide
3 MP microscope camera
Front: 32 MP selfie camera

🔋 Battery
5000 mAh battery
65W SuperDart charging

📱 Software
Realme UI 3.0 based on Android 12

👉 Best for: Gamers, power users, premium smartphone buyers.''',

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Realme Mobiles"),
        foregroundColor: const Color.fromARGB(255, 80, 3, 236),
      ),

      body: ListView.builder(
        itemCount: _realmelist.length,
        itemBuilder: (context, index) {
         return Card(
              
              margin: EdgeInsets.all(20),
              elevation: 5,
              shadowColor: Colors.black,
              color:Color.fromARGB(255, 243, 215, 133),
                 
              child: Padding(
                padding: EdgeInsetsGeometry.all(10),
              child: Text(_realmelist[index]),),
         );
        },
      ),
    );
  }
}

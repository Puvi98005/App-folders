import 'package:flutter/material.dart';

class HpLaptop extends StatelessWidget {
  HpLaptop({super.key});

  final List<String> _hpList = [

'''💻 1) HP Pavilion 15 — Overview & Specs
📌 Everyday Performance Laptop

HP Pavilion is perfect for students and office users.

📊 Key Specifications

🖥 Display
15.6-inch Full HD
1920 × 1080 resolution

⚡ Performance
Intel Core i5 (12th Gen)
8 GB RAM
512 GB SSD

🔋 Battery
Up to 8 hours

🧠 Software
Windows 11

👉 Best for: Students, office work, browsing.''',

'''💻 2) HP Victus Gaming — Overview & Specs
📌 Gaming Laptop

HP Victus offers powerful gaming performance.

📊 Key Specifications

🖥 Display
15.6-inch FHD
144 Hz refresh rate

⚡ Performance
AMD Ryzen 5 / Intel i7
16 GB RAM
512 GB SSD
NVIDIA RTX 3050 GPU

🔋 Battery
Up to 6 hours

👉 Best for: Gamers, creators.''',

'''💻 3) HP Spectre x360 — Overview & Specs
📌 Premium Convertible Laptop

A high-end 2-in-1 laptop with touch support.

📊 Key Specifications

🖥 Display
13.5-inch OLED Touch Display

⚡ Performance
Intel Core i7 (13th Gen)
16 GB RAM
1 TB SSD

🔋 Battery
Up to 13 hours

👉 Best for: Business users, premium buyers.''',

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("HP Laptops"),
        foregroundColor: const Color.fromARGB(255, 0, 100, 200),
      ),
      body: ListView.builder(
        itemCount: _hpList.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(20),
            elevation: 4,
            color: const Color.fromARGB(255, 150, 201, 243),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text(_hpList[index]),
            ),
          );
        },
      ),
    );
  }
}

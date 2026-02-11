import 'package:flutter/material.dart';

class MacBook extends StatelessWidget {
  MacBook({super.key});

  final List<String> _macbookList = [

'''💻 1) MacBook Air M1 — Overview & Specs
📌 Lightweight & Powerful Laptop

Apple MacBook Air M1 delivers excellent performance with long battery life.

📊 Key Specifications

🖥 Display
13.3-inch Retina Display
2560 × 1600 resolution

⚡ Performance
Apple M1 Chip
8-core CPU, 7-core GPU
8 GB RAM
256 GB SSD

🔋 Battery
Up to 18 hours battery life

🧠 Software
macOS Ventura

👉 Best for: Students, programmers, office work.''',

'''💻 2) MacBook Air M2 — Overview & Specs
📌 Premium Thin Laptop

MacBook Air M2 comes with improved performance and sleek design.

📊 Key Specifications

🖥 Display
13.6-inch Liquid Retina Display

⚡ Performance
Apple M2 Chip
8-core CPU, 10-core GPU
8 GB / 16 GB RAM
256 GB / 512 GB SSD

🔋 Battery
Up to 18 hours

🧠 Software
macOS Sonoma

👉 Best for: Creators, multitasking, premium users.''',

'''💻 3) MacBook Pro M2 — Overview & Specs
📌 High-Performance Laptop

Designed for professionals with heavy workloads.

📊 Key Specifications

🖥 Display
14-inch Liquid Retina XDR
120 Hz ProMotion

⚡ Performance
Apple M2 Pro Chip
16 GB RAM
512 GB SSD

🔋 Battery
Up to 20 hours

👉 Best for: Video editing, coding, professional users.''',

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("MacBook Laptops"),
        foregroundColor: Colors.black,
      ),
      body: ListView.builder(
        itemCount: _macbookList.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(20),
            elevation: 4,
            color: const Color.fromARGB(255, 244, 153, 153),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text(_macbookList[index]),
            ),
          );
        },
      ),
    );
  }
}

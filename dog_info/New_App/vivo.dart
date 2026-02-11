import "package:flutter/material.dart";

class Vivo extends StatelessWidget{
  Vivo({super.key});
  
   final  List<String> _vivolist = 

   [ ''' 📱 1) Vivo V25 5G is a mid-range smartphone with strong camera performance and smooth display.
     📊 Key Specifications

        Display: 6.44″ FHD+ AMOLED, 90 Hz refresh rate

        Processor: MediaTek Dimensity 900 (Octa-core)

        RAM & Storage: 8 GB / 12 GB RAM + 128 GB / 256 GB storage

        Rear Camera: 64 MP (main) + 8 MP (ultra wide) + 2 MP (macro)

        Front Camera: 50 MP selfie

        Battery: ~4500 mAh battery (fast charge support)

        Operating System: Android 12 (Funtouch OS 12)

   👉 Good choice if you want great selfies + balanced performance.''',
   '''  2) 📱 Vivo Y20 — Overview & Specs
📌 Basic Info

The Vivo Y20 is a budget-friendly smartphone with a big battery and decent performance for everyday tasks.

📊 Key Specifications

📺 Display

6.51-inch IPS LCD

HD+ resolution (1600 × 720)

📱 Performance

Qualcomm Snapdragon 460 processor

Available in 3GB / 4GB / 6GB RAM variants

64GB or 128GB internal storage (expandable)

📸 Camera

Rear: 13 MP + 2 MP + 2 MP triple camera

Front: 8 MP selfie camera

🔋 Battery

Big 5000 mAh battery (great for long usage)

📡 Connectivity

Dual SIM support

Bluetooth 5.0

Wi-Fi & GPS

📦 Other Features

Side fingerprint sensor

FM Radio

Micro USB port

👉 Best for: Students, first-time users, everyday browsing and social media.''',

'''📱 3) Vivo X90 — Overview & Specs
📌 Premium / Flagship Phone

The Vivo X90 is a flagship smartphone with a powerful processor, great camera system, and fast charging support.

📊 Key Specifications

📺 Display

6.78-inch AMOLED display

Full HD+ (2800 × 1260), 120 Hz refresh rate

HDR10+ support, bright & smooth visuals

⚡ Performance

MediaTek Dimensity 9200 5G processor

Up to 12 GB RAM

Storage: 128GB / 256GB / 512GB

📸 Camera

Triple rear cameras:

50 MP main (Sony IMX866)

12 MP portrait sensor (2× optical zoom)

12 MP ultra-wide lens

32 MP selfie camera

🔋 Battery

~4810 mAh battery

120W fast charging support

📱 Software

Funtouch OS 13 based on Android 13

📶 Connectivity

5G, 4G LTE

Wi-Fi 6

Bluetooth 5.3

NFC & Global navigation support

👉 Best for: Photography lovers, gamers, power users, premium devices buyers. '''
     ];

  @override
  Widget build(BuildContext context) {
     return Scaffold(
        appBar: AppBar(centerTitle: true, title: Text("Vivo Mobiles"),foregroundColor: const Color.fromARGB(255, 80, 3, 236),),

        
              body: ListView.builder(itemCount: _vivolist.length,itemBuilder: (context,index){
                return Card(
                  margin: EdgeInsets.all(20),
                  elevation: 4,
                  color: const Color.fromARGB(255, 196, 240, 166),
                
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(_vivolist[index]),
                  
                ), );
              }),
          
            );
     
  }
  
}
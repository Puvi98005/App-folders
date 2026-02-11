
import "package:flutter/material.dart";

void main()
{
  runApp(MyHome());
}

class MyHome extends StatelessWidget{
  MyHome({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: bottomWidget(), debugShowCheckedModeBanner: false,);
  }
  
}

class bottomWidget extends StatefulWidget{
  bottomWidget({super.key});

  @override
  _bottom createState() => _bottom();

}

class _bottom extends State<bottomWidget>{

  int? _index=0;

  final List<Widget> _widgetlist =[
    HomePage(),
    Search(),
    const Text(" Person Info"),

  ];

  void _botstate(int value){
     setState(() {
       _index= value;
     });
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
    appBar: AppBar(centerTitle: true,foregroundColor: Colors.blue,backgroundColor: const Color.fromARGB(255, 221, 237, 128),title: Text("Bottom Navigation Bar"),),
   
    body: Center(
      child: _widgetlist.elementAt(_index!),
    ),

    bottomNavigationBar: BottomNavigationBar(items: const[
      BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home Page") ,
      BottomNavigationBarItem(icon: Icon(Icons.search),label: "Search") ,
      BottomNavigationBarItem(icon: Icon(Icons.person),label: "Person") ,
    ],
    
    currentIndex: _index!,
    selectedItemColor: Colors.amberAccent,
    onTap: _botstate,
    ),
    
   
   ) ;
  
  }
   
}

class HomePage extends StatelessWidget{
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text("Helloo This is Home Page"),
          SizedBox(height: 30,),
          Image.network('https://cdn.pixabay.com/blog/preview/2025/12/04/08-46-34-41_960_720.jpg', width: 300, height: 300,),

        ],
      ),
    );
  
  }

}

class Search extends StatelessWidget{
  Search({super.key});

  @override
  Widget build(BuildContext context) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Search"),
            SizedBox(height: 30,),
            TextField(
              maxLength: 20,
              decoration: InputDecoration(
                hintText: "search",
                prefixIcon: Icon(Icons.search),
                prefixIconColor: Colors.purple,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              ),
            
            )
          ],
        ),
      );
  }

}
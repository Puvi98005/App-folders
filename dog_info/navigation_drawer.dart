
import "package:flutter/material.dart";

void main()
{
  runApp(MyHome());
}

class MyHome extends StatelessWidget{
  MyHome({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home:NavDrawer(),debugShowCheckedModeBanner: false,);
  }
  
}

class NavDrawer extends StatefulWidget{
  NavDrawer({super.key});
  
  @override
    _navdrawer createState() => _navdrawer();
    
}

class _navdrawer extends State<NavDrawer>{

String? _text="Home Page";

 List <String>  _itemlist =["Vivo", "Oppo","Iphone","Realme"];

 List <String>  _itemlistcomp =["HP", "Acer","Lenovo","Macbook"];

 void _update (value){
  setState(() {
    _text=value;
  });
 }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
       appBar: AppBar(centerTitle: true,title: Text("Navigation Bar"),foregroundColor: const Color.fromARGB(255, 0, 255, 17),),

       drawer: Drawer(
        child: ListView(
          children: [
           const DrawerHeader( 
            decoration: BoxDecoration(
              color: Colors.blueGrey,
            ), child: Text("Products"),
           ),

           ListTile(
            title: Text("Mobiles"),
            onTap: (){
               _update("Mobiles");
                
                Navigator.pop(context);
            },
           ),

           ListTile(
            title: Text("Computers"),
            onTap: (){
               _update("Computers");
               
                Navigator.pop(context);
            },
           )
          ],
        ),
       ),
       body: _buildBody(),
   );
  }




Widget _buildBody(){

  if ( _text == "Mobiles"){

    return ListView.builder(
      itemCount: _itemlist.length,
      itemBuilder:(context,index) {
            return ListTile(
              title: Text(_itemlist[index]),
          
            );
      });

  }
  else if(_text=="Computers")
  { 
    
     return ListView.builder(itemCount: _itemlistcomp.length,
     itemBuilder: (context,index){
          
        return ListTile(
          
          
        );
     });
  }

  else{
    return Center(child: Text("Hello No Info Available"));
  }
}
}
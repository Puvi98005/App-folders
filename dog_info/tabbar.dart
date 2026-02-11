
import 'package:flutter/material.dart';

void main(){
  runApp(MyHome());
}

class MyHome extends StatelessWidget{
  MyHome({super.key});
  
  @override
  Widget build(BuildContext context) {

    return MaterialApp(home: tabBarWidget(), debugShowCheckedModeBanner: false,);
  }
}

class tabBarWidget extends StatefulWidget{

  tabBarWidget({super.key});
  
  @override
  _tabBar createState() => _tabBar();
  
} 

class _tabBar extends State<tabBarWidget> with SingleTickerProviderStateMixin{
   late TabController _tabController;

   @override
    void initState(){
      super.initState();
      
      _tabController = TabController(length: 3, vsync: this);
      
    }
    
      @override
      Widget build(BuildContext context) {
          return Scaffold(
            appBar: AppBar(centerTitle: true,title: Text("TAB BAR", style: TextStyle(fontSize: 20),),
            
            bottom: TabBar(controller: _tabController,
            tabs: const[
              Tab(icon: Icon(Icons.home), text: "Home",),
              Tab(icon: Icon(Icons.search), text: "Search",),
              Tab(icon: Icon(Icons.person), text: "Profile",),
            ] ),),

        body: Center(
          child: TabBarView(
            controller: _tabController,
              children: [
               
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Home Page"),
                  SizedBox(height: 30,),
                  OutlinedButton(onPressed: (){
                    print("Hi Im From Home Page");
                  }, child: Text("Click Me"))
                ],),),
                
                
                Center(child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(" Search ", style: TextStyle(fontSize: 18),),
                    SizedBox(height: 30,),
                    Padding( padding: EdgeInsetsGeometry.all(30),
                      child: TextField(
                        maxLength: 10,
                        decoration: InputDecoration(
                          hintText: "Search",
                      
                          prefixIcon: const Icon(Icons.search,color: Colors.amber,),

                          iconColor: Colors.redAccent,

                          border: OutlineInputBorder(borderRadius:BorderRadius.circular ( 30)),
                          
                          
                      
                        ),
                        
                      ),
                    )
                  ],
                ),),
                Center(child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 200,
                      height: 200,
                      color: const Color.fromARGB(255, 129, 236, 248),
                      
                     child: Icon(Icons.person),
                      

                    )
                  ],
                ),)
              ],
            ),
        ),
        );

    
          
      }
   @override

        void dispose(){
          _tabController.dispose();
          super.dispose();
        }
    
 
}
  

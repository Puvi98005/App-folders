import 'package:dog_info/New_App/hp.dart';
import 'package:dog_info/New_App/macbook.dart';
import 'package:dog_info/New_App/product_details.dart';
import 'package:dog_info/New_App/realme.dart';
import 'package:dog_info/New_App/vivo.dart';
import'package:flutter/material.dart';


class Myapp extends StatelessWidget{
  Myapp({super.key});
  
  @override
  Widget build(BuildContext context) {
     return MaterialApp(home:home(), debugShowCheckedModeBanner: false,);
  }
}

class home extends StatefulWidget{
  home({super.key});
  
  @override
    _newApp createState() => _newApp();
  
}

class _newApp extends State<home> {

  int? _index=0;

  String? _text ="Home Page";

  final List<String> _mobile = [
      "Vivo", 
      "Realme",
     "Iphone",
     "Oppo",
  ];

  final List<String> _computer = [
    "MacBook", 
    "Hp",
    "Acer",
    "Dell",
  ];


void _showsnackBar (String value){
  
  ScaffoldMessenger.of(context).showSnackBar(
    
    SnackBar(
      content: Text(value),
      duration: Duration(seconds: 2),
      backgroundColor: const Color.from(alpha: 1, red: 0.894, green: 0.816, blue: 0.106),
      )
  );
}

Widget _buildBody() {

  if  (_text == "Mobiles"){
    return ListView.builder(
      itemCount: _mobile.length,
      itemBuilder: (context, index)
      {
        return ListTile(
          title: Text(_mobile[index]),

          trailing: Icon(Icons.arrow_forward_ios),
        
          onTap: (){
            if(_mobile[index] == "Vivo"){
            Navigator.push(context, MaterialPageRoute(builder: (context) => Vivo()));
          }
          
          else if(_mobile[index] == "Realme"){
            Navigator.push(context, MaterialPageRoute(builder: (context) => Realme()));
          }}
          ,
        );
      });
  }

  else if(_text == "Computers"){
    return ListView.builder(itemCount: _computer.length,itemBuilder: (context, index)
    {
     return ListTile(
      title: Text(_computer[index]),

      trailing: Icon(Icons.arrow_forward_ios),

      onTap: (){
        if(_computer[index] == "MacBook"){
          Navigator.push(context, MaterialPageRoute(builder: (context) => MacBook()));
        }
        else if(_computer[index] == "Hp"){
            Navigator.push(context, MaterialPageRoute(builder: (context) => HpLaptop()));
          }
      },
     );
    },
    ); 
    }

    else {
     
     return  _list.elementAt(_index!);
    }
  }


  final List<Widget> _list =[
    homePage(),
    search(),
  
    person(),
  ];
   
   void _update(value){
    setState(() {
       _index=value;
       _text= "Home Page";
       
    });
   }

     void _show(String value){
    setState(() {
      _text=value;
    });

    Navigator.pop(context);

    _showsnackBar("$value Selected");
  }
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("New App"), foregroundColor: const Color.fromARGB(255, 0, 183, 21), backgroundColor: Colors.white70,),
      
      drawer: Drawer(
        backgroundColor: const Color.fromARGB(255, 170, 211, 232),
        child: ListView(
          children: [
            DrawerHeader(
              
              child: Center(child: Text("Product", style: TextStyle(fontSize: 20, ),))
              ),
          
          ListTile(
            title: Text("Mobiles"),

            onTap:()
            {
              _show("Mobiles");
            }
          ),

          ListTile(
            title: Text("Computers"),

            onTap:()
            {
              _show("Computers");
            }
          )



          ]
        ),
      ),

      
      bottomNavigationBar: BottomNavigationBar(items: const[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.search),label:"Search"),
        BottomNavigationBarItem(icon: Icon(Icons.details), label: "Product Details"),
        
        
      ],
      
      onTap: _update,
      ),
   
     body: _buildBody(),
     
     

    );
  }

}

class Chatmessages{
  late final String text;
  late final bool isUse;

  Chatmessages({required this.text, required this.isUse});
}


class search extends StatefulWidget{
  const search({super.key});
  
  @override
  
  _searchMes createState() => _searchMes();

}


class _searchMes extends State<search>{

final TextEditingController _textEditingController = TextEditingController();

 List<Chatmessages> _textMes = [];

 void _sendMes(){
  String newtext = _textEditingController.text.trim();

  if(newtext.isEmpty)
     {
      return ;
     }

     setState(() {
       _textMes.add(Chatmessages(text: newtext, isUse: true));
     });

     _textEditingController.clear();

     //bot reply 

     String _botreply = _getmes(newtext);

     Future.delayed(Duration(milliseconds: 500),(){
         setState(() {
           _textMes.add(Chatmessages(text: _botreply, isUse: false));
         });
     });
 }

 String _getmes(String usetext){

  usetext = usetext.toLowerCase();

  if(usetext.contains("hi") || usetext.contains("hello")  ){
    return "Hello Dear 👋, How Can I help You?";
  }
  else if(usetext.contains("mobile")   ){
    return  "We have Vivo, Realme, iPhone, Oppo 📱 . And You can check the mobile specifications on drawer . Thank You ";
  }
  else if (usetext.contains("computer")) {
      return "Available computers: MacBook, HP, Acer, Dell 💻. And You can check the Computer specifications on drawer . Thank You";
    } else if (usetext.contains("price")) {
      return "Prices depend on model. Please Check Drawer there you can see the product Specs and Price 😄";
    } else {
      return "Sorry macha 🤖 I don't understand that yet.";
    }
  

 }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("Search Window"), foregroundColor: const Color.fromARGB(255, 7, 189, 255),),

      body: Center(
        child: Column(
          children: [

            //Input Section 

            Padding(
              padding: EdgeInsetsGeometry.all(20),
            
              child: Expanded(
                child: TextField(
                  controller: _textEditingController,
                  decoration: InputDecoration(
                  
                    hintText: "search here",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
                  ),
                ),
              ),
            ),

            IconButton(onPressed: _sendMes, icon: Icon(Icons.send, color: Colors.blue,)),

            Expanded(child: ListView.builder(
              itemCount: _textMes.length,
              itemBuilder:(context,index){

                final mes = _textMes[index];

                return Align(
                  alignment: 
                      mes.isUse? Alignment.centerRight: Alignment.centerLeft,

                      child: Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: mes.isUse ? const Color.fromARGB(255, 107, 84, 239):const Color.fromARGB(255, 198, 33, 243),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(mes.text),
                      ),
                    
                );
              } )),


          ],
        ),
        
      ),
    );
    
  }

}
class homePage extends StatelessWidget {
  const homePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        foregroundColor: const Color.fromARGB(255, 0, 218, 247),
        title: const Text("Home Page"),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [

              // Profile / App Image
              ClipOval(
                child: Image.network(
                  "https://cdn.pixabay.com/photo/2023/05/17/21/04/ai-generated-8001026_1280.jpg",
                  width: 180,
                  height: 180,
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(height: 20),

              // Title
              const Text(
                "Welcome to Gadget Hub 👋",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              // Subtitle
              const Text(
                "Your one-stop place for Mobile & Computer details",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: Color.fromARGB(255, 106, 105, 105),
                ),
              ),

              const SizedBox(height: 25),

              // Info Card
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: const [
                      Text(
                        "About This App",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "This app helps you explore electronic gadgets such as "
                        "Mobiles and Computers with their specifications and details. "
                        "Use the drawer and search feature to explore more!",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 25),

              // Action Button
              ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Use Drawer to explore products 📱💻")),
                  );
                },
                icon: const Icon(Icons.explore),
                label: const Text("Explore Products"),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class person extends StatefulWidget{
  person({super.key});

  @override
  
  _person createState() => _person();

}

class _person extends State<person> {

  String _radio ="No";

  final TextEditingController namecontroller =TextEditingController();
  final TextEditingController agecontroller =TextEditingController();
  final TextEditingController detailscontroller =TextEditingController();
  final TextEditingController budgetcontroller =TextEditingController();
  final TextEditingController addresscontroller =TextEditingController();
  final TextEditingController contactCOntroller = TextEditingController();

   

void _method(BuildContext context){
  Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetails(name:  namecontroller.text, age: agecontroller.text, details: detailscontroller.text,budget: budgetcontroller.text, address: addresscontroller.text,contact: contactCOntroller.text, emi: _radio, )));

}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(centerTitle: true,foregroundColor: const Color.fromARGB(255, 1, 200, 231),title: Text("Person"),),

     body: SingleChildScrollView(
      child:Column(children: [
        Text("Product Details", style: TextStyle(fontSize: 19, color: const Color.fromARGB(255, 235, 107, 3))),
        SizedBox(height: 30,),
       
       _inputField("Enter Your Name", namecontroller),
       _inputField("Enter Your Age", agecontroller),
       _inputField("Enter Product Details", detailscontroller),
       _inputField("Enter Your budget", budgetcontroller),
       _inputField("Enter Your Address for Shipping ", addresscontroller),
        _inputField("Enter Your Address Contact Number", contactCOntroller),

        SizedBox(height: 30,),
        Padding(
          padding: EdgeInsets.all(12),
          child: RadioListTile(
            title: Text("Emi Needed"),
            value: "Yes",
            groupValue: _radio,

            onChanged: (value){
              setState(() {
                _radio= value!;
              });
            },
            ),),

            Padding(
              padding: EdgeInsetsGeometry.all(12),
              child: RadioListTile(
                title: Text("No Emi"),
                value: "No",
                groupValue: _radio,
                
                onChanged: (value){
                  setState(() {
                    _radio=value!;
                  });
                },),
            ),
          
        SizedBox(height: 30,),
        Padding(padding: EdgeInsetsGeometry.all(20),

        child: ElevatedButton(onPressed:()=>  _method(context), child: Text("Next")),),
        

     
      ],)
     ),
  
    
    );
    
  }
   Widget _inputField(String hint ,TextEditingController controller){
    return Padding(
      padding: EdgeInsetsGeometry.all(10),

      child: Card(
        margin: EdgeInsets.all(10),
        elevation: 5,
        shadowColor: Colors.black87,
         
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hint,
            contentPadding: EdgeInsets.all(12),
            border:InputBorder.none,
          ),
        ),
      ),

    );
   }
}
 

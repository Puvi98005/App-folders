import "package:dog_info/New_App/new_app.dart";
import"package:flutter/material.dart";

class LoginPage extends StatefulWidget{
  @override
   _loginPage createState() => _loginPage();   
}
  
class _loginPage extends State< LoginPage>{
  bool _visible = false;

  //Controllers

  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontrol = TextEditingController();

  // predefined credentials

final String _correctemail = 'puvi@gmail.com';
final String _correctpass = "1234";

void _login(){

  final _email = _emailcontroller.text.trim();
  final _pass = _passwordcontrol.text.trim();

  if( _correctemail == _email && _correctpass == _pass){

    ScaffoldMessenger.of(context).showSnackBar(
      
      SnackBar(
        backgroundColor: const Color.fromARGB(255, 47, 246, 103),
      content: Text("Login Succesful"),),
    );
   Navigator.push(context, MaterialPageRoute(builder: (context) => Myapp()));
    
  }

  else{
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: const Color.fromARGB(255, 239, 27, 27),
        content: Text("Invalid email or password"))
    );
  }

  
}

@override
void dispose() {
  _emailcontroller.dispose();
  _passwordcontrol.dispose();
  super.dispose();
}



  @override
  Widget build(BuildContext context) {
      return Scaffold(
         backgroundColor: Colors.white,

         appBar: AppBar(centerTitle: true, foregroundColor: const Color.fromARGB(255, 171, 2, 255),title: Text(" Login Page"),),

         body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipOval(child: Image.asset("assets/dog_images/log.jpg", width: 150, height: 150, fit: BoxFit.cover)),
              
              SizedBox(height: 30,),
              Text("Login Here ", style: TextStyle(color: Colors.blue, fontSize: 20, ),),

              SizedBox(height: 10,),

              
              
                Padding(
                  padding: EdgeInsetsGeometry.all(30),
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    cursorWidth: 2,
                    controller: _emailcontroller,
                    decoration: InputDecoration(
                      
                      hintText: "Enter your e-mail ",
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))
                    ),
                  ),
                ),
              

              SizedBox(height: 30,),

              
                 Padding(
                   padding: EdgeInsets.symmetric(horizontal: 30),
                  child: TextField(
                    controller: _passwordcontrol,
                    obscureText: !_visible!,
                    
                    decoration: InputDecoration(
                      
                      hintText: " Password ",
                  
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton( 
                        icon: Icon(
                       _visible! ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: ()
                      {
                        setState(() {
                          _visible = ! _visible! ;
                        });
                      }, 
                     
                     ),

                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                
                    ),
                  ),
                ),
              

              SizedBox(height: 30,),

              
             ElevatedButton(onPressed:_login,

             child: Text("Login")),
            ],
          ),
         ),
      );
  }

}
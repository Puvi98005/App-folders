import "package:book_stash_new/service/auth_service.dart";
import "package:book_stash_new/utils/toast.dart";
import "package:flutter/material.dart";

class LoginScreen extends StatefulWidget{
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen>{

 

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Padding(
        padding: EdgeInsetsGeometry.all(20),
         child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Login", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: const Color.fromARGB(221, 49, 1, 79)),),
            SizedBox(height: 15,),
            TextFormField(
              controller: email,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20) ),
                hintText: "Enter your email ",
                prefixIcon: Icon(Icons.email)
              ),
            ),
            SizedBox(height: 15,),
             TextFormField(
              controller: password,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20) ),
                hintText: "Enter your password ",
                prefixIcon: Icon(Icons.password)
              ),
            ),
          
            SizedBox(height: 20,),
            SizedBox(width: double.infinity,
            child: OutlinedButton(onPressed: () async{
            await AuthServiceHelper.loginwithEmail(email.text, password.text).then((value){
              if(value == "Login Succesful"){
                 Message.show(message: "Login Succesful");
                 Navigator.pushReplacementNamed(context, "/home");
              }
              else{
                Message.show(message: "Error $value"); 
              }
            });
            }, child: const Text("Login")),),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Need an account?"),
                TextButton(onPressed: (){
                 Navigator.pushNamed(context, "/signup"  ) ;
                }, child: const Text("Register"))
              ],
            )
          ],
         ),
       ),
    );
  }


}

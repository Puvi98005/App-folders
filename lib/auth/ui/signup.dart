import "package:book_stash_new/service/auth_service.dart";
import "package:book_stash_new/utils/toast.dart";
import "package:flutter/material.dart";

class SignUpScreen extends StatefulWidget{
  const SignUpScreen({super.key});
  @override
  State<SignUpScreen> createState() => _SignUpScreen();
}

class _SignUpScreen extends State<SignUpScreen>{

 

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
            Text("Sign Up", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: const Color.fromARGB(221, 49, 1, 79)),),
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

              await AuthServiceHelper.createAccountwithEmail(email.text, password.text).then((value){
                if(value == "Account Created!"){
                 Message.show(message: "Account Created!");
                 Navigator.pushNamedAndRemoveUntil(context, "/home", (route) => false);
                }
                else{
                  Message.show(message: "Error : $value");
                }
              },);

            

            }, child: const Text("Sign Up")),),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Already have an account?"),
                TextButton(onPressed: (){
                  Navigator.of(context).pop();
                }, child: const Text("Login"))
              ],
            )
          ],
         ),
       ),
    );
  }


}

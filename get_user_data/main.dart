
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_data/controller/user_controller.dart';

import 'model/user.dart';

void main() {
  runApp(MyWidget());
}
class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      title: "User data ",
      home: Scaffold(
         appBar: AppBar(centerTitle: true, title: Text("User List", style: TextStyle(fontSize: 20, color: const Color.fromARGB(255, 12, 237, 31)),),),
         body:Center(
          child: GetX<UserController>(
            init: UserController(),
            builder: (controller) {
              if(controller.isLoading.value){
                return const CircularProgressIndicator();
              }
              return ListView.builder(
                itemCount: controller.users.length,
              itemBuilder: (context,index){
               User user = controller.users[index];

               return ListTile(
                
                title: Text(user.name),
                titleTextStyle: TextStyle(fontSize: 20, color: Colors.blueAccent),
                subtitle:Text(user.email, style: TextStyle(fontSize: 18),),
                
               );
              });
            } ,
          ),
         )
     
       ) ,
    );
  }
}
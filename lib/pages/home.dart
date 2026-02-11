
import 'package:book_stash_new/pages/books.dart';
import 'package:book_stash_new/service/database.dart';
import 'package:book_stash_new/utils/toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController title = TextEditingController();
  TextEditingController author = TextEditingController();
  TextEditingController  price = TextEditingController();

   Stream? booksStream;

   dynamic getInfoInit() async{
     booksStream = await DatabaseHelper().getAllbooksInfo();
     setState(() {
       
     });
   }

   @override

   void initState(){
    getInfoInit();
    super.initState();
   }

   Widget allBooksInfo() {
    return StreamBuilder( builder:(context, AsyncSnapshot snapshot){

      return snapshot.hasData? ListView.builder(
        itemCount: snapshot.data.docs.length,
        itemBuilder: (context, index){
           DocumentSnapshot documentSnapshot = snapshot.data.docs[index];
           return  Container(
              margin: EdgeInsets.only(bottom: 20.0),
             child: Material(
                
                elevation: 5,
                borderRadius: BorderRadius.circular(20),
                
                  child: Container(
               
                    padding: EdgeInsets.all(20),
                    width: MediaQuery.of(context).size.width, 
                    decoration: BoxDecoration(color: const Color.fromARGB(255, 137, 139, 139), borderRadius: BorderRadius.circular(20)),
                  
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.book_rounded, size: 40, color: const Color.fromARGB(255, 203, 248, 180),),
                            InkWell(
                              onTap: (){
                                title.text = documentSnapshot["Title"];
                                author.text = documentSnapshot["Author"];
                                price.text = documentSnapshot["Price"];

                                editBook(documentSnapshot["Id"]);

                              },
                              
                              child: Icon(Icons.edit_document, size: 40, color:Color.fromARGB(255, 241, 232, 224),)),

                              InkWell(
                                onTap: (){
                                  showDeletionConfirmation(context,documentSnapshot["Id"]);
                                },
                                
                                child: Icon(Icons.delete_forever))
                            
                            ]
                          ),
                        SizedBox(height: 20,),
                        Text('Title  : ${documentSnapshot["Title"]}', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),),
                        Text('Author : ${documentSnapshot["Price"]}', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold , fontSize: 18),),
                        Text('Price  : ${documentSnapshot["Author"]}', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),),
                      ],
                    ),
                  ),
                ),
           );

        },
        ) : Container();

    },
    stream: booksStream,);
   }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("Book Stash", style: TextStyle(fontSize: 30, color: const Color.fromARGB(255, 19, 21, 20),),),
      actions: [
        IconButton(onPressed: (){
        
         Navigator.pushReplacementNamed(context, "/login");

        }, icon: Icon(Icons.logout_outlined))
      ],),
      body: Container(
        margin: EdgeInsets.only(top:25, left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          
          children: [
            
            Expanded(child: allBooksInfo())
              
              

          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push((context), MaterialPageRoute(builder: (context) => Books()));
      },
      child: Icon(Icons.add),),
    
    );
  }

 
Future editBook(String id) {
 
    return showDialog(context: context, builder: (context) => AlertDialog(
      content: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
            Text("Edit a Book", style: TextStyle(fontSize: 20, color: const Color.fromARGB(255, 28, 6, 51)),),
            InkWell(
              onTap: (){
                Navigator.of(context).pop();
              },
              child: Icon(Icons.cancel_outlined)),
          ],
        ),
        Divider(height: 20,color:Color.fromARGB(255, 83, 82, 82)),
        
           Text("Title ", style: TextStyle(fontSize: 16, color: Colors.blueAccent),),
               TextField(
              controller: title,
              decoration: InputDecoration(
                hintText: "Enter book title here",
               border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
              ),
            ),
            SizedBox(height: 20,),
          
            Text("Author ",style: TextStyle(fontSize: 16, color: Colors.blueAccent)),
               TextField(
              controller: author,
              decoration: InputDecoration(
                hintText: "Enter author name here",
               border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
              ),
            ),
            SizedBox(height: 20,),
          
            Text("Price ",style: TextStyle(fontSize: 16, color: Colors.blueAccent)),
               TextField(
              controller: price,
              decoration: InputDecoration(
                hintText: "Enter price here",
               border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
              ),
            ),
            SizedBox(height: 20,),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton(onPressed: () async{
        
                  Map<String,dynamic> updateDetails = {
                    "Title" : title.text,
                    "Author" : author.text,
                    "Price" : price.text,
                     "Id" : id,
                  };
        
                  await  DatabaseHelper().updateBook(id, updateDetails).then((value){
                    Message.show(message: "Book updated Succesfully!");
                    Navigator.pop(context);
                  });
                  
                }, child: const Text("Update")),
        
                OutlinedButton(onPressed: (){
                  Navigator.of(context).pop();
                }, child: const Text("Cancel")),
              ],
            )
        
          ],
            ),
      ),
    ),
    );
}

void showDeletionConfirmation (BuildContext context, String id) {

  showDialog(context: context, builder: (BuildContext context) {

    return AlertDialog(
      title: Text("Confirm Deletion"),
      content: Text("Are you sure want to delete?") ,
      actions: [
        TextButton(onPressed: () async{
           await DatabaseHelper().deleteBook(id);
           Navigator.of(context).pop();
        }, child: const Text("Yes")),

        TextButton(onPressed: (){
             Navigator.of(context).pop();
        }, child: const Text("No"))
      ],
    );

  } );

}
}
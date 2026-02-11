import"package:cloud_firestore/cloud_firestore.dart";

class DatabaseHelper{

  Future addBookdetails(Map<String,dynamic> bookInfo, String id) async{

    return await FirebaseFirestore.instance.collection("Books").doc(id).set(bookInfo);
  } 
  
  //get all books info
  Future<Stream<QuerySnapshot>> getAllbooksInfo() async{
    return await FirebaseFirestore.instance.collection("Books").snapshots();
  }

  //update 

  Future updateBook(String id, Map<String,dynamic> updateDetails) async
  {
    return await FirebaseFirestore.instance.collection("Books").doc(id).update(updateDetails);
  }
 
 //delete

 Future deleteBook (String id) async{
  return await FirebaseFirestore.instance.collection("Books").doc(id).delete();
 }
  
}

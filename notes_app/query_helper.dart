import'package:sqflite/sqflite.dart' as sql;
import'package:sqflite/sqflite.dart' ;

class QueryHelper {

  static Future<void> createTable(sql.Database database) async 
  {
    await database.execute(""" 

        CREATE TABLE note{

          id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,
          title TEXT,
          description TEXT,
          time TIMESTAMP NOT NULL DEFAULT CURRENT _TIMESTAMP
        
        }

    """);
  }

  //CREATE A DATABASE 

  static Future<sql.Database> db() async {

    return sql.openDatabase("note_database.db", version: 1,
    onCreate: (sql.Database database, int version) async{
      await createTable(database);
    }
    
    );
  }

  //ends


  //INSERT A NEW NOTE INTO A TABLE 

  static Future<int> createNote (String title, String? description) async
  {
    final db= await QueryHelper.db();
    final datanote=  {'title': title, 'description': description};
    final id= await db.insert("note", datanote, conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  //ENDS

  //GET ALL NOTES

  static Future<List<Map<String , dynamic>>> getAllnotes() async{
  
  final db = await QueryHelper.db();
  return db.query('note', orderBy: 'id');
  }

  //ENDS

//GET A NODE
  static Future<List<Map<String,dynamic>>> getNote(int id) async{
    final db= await QueryHelper.db();
    return db.query("note", where: "id = ?", whereArgs: [id],limit: 1);
  }

  //ENDS

  //UPDATE
   static Future<int> updateNote(
       int id,
       String title,
       String? description,
    ) async 
   {
    final db= await QueryHelper.db();
    final datanote = {
      'title':title,
      'description': description,
      'time': DateTime.now().toString(),
    };
    final result = await db.update('note', datanote,where: "id= ?", whereArgs: [id]);
    return result;
   }
//ENDS

//DELETE 
 static Future<void> deleteNode(int id) async{
  final db= await QueryHelper.db();
  try{
    await db.delete('note',where: "id = ?", whereArgs: [id]);
  } catch(e)
  {
    e.toString();
  }
 }
 //ENDS

 //DELETE ALL NODES 

 static Future<void> deleteAllnode() async {
  final db= await QueryHelper.db();
  try{
    await db.delete('note',);
  } catch(e)
  {
    print(e.toString());
  }
 }

 
 //COUNT 
 static Future<int> getcount() async{
  final db=await QueryHelper.db();

  try{
    final count= Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM note'),
    );
    return count ?? 0;
  } catch(e){
    print(e.toString());
    return 0;
  }
 }

}




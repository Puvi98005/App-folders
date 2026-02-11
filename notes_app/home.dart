import'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:note_app/UI/query_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Home extends StatefulWidget{

  final Function(bool) onThemeChanged;

  //Home({super.key});
  Home({super.key, required this.onThemeChanged});
  @override
  
  // ignore: library_private_types_in_public_api
  _home createState()=> _home();

}

class _home extends State<Home>{

  bool _isDarkMode = false;

  Future<void> _loadThemePreferences() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      _isDarkMode = pref.getBool('isDarkMode') ?? false;
    });
  }

  void _toggleTheme (bool value){
    setState(() {
      _isDarkMode = value;
      widget.onThemeChanged(_isDarkMode);
    });
  }

  List<Map<String,dynamic>> _allNotes=[];
  bool _isLoadingNote = true;

   
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descController= TextEditingController();

  void _reloadState() async {
  final note= await QueryHelper.getAllnotes();
  setState((){
    _allNotes= note;
    _isLoadingNote=false;
  });
  }
  
   Future<void> _addnote()async {
    await QueryHelper.createNote(_titleController.text, _descController.text);
    _reloadState();
   }

   Future<void> _updateNote(int id) async{
    await QueryHelper.updateNote(id,_titleController.text, _descController.text);
    _reloadState();
   }
   
  void _deleteNote(int id) async{

    await QueryHelper.deleteNode(id);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: 
    Text("Note has been deleted")));
    _reloadState();

  }

  void _deleteAllnode () async{
    final notecount = await QueryHelper.getcount();

    if(notecount > 0)
    { 
      await QueryHelper.deleteAllnode();
      _reloadState();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: 
      Text("All notes have been deleted")));


    }
    else 
    {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("No Notes to delete")));
    }
    
  } 

  

  @override
   
   void initState(){
    super.initState();
    _reloadState();
    _loadThemePreferences();
   }



  void showBottomSheetcontent (int? id) async{

    if(id !=null)
    {
      final currentnote = _allNotes.firstWhere((element) => element['id'] ==id,);
      _titleController.text = currentnote['title'];
      _descController.text = currentnote['description'];

    }
  
   showModalBottomSheet(
    elevation: 10,
  isScrollControlled: true,
   context: context, 
   builder: (_) => Column(
    
    children: [
      
      SafeArea(
        child: SingleChildScrollView(
          child: Container(
            
          padding: EdgeInsets.only(
            top: 15,
            left: 15,
            right: 15,
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          
           child: Column(
            
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            
            children: [
            
              TextField(
                controller: _titleController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "title",
                  prefixIconColor: Colors.blueAccent,
                  prefixIcon: Icon(Icons.title),
                ),
              ),
              const SizedBox(height: 20,),
          
              TextField(
                maxLines: 5,
                controller: _descController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Add description",
                  prefixIconColor: Colors.blueAccent,
                  prefixIcon: Icon(Icons.description),
                  
                ),
              ),
               const SizedBox(height: 20,),

               ElevatedButton(onPressed: () async{
               if(id !=null){
                await _updateNote(id);
               }
               if(id ==null){
                await _addnote();
               }
               _titleController.text="";
               _descController.text ="";
               Navigator.of(context).pop();
               }, child: Text(
                id ==null? "Add Note ": "Update Note", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),)),

            ],
           ),
              
          ),
        ),
      ) 
    ],

   ) 
   
   );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,title: Text("Notes"),
      actions: [
        IconButton(onPressed: () async {
          _deleteAllnode();
        }, icon: Icon(Icons.delete_forever)),

        IconButton(onPressed: (){
            _appexit();
        }, icon: Icon(Icons.exit_to_app)),

        Switch(value: _isDarkMode, onChanged: (value){
            _toggleTheme(value);
            
        })
      ],

      ),
      
     body: SafeArea(child: _isLoadingNote? 
      Center(
        child: CircularProgressIndicator(),
      ):
      ListView.builder(
        
        itemCount: _allNotes.length,
        itemBuilder: (context, index) => Card(
          elevation: 10,
          margin: EdgeInsets.all(16),
          child: ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsGeometry.symmetric(vertical: 9),
                    child: Text(_allNotes[index]['title'], style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.blue ),),   
                  )),

                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                     IconButton(onPressed: (){
                       showBottomSheetcontent(_allNotes[index]['id']);
                     }, icon: Icon(Icons.edit)),

                     IconButton(onPressed: (){
                       _deleteNote(_allNotes[index]['id']);
                     }, icon: Icon(Icons.delete))
                    ],
                  ),

              ],
            ),
            subtitle: Text(_allNotes[index]['description'], style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600), ) ,
          ),
        ),
        )
      ),

      floatingActionButton:  FloatingActionButton(onPressed: (){
        showBottomSheetcontent(null);
      }, child: Icon(Icons.add)),
    
      
    );
  }
  
  void _appexit() {
    showDialog(context: context, 
    builder: (BuildContext context){
       return AlertDialog(
          title: Text("Exit App"),
          content:const Text("Are you sure want to exit?"),
          actions: [
            OutlinedButton(onPressed: (){
              Navigator.of(context).pop();
            }, child: const Text("Cancel")),
            OutlinedButton(onPressed: (){
             SystemNavigator.pop();
            }, child: const Text("Exit"))
          ],
       );
    });
  }

}
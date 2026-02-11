import "package:flutter/material.dart";
import "package:note_app/UI/home.dart";
import "package:shared_preferences/shared_preferences.dart";

void main(){
    runApp(NoteApp());
}

class NoteApp extends StatefulWidget{
  NoteApp({super.key});
  @override
    _Noteapp createState() => _Noteapp ();

}

class _Noteapp extends State<NoteApp>{
  
 ThemeMode _themeMode = ThemeMode.light;

 Future<void> _loadThemePreferences() async{
  SharedPreferences pref = await SharedPreferences.getInstance();
  bool isDarkmode= pref.getBool('isDarkMode') ?? false;
  setState(() {
    _themeMode = isDarkmode? ThemeMode.dark:ThemeMode.light;
  });
 
 }

Future<void> _toggleTheme(bool isDarkMode) async {
  SharedPreferences pref= await SharedPreferences.getInstance();
  setState(() {
    _themeMode= isDarkMode? ThemeMode.dark : ThemeMode.light;
    pref.setBool('isDarkMode', isDarkMode);
  });
}

@override
  void initState() {
    
    super.initState();
    _loadThemePreferences();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(26, 5, 238, 67) ),
        useMaterial3: true,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      themeMode: _themeMode,
      home: Home(
        onThemeChanged: _toggleTheme
      ),

    
    
    );
  }

}
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main(){
  runApp( WaterIntakeApp());
}

class WaterIntakeApp extends StatelessWidget{
  WaterIntakeApp({super.key});
  @override
  Widget build(Object context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Water Intake App",
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home:  WaterIntakeHomePage(),
      
    );
  }

}

class WaterIntakeHomePage extends StatefulWidget{
  


  WaterIntakeHomePage({super.key});

  @override
  State<StatefulWidget> createState() => _WaterIntakeHomePage();

}

class _WaterIntakeHomePage extends State<WaterIntakeHomePage>{

  int _waterIntake =0;
  int _dailyGoal = 8;
  final List<int> _dailyGoaloptions = [8,10,12];

  @override
  void initState(){
  super.initState();
  _loadPreferences();
  }

  Future<void> _loadPreferences() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      _waterIntake = (pref.getInt("waterIntake")?? 0);
      _dailyGoal = (pref.getInt("dailyGoal") ?? 8);
    });
  }

  Future<void> _incrementWaterIntake() async{
    SharedPreferences pref= await SharedPreferences.getInstance();
    setState(() {
      _waterIntake++;
      pref.setInt("waterIntake", _waterIntake);
      if(_waterIntake >= _dailyGoal){
        _showResetConfirmationDialog();
      }
    });
  }
  
  Future<void> _resetWaterIntake () async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      _waterIntake=0;
      pref.setInt("waterIntake", _waterIntake);
    });
  }

  Future<void> _setDailyGoal(int newGoal) async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      _dailyGoal = newGoal;
      pref.setInt("dailyGoal", newGoal);
    });
  }

  Future<void> _showGoalReachedDialog() async{
    return showDialog<void>(
      barrierDismissible: false,
      context: context,
       builder: (BuildContext context){
           return AlertDialog(
            title: const Text("Congratulations!"),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Text("You have reached your daily goal of $_dailyGoal glasses of water!"),
                ],
                
              ),
            ),
            
            actions: [
              TextButton(onPressed: (){
                 Navigator.of(context).pop();
              }, child: const Text("Okay"))
            ],
           );
       });
  }

   Future<void> _showResetConfirmationDialog() async{
    return showDialog<void>(
      barrierDismissible: false,
      context: context,
       builder: (BuildContext context){
           return AlertDialog(
            title: const Text("Reset Water Intake"),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Text("Are you sure want to reset your water intake!"),
                ],
                
              ),
            ),
            
            actions: [
              TextButton(onPressed: (){
                 Navigator.of(context).pop();
              }, child: const Text("Cancel")),
              TextButton(onPressed: (){
                 _resetWaterIntake();
                 Navigator.of(context).pop();
              }, child: const Text("Yes"))
            ],
           );
       });
  }

  @override
  Widget build(BuildContext context) {

    double progress = _waterIntake/_dailyGoal;
    bool goalreached = _waterIntake >= _dailyGoal;

   return Scaffold(
    appBar: AppBar(centerTitle: true, title: const Text("Water Intake App", style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Color.fromARGB(255, 72, 1, 1)),),),
    body: Center(child: Padding(
      padding: EdgeInsetsGeometry.all(15),
      child: Column(
        children: [
          
          const Icon(Icons.water_drop, size: 120, color: Colors.blue,),
          const SizedBox(height: 20,),
          Text("You have Consumed:", style: TextStyle(fontSize: 20, color: Colors.black87),),
          const SizedBox(height: 10,),
          Text("$_waterIntake glasses of water", style: TextStyle(fontSize: 25, color: const Color.fromARGB(255, 4, 54, 139)),),
          const SizedBox(height: 20,),
          LinearProgressIndicator(
            value: progress,
             color: Colors.blue,
             minHeight: 20,),
             const SizedBox(height: 20,),
             const Text("Daily Goal ", style: TextStyle(fontSize: 18),),
             DropdownButton(
              value: _dailyGoal,
              items: _dailyGoaloptions.map((int value){
                return DropdownMenuItem(
                  value: value,
                  child: Text("$value glasses"),
                );
              },).toList() ,
              onChanged: (int? newvalue){
                if(newvalue != null){
                  _setDailyGoal(newvalue);
                }
              }),
              const SizedBox(height: 10,),
              ElevatedButton(onPressed: goalreached? null: _incrementWaterIntake, child: const Text("Add a glass of water", style: TextStyle(fontSize: 18),)),
              const SizedBox(height: 30,),
              ElevatedButton(onPressed: (){
                _showResetConfirmationDialog();
              }, child: const Text("Reset"))
        ],
      ),
    ),),
   );
  }

}




/*
import 'package:book_stash_new/auth/ui/login_screen.dart';
import 'package:book_stash_new/auth/ui/signup.dart';
import 'package:book_stash_new/firebase_options.dart';
import 'package:book_stash_new/pages/home.dart';
import 'package:book_stash_new/service/auth_service.dart';
import 'package:firebase_core/firebase_core.dart';
import'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp( MyWidget());
}

class MyWidget extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'book stash',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.purpleAccent)),
     // home: LoginScreen() ,
     routes: {

      "/" : (context) => CheckUSerLoggedIn(),
      "/login" : (context) => LoginScreen(),
      "/home" : (context) => Home(),
      "/signup" : (context) => SignUpScreen(),
     },
    );
  }
}

class CheckUSerLoggedIn extends StatefulWidget {
  const CheckUSerLoggedIn({super.key});

  @override
  State<CheckUSerLoggedIn> createState() => _CheckUSerLoggedInState();
}

class _CheckUSerLoggedInState extends State<CheckUSerLoggedIn> {
 
  @override

  void initState() {
     AuthServiceHelper.isuserloggedIn().then((value){
        if(value){
          Navigator.pushReplacementNamed(context, "/home");
         }
         else{
          Navigator.pushReplacementNamed(context, "/login");
         }
    });
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Column(
      children: [
        CircularProgressIndicator(),
      ],
     ),
    );
  }
} */
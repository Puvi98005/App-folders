import 'package:dog_info/dog_details.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(MyHome());
}

class MyHome extends StatelessWidget{
  MyHome({super.key});

  @override
  Widget build(BuildContext context){
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    home:Scaffold(
    
    appBar: AppBar(centerTitle: true,title: const Text("Dog Info"),
    foregroundColor: const Color.fromARGB(255, 3, 244, 19),
    backgroundColor: Colors.white,),

    body: DogList(),
  ),
  theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 15, 236, 4))),
  
  );
}

}


class DogList extends StatelessWidget{
  DogList({super.key});

    List<String> dogBreeds=[
    "Pug",
    "Beagle",
    "Golden Retriever",
    "Chow Chow",
    ];

    Map <String,String>  dogInfo={
      "Beagle": "The Beagle is a small to medium-sized scent hound known for its friendly, curious, and energetic personality, making it a popular family pet. They are generally happy and sturdy dogs with a lifespan of 10 to 15 years.",
    "Pug":"Pugs are small, affectionate dogs known for their wrinkled face and playful nature. They love human attention and are easy to care for.",
    "Golden Retriever":"Golden Retrievers are intelligent, gentle, and very friendly dogs. They are excellent family pets and are often used as service dogs.",
    "Chow Chow":"Chow Chows are fluffy dogs with a lion-like appearance and a blue-black tongue. They are loyal, calm, and slightly reserved in nature.",

    };

  @override

  Widget build(BuildContext context ){
    return ListView.builder(itemCount: dogBreeds.length, itemBuilder: (context, index){
      return ListTile(
        title: Text(dogBreeds[index]),
        onTap: ()
        {
         Navigator.push(context, MaterialPageRoute(builder: (context) => DogdetailsScreen(breed: dogBreeds[index], info: dogInfo[dogBreeds[index]] ?? 'No Information Available')));
        },
      );
    } );
      
  }
}


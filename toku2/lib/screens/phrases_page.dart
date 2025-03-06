
import 'package:flutter/material.dart';
import 'package:toku2/components/item_phrases.dart';
import 'package:toku2/models/item_model.dart';

class PharesesPage extends StatelessWidget {
  const PharesesPage({super.key});
  final List<ItemModel> phareses = const [
    ItemModel(
      jpName: 'Kōdoku suru koto o wasurenaide kudasai',
      enName: "don't forget to subscribe",
      sound: 'sounds/phrases/dont_forget_to_subscribe.wav',
    ),
    ItemModel(
      
      jpName: 'Watashi wa puroguramingu ga daisukidesu',
      enName: 'i love programming',
      sound: 'sounds/phrases/i_love_programming.wav',
    ),
    ItemModel(
     
      jpName: 'Puroguramingu wa kantandesu',
      enName: 'programming is easy',
      sound: 'sounds/phrases/programming_is_easy.wav',
    ),
    ItemModel(
      
      jpName: 'Doko ni iku no',
      enName: 'where are you going?',
      sound: 'sounds/phrases/where_are_you_going.wav',
    ),
    ItemModel(
      
      jpName: 'Anata no namae wa nanidesu ka?',
      enName: 'what is your name?',
      sound: 'sounds/phrases/what_is_your_name.wav',
    ),
    ItemModel(
      
      jpName: 'Watashi wa anime ga daisukidesu',
      enName: 'i love anime',
      sound: 'sounds/phrases/i_love_anime.wav',
    ),
   
    ItemModel(
      
      jpName: 'Go kibun wa ikagadesu ka?',
      enName: 'how are you feeling?',
      sound: 'sounds/phrases/how_are_you_feeling.wav',
    ),
    ItemModel(
      
      jpName: 'Kimasu ka?',
      enName: 'are you coming?',
      sound: 'sounds/phrases/are_you_coming.wav',
    ),
    ItemModel(
      
      jpName: 'Hai, ikimasu',
      enName: "yes i'm coming",
      sound: 'sounds/phrases/yes_im_coming.wav',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff46322B),
        title: const Text(
          'Phrases',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.builder(
        itemCount: phareses.length,
        itemBuilder: (context, index) {
          return PhraseesItems(item: phareses[index],
          color: Colors.lightBlue,
          );
        },
      ),
    );
  }
}

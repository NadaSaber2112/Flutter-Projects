import 'package:flutter/material.dart';
import 'package:toku2/components/category_items.dart';
import 'package:toku2/screens/colors_page.dart';
import 'package:toku2/screens/familymember_page.dart';
import 'package:toku2/screens/number_page.dart';
import 'package:toku2/screens/phrases_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFEF6DB),
      appBar: AppBar(
        backgroundColor: const Color(0xff46322B),
        title: const Text(
          'Toku',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Category(
            text: 'Numbers',
            color: const Color(0xffEF9235),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const NumbersPage();
                },
              ));
            },
          ),
          Category(
            text: 'FamilyMembers',
            color: Colors.green,
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const FamilMembersPage();
              }));
            },
          ),
          Category(
            text: 'Colors',
            color: Colors.purple,
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const ColorsPage();
              }));
            },
          ),
          Category(
              text: 'Phrases',
              color: Colors.lightBlue,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const PharesesPage();
                }));
              }),
        ],
      ),
    );
  }
}

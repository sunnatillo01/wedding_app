import 'package:flutter/material.dart';
import 'package:wedding_app_flutter/screens/bottom.dart';
import 'package:wedding_app_flutter/screens/search_page.dart';

class HomePage extends StatelessWidget {
  static const String id = "HomePage";
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                   Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                             const  SearchPage()));
                },
                child: Container(
                  margin: const EdgeInsets.all(15),
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: Color(0xffff3366),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(Icons.search),
                      Container(
                        margin: const EdgeInsets.only(left: 8),
                        width: 250.0,
                        child: const Text(
                          "Поиск",
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              const BotPage(),
            ],
          ),
        ),
      ),
    );
  }
}

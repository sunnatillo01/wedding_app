import 'package:flutter/material.dart';
import 'package:wedding_app_flutter/screens/tabbars/tab_1.dart';
import 'package:wedding_app_flutter/screens/tabbars/tab_2.dart';

class BotPage extends StatefulWidget {
  const BotPage({super.key});

  @override
  State<BotPage> createState() => _BotPageState();
}

class _BotPageState extends State<BotPage> {
  int a=0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10,left: 10,right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                  a=0;
                  setState(() {
                    
                  });
                  },
                  child: Text("Сведебные залы"),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffff3366),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      )),
                ),
                  ElevatedButton(
                  onPressed: () {
                  a=1;
                setState(() {
                  
                });
                  },
                  child: Text("Сведебные услугы"),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffff3366),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      )),
                ),
                
              ],
            ),
          ),
          SizedBox(
            height: 600,
            child:a==0?  Tab1(): const Tab2() )
        ],
      ),
    );
  }
}

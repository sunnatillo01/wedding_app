import 'package:flutter/material.dart';

import 'home_page.dart';

class RegisterPAge extends StatefulWidget {
  const RegisterPAge({super.key});

  @override
  State<RegisterPAge> createState() => _RegisterPAgeState();
}

class _RegisterPAgeState extends State<RegisterPAge> {
  final TextEditingController nameController1 = TextEditingController();
  final TextEditingController telController1 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Column(
            children: [
              Container(
                height: 120,
                width: double.infinity,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                    color: Color(0xffff3366),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    )),
                child: const Text(
                  "TOYME",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: TextFormField(
                    controller: nameController1,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xffff3366),
                      hintText: "Имя пользователя",
                      hintStyle: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                   height: 50,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: TextFormField(
                    controller: telController1,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xffff3366),
                      hintText: "Номер телефона",
                      hintStyle: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .pushReplacement(MaterialPageRoute(builder: (context) {
                      return const HomePage();
                    }));
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 30),
                    height: 50,
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    decoration: BoxDecoration(
                      color: Color(0xffff3366),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text(
                        "Продолжать",
                        style: TextStyle(color: Colors.white, fontSize: 19),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

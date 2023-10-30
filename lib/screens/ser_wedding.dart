import 'package:flutter/material.dart';

class SerWeddingPage extends StatefulWidget {
  const SerWeddingPage({super.key});

  @override
  State<SerWeddingPage> createState() => _SerWeddingPageState();
}

class _SerWeddingPageState extends State<SerWeddingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: Color(0xffff3366),
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              size: 30,
              color: Colors.black87,
            ),
            onPressed: () {
              Navigator.pop(context, 'Tab_2');
            }),
      ),
      body: Column(
        children: [
          const SizedBox(height: 250),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Center(
                  child: Text(
                    "Пока мы не предоставляем свадебные услуги, но если у вас есть конкретное предложение, не стесняйтесь связаться с нами! Мы всегда рады добавить новые услуги в наш каталог, чтобы наши клиенты могли получить максимальный выбор. Вы можете связаться с нами по телефону или электронной почте, и мы обязательно рассмотрим ваше предложение. Спасибо, что выбрали наш каталог для планирования вашей свадьбы!",
                    style: TextStyle(
                        color: Color(0xFF14191F),
                        fontSize: 17,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

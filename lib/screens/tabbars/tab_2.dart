import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wedding_app_flutter/screens/ser_wedding.dart';

import '../../sss/getall/countr_bloc.dart';

class Tab2 extends StatelessWidget {
   static const String id = "Tab_2";
  const Tab2({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CountrBloc>(context).add(GetInfoEvent());

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            BlocBuilder<CountrBloc, CountrState>(
              builder: (context, state) {
                if (state is GetSuccesState) {
                  return GridView.count(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                    shrinkWrap: true,
                    children: [
                      for (int i = 0; i < state.data.length; i++)
                        Container(
                          width: MediaQuery.of(context).size.width / 2 - 20,
                          child: Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              SerWeddingPage()));
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.network(
                                    state.data[i].photo ?? "",
                                    width:
                                        MediaQuery.of(context).size.width / 2 -
                                            20,
                                    height:
                                        MediaQuery.of(context).size.width / 2 -
                                            10,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child: Center(
                                  child: Text(
                                    state.data[i].name ?? "",
                                    style: const TextStyle(
                                      color: Colors.redAccent,
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

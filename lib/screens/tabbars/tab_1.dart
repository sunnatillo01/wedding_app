import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wedding_app_flutter/screens/category_wedding.dart';


import '../../sss/getall/countr_bloc.dart';
import '../../sss/getwithid/get_with_id_bloc.dart';

class Tab1 extends StatelessWidget {
  const Tab1({super.key});

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
                                  BlocProvider.of<GetWithIdBloc>(context)
                                      .add(WeddingIdEvent(state.data[i].id));

                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              CategoryWedding()));
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
                                            20,
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
                                      color: Color(0xFFcc9966),
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5,vertical: 7),
                                child: Column(children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        state.data[i].price ?? "",
                                        style: const TextStyle(
                                          color: Color.fromARGB(255, 6, 8, 7),
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const Text(
                                        "Вместимость",
                                        style: TextStyle(
                                          color: Color.fromARGB(255, 6, 8, 7),
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "сум/чел",
                                        style: TextStyle(
                                          color: Color.fromARGB(255, 6, 8, 7),
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "${state.data[i].countPersonMin} - ${state.data[i].countPersonMax}",
                                        style: const TextStyle(
                                          color: Color.fromARGB(255, 6, 8, 7),
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    ],
                                  ),
                                ]),
                              )
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

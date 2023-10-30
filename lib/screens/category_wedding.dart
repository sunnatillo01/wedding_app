import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../sss/getwithid/get_with_id_bloc.dart';

class CategoryWedding extends StatefulWidget {
  const CategoryWedding({super.key});

  @override
  State<CategoryWedding> createState() => _CategoryWeddingState();
}

class _CategoryWeddingState extends State<CategoryWedding> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetWithIdBloc, GetWithIdState>(
        builder: (context, state) {
      if (state is WeddingSuccesState) {
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back),
                ),
                expandedHeight: 200,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.network(
                    state.data.photo ?? "",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10),
                          Text(
                            state.data.name ?? "",
                            style: const TextStyle(
                              color: Color(0xFFcc9966),
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 10),
                          canTex1("Фото:"),
                          const SizedBox(height: 10),
                          Container(
                            height: 100,
                            width: MediaQuery.of(context).size.width * 1,
                            child: ListView.builder(
                              itemCount: state.data.photos?.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return daWer(
                                    state.data.photos![index].image ?? "");
                              },
                            ),
                          ),
                          const SizedBox(height: 10),
                          canTex1("Средний чек:"),
                          const SizedBox(height: 10),
                          singLe1(state.data.price ?? ""),
                          // singLe1("700 000 сум/чел"),
                          const SizedBox(height: 10),
                          canTex1("Вместимость зала:"),
                          const SizedBox(height: 10),
                          singLe1(
                            "${state.data.countPersonMin} - ${state.data.countPersonMax}",
                          ),
                          const SizedBox(height: 10),
                          canTex2("Удобства:"),

                          ListView.builder(
                              padding: const EdgeInsets.only(top: 5),
                              shrinkWrap: true,
                              itemCount: state.data.servicesName?.length,
                              itemBuilder: (context, index) {
                                return cirText(state.data.servicesName![index]
                                        .nameservice ??
                                    "");
                              }),

                          const SizedBox(height: 10),
                          canTex2("Адрес:"),
                          const SizedBox(height: 5),
                          cirText(state.data.adress ?? ""),
                          SizedBox(height: 150),
                        ],
                      ),
                    );
                  },
                  childCount: 1,
                ),
              )
            ],
          ),
          bottomNavigationBar: _getBottomAppBar(state.data.phoneNumber??""),
        );
      } else {
        return Scaffold(
          body: const Center(
            child: CircularProgressIndicator(),
          ),
        );
      }
    });
  }

  daWer(String txt) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 100,
        width: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.black,
        ),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              txt,
              fit: BoxFit.cover,
            )),
      ),
    );
  }

  singLe1(String txt) {
    return Container(
      alignment: Alignment.center,
      height: 35,
      width: 200,
      decoration: BoxDecoration(
          color: Color(0xffff3366), borderRadius: BorderRadius.circular(8)),
      child: Text(
        txt,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
    );
  }

  canTex1(String txt) {
    return Text(
      txt,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 22,
      ),
    );
  }

  canTex2(String txt) {
    return Text(
      txt,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  canTex3(String txt) {
    return Text(
      txt,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 24,
      ),
    );
  }

  cirText(String name) {
    return Text(
      name,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 17,
      ),
    );
  }

  cirText2(String name) {
    return Text(
      name,
      style: const TextStyle(
        color: Color(0xffff3366),
        fontSize: 22,
      ),
    );
  }

  cirText3(String name) {
    return Text(
      name,
      style: const TextStyle(
        color: Color(0xffff3366),
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _getBottomAppBar(String number) {
    return BottomAppBar(
      color: const Color.fromARGB(255, 231, 229, 229),
      child: ButtonBar(
        alignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 75,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    cirText2("Средний чек"),
                    cirText3("700 000 сум "),
                  ],
                ),
                Container(
                  child: ElevatedButton(
                    onPressed: () {
                      _showDialog(context, number);
                    },
                    child: canTex3("Позвонить"),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xffff3366),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        )),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<void> _showDialog(BuildContext context, String phone) async {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                content: Text(phone),
                actions: [
                  TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text("Отменитъ"))
                ],
              ));
    });
  }
}

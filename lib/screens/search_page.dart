import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wedding_app_flutter/sss/Search/search_bloc.dart';

import '../sss/getwithid/get_with_id_bloc.dart';
import 'category_wedding.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchCon= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xffff3366),
                  ),
                  child: TextFormField(
                    controller: searchCon,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      hintText: 'Поиск',
                      prefixIcon: IconButton(
                        onPressed: () {
                          BlocProvider.of<SearchBloc>(context)
                              .add(GetSearchEvent(searchCon.text));
                        },
                        icon: Icon(
                          Icons.search,
                          size: 30,
                          color: Colors.black,
                        ),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.clear,
                          color: Colors.black,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(width: 0.8),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
      
      
                BlocBuilder<SearchBloc, SearchState>(builder: (context,state){
                  if (state is GetSearchSuccesState){
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
                                  padding: const EdgeInsets.only(top: 10),
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
                              
                              ],
                            ),
                          ),
                      ],
                    );
                
                }
                else{
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }})
              ],
            ),
          ),
        ),
      ),
    );
  }
}

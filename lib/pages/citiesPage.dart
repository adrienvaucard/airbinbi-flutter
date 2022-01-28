import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:airbinbi_flutter/bo/City.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class CitiesPage extends StatefulWidget {
  const CitiesPage({Key? key}) : super(key: key);

  @override
  _CitiesPageState createState() => _CitiesPageState();
}

class _CitiesPageState extends State<CitiesPage> {
  late StreamController<List<City>> _streamControllerListCities;
  late Stream<List<City>> _streamCities;

  @override
  void initState() {
    super.initState();
    _streamControllerListCities = StreamController<List<City>>();
    _streamCities = _streamControllerListCities.stream;
    fetchCities();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: _buildList())
        ],
      ),
    );
  }

  StreamBuilder<List<City>> _buildList() {
    return StreamBuilder<List<City>>(
        stream: _streamCities,
        builder: (context, snapshot) {
          if (snapshot.hasError) return const Icon(Icons.error);
          if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());
          return ListView.separated(
              itemCount: snapshot.data!.length,
              separatorBuilder: (BuildContext context, int index) => const Divider(thickness: 1.5),
              itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () => ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("❤"),
                    )),
                    child: ListTile(
                      //leading: Image.network("https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/6e443f00-bb6b-41ea-ba1a-f0c52dfb7cdc/ddrhs33-df39d039-d9ec-4450-b3a6-5c125a38e1e7.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzZlNDQzZjAwLWJiNmItNDFlYS1iYTFhLWYwYzUyZGZiN2NkY1wvZGRyaHMzMy1kZjM5ZDAzOS1kOWVjLTQ0NTAtYjNhNi01YzEyNWEzOGUxZTcuanBnIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.RnDoWNFkVfodcv1boGZ1lafSLMbTSwhe-37omwoGtA4"),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(snapshot.data![index].name),
                        ],
                      ),
                    ),
                  );
              }
          );
        }
    );
  }

  void fetchCities() async {
    Future<Response> resCities = get(
      Uri.parse("https://flutter-learning.mooo.com/villes"),
    );
    resCities.then(
            (value) {
          if (value.statusCode == 200) {
            String jsonBody = value.body;
            List<City> lsCities = List.empty(growable: true);

            for(Map<String, dynamic> city in jsonDecode(jsonBody)) {
              lsCities.add(City.fromJson(city));
            }
            _streamControllerListCities.sink.add(lsCities);
          }
        },
        onError: (_, err) => log("Error while fetching cities"));
  }
}



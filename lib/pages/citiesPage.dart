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
                      leading: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        child: Image.network(
                            "https://flutter-learning.mooo.com" + snapshot.data![index].pic.url,
                            height: 150,
                            fit:BoxFit.fill
                        ),
                      ),
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



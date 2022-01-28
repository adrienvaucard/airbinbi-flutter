import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:airbinbi_flutter/bo/Place.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class PlacesPage extends StatefulWidget {
  final int cityId;
  const PlacesPage(this.cityId, {Key? key}) : super(key: key);

  @override
  _PlacesPageState createState() => _PlacesPageState();
}

class _PlacesPageState extends State<PlacesPage> {
  late StreamController<List<Place>> _streamControllerListPlaces;
  late Stream<List<Place>> _streamPlaces;

  @override
  void initState() {
    super.initState();
    _streamControllerListPlaces = StreamController<List<Place>>();
    _streamPlaces = _streamControllerListPlaces.stream;
    fetchPlaces();
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

  StreamBuilder<List<Place>> _buildList() {
    return StreamBuilder<List<Place>>(
        stream: _streamPlaces,
        builder: (context, snapshot) {
          if (snapshot.hasError) return const Icon(Icons.error);
          if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());
          return ListView.separated(
              itemCount: snapshot.data!.length,
              separatorBuilder: (BuildContext context, int index) => const Divider(thickness: 1.5),
              itemBuilder: (context, index) {
                if (snapshot.data!.isNotEmpty) {
                  return InkWell(
                    onTap: () => Navigator.of(context).pushNamed(
                        '/details',
                        arguments: snapshot.data![index]
                    ),
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
                          Text(snapshot.data![index].title),
                        ],
                      ),
                    ),
                  );
                } else {
                  return Center(
                    child: Column(
                      children: [
                        Text("Il n'y a aucun bien de disponible pour cette ville :(")
                      ],
                    ),
                  );
                }
              }
          );
        }
    );
  }

  void fetchPlaces() async {
    Future<Response> resPlaces = get(
      Uri.parse("https://flutter-learning.mooo.com/logements?place.id=" + widget.cityId.toString()),
    );
    resPlaces.then(
            (value) {
          if (value.statusCode == 200) {
            String jsonBody = value.body;
            List<Place> lsPlaces = List.empty(growable: true);

            for(Map<String, dynamic> place in jsonDecode(jsonBody)) {
              lsPlaces.add(Place.fromJson(place));
            }
            _streamControllerListPlaces.sink.add(lsPlaces);
            log(lsPlaces.toString());
          }
        },
        onError: (_, err) => log("Error while fetching cities"));
  }
}

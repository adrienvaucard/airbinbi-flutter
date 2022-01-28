import 'package:airbinbi_flutter/bo/Place.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  final Place placeDetails;
  const DetailsPage(this.placeDetails, {Key? key}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: Center(
          child: Column(
            children: [
              Image.network(
                  "https://flutter-learning.mooo.com" + widget.placeDetails.pic.url,
                  height: 300,
                  fit:BoxFit.fill
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(
                    widget.placeDetails.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(
                    "Propriétaire : " + widget.placeDetails.owner
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(widget.placeDetails.price.toString() + "€ / Nuit"),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: ElevatedButton(
                  onPressed: () => Navigator.of(context).pushNamed(
                      '/dates',
                      arguments: widget.placeDetails.dates
                  ),
                  child: Text("Réserver")),
            )
          ],
        ),
      ),
    );
  }
}

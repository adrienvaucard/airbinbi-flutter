import 'package:flutter/material.dart';

class DatesPage extends StatefulWidget {
  final List<String> availableDates;
  const DatesPage(this.availableDates, {Key? key}) : super(key: key);

  @override
  _DatesPageState createState() => _DatesPageState();
}

class _DatesPageState extends State<DatesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemCount: widget.availableDates.length,
        separatorBuilder: (BuildContext context, int index) => const Divider(thickness: 1.5),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {},
            child: ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.availableDates[index]),
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}

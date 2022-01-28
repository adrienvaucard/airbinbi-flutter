import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/caravane.png"),
              fit: BoxFit.cover,
            ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(flex: 1,),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pushNamed('/cities'),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: Colors.black)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Spacer(),
                          Icon(Icons.search),
                          Spacer(),
                          Text("Où allons-nous ?"),
                          Spacer(flex: 2,)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Spacer(flex: 4,)
            ],
          ),
        ),
    ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.search),
                  tooltip: "Explorer",
              ),
              Spacer(),
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.favorite_outline),
                  tooltip: "Favoris",

              ),
              Spacer(),
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.airplanemode_active),
                  tooltip: "Voyages",
              ),
              Spacer(),
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.message_outlined),
                  tooltip: "Messages",
              ),
              Spacer(),
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.person),
                  tooltip: "Connexion",
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
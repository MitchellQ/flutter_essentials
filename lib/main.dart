import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      home: const HomePage(),
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      )));
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Awesome App"),
      ),
      body: Container(
        color: Colors.teal,
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(8),
              width: 100,
              height: 100,
              alignment: Alignment.center,
              color: Colors.red,
            ),
            Container(
              padding: const EdgeInsets.all(8),
              width: 100,
              height: 100,
              alignment: Alignment.center,
              color: Colors.yellow,
            ),
            Container(
              padding: const EdgeInsets.all(8),
              width: 100,
              height: 100,
              alignment: Alignment.center,
              color: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}

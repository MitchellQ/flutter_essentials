import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../utils/constants.dart';
import '../widgets/drawer.dart';
import 'login_page.dart';

class HomePageFb extends StatelessWidget {
  const HomePageFb({Key? key}) : super(key: key);

  static const String routeName = '/home';

  Future<dynamic> fetchData() async {
    const url = "https://jsonplaceholder.typicode.com/photos";
    var res = await http.get(Uri.parse(url));
    dynamic data = jsonDecode(res.body);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text("Awesome App"),
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.exit_to_app),
              onPressed: () {
                Constants.prefs?.setBool("loggedIn", true);
                Navigator.pushReplacementNamed(context, LoginPage.routeName);
              }),
        ],
      ),
      body: FutureBuilder<dynamic>(
        future: fetchData(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return const Center(
                child: Text("Fetch something"),
              );

            case ConnectionState.active:
            case ConnectionState.waiting:
            case ConnectionState.done:
              if (snapshot.hasError) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              return ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(snapshot.data?[index]["title"]),
                    subtitle: Text("ID: ${snapshot.data?[index]["id"]}"),
                    leading: Image.network(snapshot.data?[index]["url"]),
                  );
                },
                itemCount: snapshot.data?.length ?? 0,
              );

            default:
              return const SizedBox();
          }
        },
      ),
      drawer: const MyDrawer(),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     myText = _nameController.text;
      //     setState(() {});
      //   },
      //   child: const Icon(Icons.refresh),
      // ),
    );
  }
}

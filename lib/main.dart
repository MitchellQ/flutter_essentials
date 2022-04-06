import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      home: const HomePage(),
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      )));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var myText = "Change My Name";
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text("Awesome App"),
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Card(
            child: Column(
              children: <Widget>[
                Image.asset(
                  "assets/bg.jpg",
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  myText,
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter some text here",
                      labelText: "Name",
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            // DrawerHeader(
            //   child: Text("Hi I am a drawer"),
            //   decoration: BoxDecoration(color: Colors.purple),
            // ),
            const UserAccountsDrawerHeader(
              accountName: Text("Mitchell Quarrie"),
              accountEmail: Text("mitchellq@missionreadyhq.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                  "https://img.nzdating.com/photos/p/b/18b9st_FGIORf5f3afVlbw--.jpg",
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text("Mitchell Quarrie"),
              subtitle: const Text("Developer"),
              trailing: const Icon(Icons.edit),
              onTap: () {},
            ),
            const ListTile(
              leading: Icon(Icons.email),
              title: Text("Test"),
              subtitle: Text("Developer"),
              trailing: Icon(Icons.add),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          myText = _nameController.text;
          setState(() {});
        },
        child: const Icon(Icons.send),
      ),
    );
  }
}

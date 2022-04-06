import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
    );
  }
}

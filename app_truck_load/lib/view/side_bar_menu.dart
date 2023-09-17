import 'package:flutter/material.dart';

import 'agendar_page.dart';
import 'caminhao_list_page.dart';
import 'login_page.dart';

class SideBarMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'Menu',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 44, 44, 216),
            ),
          ),
          ListTile(
            leading: Icon(Icons.paste),
            title: Text('Agendar'),
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AgendarPage()))
            },
          ),
          ListTile(
            leading: Icon(Icons.fire_truck),
            title: Text('Meus Caminhoes'),
            onTap: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CaminhaoListPage()))
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginPage())),
            },
          ),
        ],
      ),
    );
  }
}

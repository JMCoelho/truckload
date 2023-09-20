import 'package:flutter/material.dart';

import '../controller/LoginController.dart';
import 'agendar_page.dart';
import 'caminhao_list_page.dart';
import 'login_page.dart';

class SideBarMenu extends StatelessWidget {
  LoginController loginController = LoginController();

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
            onTap: () async => {
              if (await loginController.logout())
                {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  )
                }
              else
                {
                  showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                              title: const Text('Falha para deslogar'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => Navigator.pop(context, 'OK'),
                                  child: const Text('Cancel'),
                                ),
                              ]))
                }
            },
          ),
        ],
      ),
    );
  }
}

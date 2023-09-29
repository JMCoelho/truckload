import 'package:app_truck_load/view/status_operacao_page.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

import '../controller/AgendamentoController.dart';
import '../controller/LoginController.dart';
import 'agendar_page.dart';
import 'caminhao_list_page.dart';
import 'cheguei_page.dart';
import 'login_page.dart';

class SideBarMenu extends StatelessWidget {
  LoginController loginController = LoginController();

  SideBarMenu({super.key});

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
            onTap: () async => {await operacaoRedirect(context)},
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
            leading: Icon(Icons.chat),
            title: Text('Fale Conosco'),
            onTap: () async => {await launchWhatsAppUri()},
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

  operacaoRedirect(BuildContext context) async {
    AgendamentoController agendamentoController = AgendamentoController();

    String page = await agendamentoController.hasAgendamento();
    if (page == "agendamento") {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const ChegueiPage()));
    } else if (page == "movimentacao") {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const StatusOpercaoPage()));
    } else {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const AgendarPage()));
    }
  }

  launchWhatsAppUri() async {
    final link = WhatsAppUnilink(
      phoneNumber: '+55 21 9999-9999',
      text: "Olá, preciso de ajuda com o truckload :)",
    );
    // Convert the WhatsAppUnilink instance to a Uri.
    // The "launch" method is part of "url_launcher".
    await launchUrlString('$link');
  }
}

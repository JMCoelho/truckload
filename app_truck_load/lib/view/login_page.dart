import 'package:app_truck_load/controller/LoginController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'menu_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String login = "";
  String senha = "";
  LoginController loginController = LoginController();

  @override
  Widget build(BuildContext context) {
    const String assetName = 'assets/img/logo.svg';
    return Scaffold(
        body: SingleChildScrollView(
            child: Center(
                child: SizedBox(
      width: MediaQuery.of(context).size.width / 1.3,
      height: MediaQuery.of(context).size.height / 1.3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 100),
          SvgPicture.asset(assetName,
              height: 200, width: 70, color: Color.fromARGB(255, 44, 44, 216)),
          SizedBox(height: 100),
          TextField(
            onChanged: (text) {
              login = text;
            },
            decoration: InputDecoration(
              labelText: "Login",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 10),
          TextField(
            onChanged: (text) {
              senha = text;
            },
            obscureText: true,
            decoration: InputDecoration(
                labelText: "Senha", border: OutlineInputBorder()),
          ),
          SizedBox(height: 10),
          SizedBox(
              width: MediaQuery.of(context).size.width / 4,
              height: MediaQuery.of(context).size.height / 20,
              child: FilledButton(
                onPressed: () async {
                  if (login != "" || senha != "") {
                    EasyLoading.show(status: 'loading...');
                    if (await loginController.login(
                        login: login, senha: senha)) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MenuPage()),
                      );
                    } else {
                      showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                                  title: const Text('Falha no Login'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, 'OK'),
                                      child: const Text('Cancel'),
                                    ),
                                  ]));
                    }
                  }
                  EasyLoading.dismiss();
                },
                child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text("Entrar",
                        style: TextStyle(
                          fontFamily: "Lalezar",
                          fontSize: 30,
                        ))),
                style: FilledButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 20),
                    backgroundColor: Color.fromARGB(255, 44, 44, 216)),
              )),
        ],
      ),
    ))));
  }
}

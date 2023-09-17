import 'package:flutter/material.dart';
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
	
	@override
	Widget build(BuildContext context)
	{
	final String assetName = 'assets/img/logo.svg';

	return Scaffold(
		body:SingleChildScrollView(
		child: Center(
			child: SizedBox(
				width: MediaQuery.of(context).size.width/1.3,
				height: MediaQuery.of(context).size.height/1.3,
			child: Column(
			mainAxisAlignment: MainAxisAlignment.center,
			children: [
			SizedBox(height: 100),
			SvgPicture.asset(
				assetName,
				height: 200,
					 width: 70,
				color: Color.fromARGB(255, 44, 44, 216)
			),
			SizedBox(height: 100),
			TextField(
				onChanged: (text){
				login = text;
				},
				decoration: InputDecoration(
				labelText: "Login",
				border: OutlineInputBorder(),

				),
			),
			SizedBox(height: 10),
			TextField(
				onChanged: (text){
				senha = text;
				},
				obscureText: true,
				decoration: InputDecoration(
				labelText: "Senha",
				border: OutlineInputBorder()
				),
			),
			SizedBox(height: 10),
			SizedBox(
				width: MediaQuery.of(context).size.width/4,
				height: MediaQuery.of(context).size.height/20,
				child: FilledButton(
				onPressed: () {  
				if(login != "" && senha != "")
				{
					Navigator.push(
					context,
					MaterialPageRoute(builder: (context) => MenuPage()),
				 );
				}
				},
				child: FittedBox(
					fit: BoxFit.fitWidth,
					child: Text("Entrar",
						style: TextStyle( 
						fontFamily: "Lalezar",
						fontSize: 30,
					)
					)),
				style: 
				FilledButton.styleFrom(
					textStyle: const TextStyle(fontSize: 20),
					backgroundColor: Color.fromARGB(255, 44, 44, 216)
					),
				)
			),
			],
			),
		)
		)
	));
	}
}
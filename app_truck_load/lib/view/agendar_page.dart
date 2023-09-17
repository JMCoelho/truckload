import 'package:app_truck_load/view/side_bar_menu.dart';
import 'package:flutter/material.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

import 'cheguei_page.dart';


class AgendarPage extends StatefulWidget {
	const AgendarPage({super.key});

	@override
	State<AgendarPage> createState() => _AgendarPageState();
}

class _AgendarPageState extends State<AgendarPage> {

	TextEditingController controller = TextEditingController();
	int? cargaDescarga = 0;

	@override
	Widget build(BuildContext context) {
	return Scaffold(
	drawer: SideBarMenu(),
	appBar: AppBar(
		title: Text('Truck Load'),
		backgroundColor: Color.fromARGB(255, 44, 44, 216),
	),
	body:SingleChildScrollView(
		child: Center(
		child: SizedBox(
			width: MediaQuery.of(context).size.width/1.3,
			child: Column(
			mainAxisAlignment: MainAxisAlignment.center,
			children: [
				SizedBox(height:20),
					Text("Agendar",
					style: TextStyle(
					fontFamily: "Lalezar",
					fontSize: 30,
					color: Color.fromARGB(255, 44, 44, 216)
					)
				),
				SizedBox(height:50),
				TextField(
				onChanged: (text){
					 text;
				},
				decoration: InputDecoration(
					border: OutlineInputBorder(),
					labelText: "Placa do Caminhao"
				),
				),
				SizedBox(height:20),
				TextField(
				onChanged: (text){
					 text;
				},
				decoration: InputDecoration(
					border: OutlineInputBorder(),
					 labelText: "Placa da Carreta"
				),
				),
				SizedBox(height:20),
				TextField(
				onChanged: (text){
					 text;
				},
				decoration: InputDecoration(
					border: OutlineInputBorder(),
					 labelText: "Destino"
				),
				),
				SizedBox(height:20),
				TextField(
					onChanged: (text){
						text;
					},
					decoration: InputDecoration(
						border: OutlineInputBorder(),
						labelText: "Data"
					),
				),
				SizedBox(height:20),
				SizedBox(
					width: MediaQuery.of(context).size.width,
					//height: TextField.,
					child: Align(
						alignment: Alignment.centerLeft,
						child: Wrap( 
							spacing: 28,
							children: [
									SizedBox(
										width: MediaQuery.of(context).size.width/2,
										child: TextField(
											controller: controller,
												onChanged: (text){
												text;
												},
												decoration: InputDecoration(
													border: OutlineInputBorder(),
													labelText: "Nota Fiscal"
												),
											)
									),
									SizedBox(
										width: MediaQuery.of(context).size.width/5,
										height: MediaQuery.of(context).size.width/8,
										child: 
											OutlinedButton(
												onPressed:() async {
													var res = await Navigator.push(
														context,
														MaterialPageRoute(
														builder: (context) => const SimpleBarcodeScannerPage(),
														));
													setState(() {
													if (res is String) {
														controller.text = res;
													}
													});
												},
												style: OutlinedButton.styleFrom(
													side: BorderSide(color: Colors.black45)
												),
												child: FittedBox(
														fit: BoxFit.fitWidth,
														child: Icon(
																Icons.camera_alt,
																size: MediaQuery.of(context).size.width/10,
																color: Color.fromARGB(255, 12, 1, 1)
																),
															)
														),
												),
						]))
				),
				SizedBox(height:20),
				RadioListTile<int>(
					title: const Text('Carga'),
					value: 0,
					groupValue: cargaDescarga,
					onChanged: (int? value) { setState(() {cargaDescarga = value;});},
				),
				RadioListTile<int>(
					title: const Text('Descarga'),
					value: 1,
					groupValue: cargaDescarga,
					onChanged: (int? value) { setState(() { cargaDescarga = value; }); },
				),
				SizedBox(height:60),
				SizedBox(
					width: MediaQuery.of(context).size.width/2,
					height: MediaQuery.of(context).size.height/10,
					child: FilledButton(
					onPressed: () {
						Navigator.push(
							context,
							MaterialPageRoute(builder: (context) => ChegueiPage()),
						);
					},
					child: FittedBox(
						fit: BoxFit.fitWidth,
						child: Text("Agendar",
							style: TextStyle( 
							fontFamily: "Lalezar",
							fontSize: 40,
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
		),
		)
	)
	);
	}
	
}
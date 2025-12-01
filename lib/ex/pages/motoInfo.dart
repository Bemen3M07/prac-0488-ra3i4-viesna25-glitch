import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/motoProvider.dart';

class SecondPage extends StatefulWidget {
	const SecondPage({Key? key}) : super(key: key);

	@override
	State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
	final TextEditingController kmInicialController = TextEditingController();
	final TextEditingController kmActualController = TextEditingController();
	double? kmRestants;

	@override
	void dispose() {
		kmInicialController.dispose();
		kmActualController.dispose();
		super.dispose();
	}

	@override
	Widget build(BuildContext context) {
		final moto = Provider.of<MotoProvider>(context).selectedMoto;

		if (moto == null) {
			return Scaffold(
				appBar: AppBar(title: const Text('Informació de la Moto')),
				body: const Center(child: Text('No hi ha cap moto seleccionada')),
			);
		}

		return Scaffold(
			appBar: AppBar(title: const Text('Informació de la Moto')),
			body: SingleChildScrollView(
				padding: const EdgeInsets.all(16.0),
				child: Column(
					crossAxisAlignment: CrossAxisAlignment.start,
					children: [
						Text('Model: ${moto.name}', style: const TextStyle(fontSize: 18)),
						Text('Autonomia: ${moto.autonomia.toStringAsFixed(1)} km'),
						Text('Diposit: ${moto.diposit.toStringAsFixed(1)} L'),
						const SizedBox(height: 20),

						TextField(
							controller: kmInicialController,
							keyboardType: TextInputType.numberWithOptions(decimal: true),
							decoration: const InputDecoration(
								labelText: 'Km quan vas omplir',
							),
						),
						const SizedBox(height: 8),
						TextField(
							controller: kmActualController,
							keyboardType: TextInputType.numberWithOptions(decimal: true),
							decoration: const InputDecoration(
								labelText: 'Km actuals',
							),
						),
						const SizedBox(height: 20),

						ElevatedButton(
							onPressed: () {
								final kmInicial = double.tryParse(kmInicialController.text);
								final kmActual = double.tryParse(kmActualController.text);
								if (kmInicial == null || kmActual == null) return;

								final consumits = kmActual - kmInicial;
								final restants = moto.autonomia - consumits;

								setState(() {
									kmRestants = restants;
								});
							},
							child: const Text('Calcular'),
						),
						const SizedBox(height: 20),

						if (kmRestants != null)
							Text(
								'Encara pots fer ${kmRestants!.clamp(0, double.infinity).toStringAsFixed(1)} km',
								style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
							),
					],
				),
			),
		);
	}
}
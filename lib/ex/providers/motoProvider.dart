import 'package:flutter/material.dart';
import '../Moto.dart';


class MotoProvider extends ChangeNotifier {
	final List<Moto> motos = [
		Moto(name: 'Honda PCX 125', fuelTankLiters: 8.0, consumptionL100: 2.1),
		Moto(name: 'Yamaha NMAX 125', fuelTankLiters: 7.1, consumptionL100: 2.2),
		Moto(name: 'Kymco Agility City 125', fuelTankLiters: 7.0, consumptionL100: 2.5),
		Moto(name: 'Piaggio Liberty 125', fuelTankLiters: 6.0, consumptionL100: 2.3),
		Moto(name: 'Sym Symphony 125', fuelTankLiters: 5.5, consumptionL100: 2.4),
		Moto(name: 'Vespa Primavera 125', fuelTankLiters: 8.0, consumptionL100: 2.8),
		Moto(name: 'Kawasaki J125', fuelTankLiters: 11.0, consumptionL100: 3.5),
		Moto(name: 'Peugeot Pulsion 125', fuelTankLiters: 12.0, consumptionL100: 3.0),
	];


	Moto? selectedMoto;


	void selectMoto(Moto moto) {
		selectedMoto = moto;
		notifyListeners();
	}
}
class Moto {
	final String name;
	final double fuelTankLiters; // Depósito en litros
	final double consumptionL100; // Consumo en Litros por 100km

	Moto({
		required this.name,
		required this.fuelTankLiters,
		required this.consumptionL100,
	});

	// Calculo autonomia restante
	double get autonomia => (fuelTankLiters * 100) / consumptionL100;

	double get diposit => fuelTankLiters;
}
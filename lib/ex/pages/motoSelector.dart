import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/motoProvider.dart';
import '../Moto.dart';
import 'motoInfo.dart';


class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MotoProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Selecció de Moto')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButton<Moto>(
              hint: const Text('Selecciona una moto'),
              value: provider.selectedMoto,
              items: provider.motos.map((moto) {
                return DropdownMenuItem(
                  value: moto,
                  child: Text(moto.name),
                );
              }).toList(),
              onChanged: (value) {
                if (value != null) provider.selectMoto(value);
              },
            ),
            const SizedBox(height: 20),
            Text('${provider.selectedMoto?.name} seleccionada', style: const TextStyle(fontSize: 18)),
            ElevatedButton(
              onPressed: provider.selectedMoto == null
                  ? null
                  : () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const SecondPage()),
                      );
                    },
              child: const Text('Continuar'),
            ),
          ],
        ),
      ),
    );
  }
}
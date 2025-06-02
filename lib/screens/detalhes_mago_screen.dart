import 'package:flutter/material.dart';
import 'package:seu_projeto/models/mago.dart';

class DetalhesMagoScreen extends StatelessWidget {
  final Mago mago;

  const DetalhesMagoScreen({super.key, required this.mago});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mago.nome),
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: mago.feiticos.length,
        itemBuilder: (context, index) {
          final feitico = mago.feiticos[index];
          return Card(
            elevation: 2,
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    feitico.nome,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(feitico.descricao),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Chip(
                      label: Text(
                        'Elemento: ${feitico.elemento}',
                        style: const TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Colors.deepPurple.shade300,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

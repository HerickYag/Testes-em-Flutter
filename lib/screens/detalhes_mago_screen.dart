import 'package:flutter/material.dart';
import 'package:seu_projeto/models/mago.dart';
import 'package:seu_projeto/widgets/feitico_card.dart';

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
          return FeiticoCard(feitico: feitico);
        },
      ),
    );
  }
}

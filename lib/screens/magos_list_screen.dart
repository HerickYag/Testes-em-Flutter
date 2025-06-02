import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:seu_projeto/data/magos_data.dart';
import 'package:seu_projeto/models/mago.dart';
import 'package:seu_projeto/screens/detalhes_mago_screen.dart';

class MagosListScreen extends StatefulWidget {
  const MagosListScreen({super.key});

  @override
  State<MagosListScreen> createState() => _MagosListScreenState();
}

class _MagosListScreenState extends State<MagosListScreen> {
  late List<Mago> _magos;

  @override
  void initState() {
    super.initState();
    _loadMagos();
  }

  void _loadMagos() {
    // Decodifica a string JSON para um Map [cite: 26]
    final Map<String, dynamic> jsonData = jsonDecode(magosJsonData);
    // Extrai a lista de magos do Map
    final List<dynamic> magosListJson = jsonData['magos'];
    // Converte a lista JSON em uma lista de objetos Mago
    setState(() {
      _magos = magosListJson.map((json) => Mago.fromJson(json)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Magos'),
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView.builder(
        itemCount: _magos.length,
        itemBuilder: (context, index) {
          final mago = _magos[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.deepPurple.shade100,
                child: const Icon(Icons.person, color: Colors.deepPurple),
              ),
              title: Text(mago.nome, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('${mago.idade} anos'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetalhesMagoScreen(mago: mago),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

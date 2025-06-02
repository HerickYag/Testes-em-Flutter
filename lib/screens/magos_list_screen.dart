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
  late List<Mago> _magos = [];

  @override
  void initState() {
    super.initState();
    _loadMagos();
  }

  void _loadMagos() {
    try {
      final Map<String, dynamic> jsonData = jsonDecode(magosJsonData);
      final List<dynamic>? magosListJson = jsonData['magos'] as List<dynamic>?; // Added type cast and nullable
      if (magosListJson == null) {
        // Handle case where 'magos' key is missing or not a list
        print('Error: "magos" key not found or not a list in JSON data.');
        _magos = []; // Initialize with empty list or handle error appropriately
        return;
      }
      setState(() {
        _magos = magosListJson.map((json) => Mago.fromJson(json as Map<String, dynamic>)).toList(); // Added type cast for json
      });
    } catch (e) {
      print('Error decoding JSON or processing mage data: $e');
      // Handle error, e.g., by setting _magos to an empty list or showing an error message
      setState(() {
        _magos = [];
      });
    }
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
            elevation: 3,
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.deepPurple.shade100,
                child: const Icon(Icons.person, color: Colors.deepPurple),
              ),
              title: Text(
                mago.nome,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('Idade: ${mago.idade}'),
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

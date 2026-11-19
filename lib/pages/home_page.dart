import 'package:flutter/material.dart';
import 'login_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Accueil'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Se déconnecter',
            onPressed: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const LoginPage()),
            ),
          ),
        ],
      ),
      body: const Center(child: Text('Bienvenue ! Le CV arrive à l\'étape 3.')),
    );
  }
}
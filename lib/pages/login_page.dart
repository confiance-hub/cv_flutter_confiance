import 'package:flutter/material.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Identifiants de démonstration (modifie-les si tu veux)
  static const String _identifiantValide = 'confiance';
  static const String _motDePasseValide = '1234';

  final _formKey = GlobalKey<FormState>();
  final _identifiantCtrl = TextEditingController();
  final _motDePasseCtrl = TextEditingController();
  bool _masquerMotDePasse = true;

  @override
  void dispose() {
    _identifiantCtrl.dispose();
    _motDePasseCtrl.dispose();
    super.dispose();
  }

  void _seConnecter() {
    if (!_formKey.currentState!.validate()) return;

    if (_identifiantCtrl.text.trim() == _identifiantValide &&
        _motDePasseCtrl.text == _motDePasseValide) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomePage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Identifiant ou mot de passe incorrect')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.account_circle,
                      size: 96, color: Theme.of(context).colorScheme.primary),
                  const SizedBox(height: 16),
                  Text('Connexion',
                      style: Theme.of(context).textTheme.headlineMedium),
                  const SizedBox(height: 32),
                  TextFormField(
                    controller: _identifiantCtrl,
                    decoration: const InputDecoration(
                      labelText: 'Identifiant',
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(),
                    ),
                    validator: (v) => (v == null || v.trim().isEmpty)
                        ? 'Saisis ton identifiant'
                        : null,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _motDePasseCtrl,
                    obscureText: _masquerMotDePasse,
                    decoration: InputDecoration(
                      labelText: 'Mot de passe',
                      prefixIcon: const Icon(Icons.lock),
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(_masquerMotDePasse
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () => setState(
                            () => _masquerMotDePasse = !_masquerMotDePasse),
                      ),
                    ),
                    validator: (v) => (v == null || v.isEmpty)
                        ? 'Saisis ton mot de passe'
                        : null,
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: _seConnecter,
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 14),
                        child: Text('Se connecter'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
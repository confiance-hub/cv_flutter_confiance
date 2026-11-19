import 'package:flutter/material.dart';

import 'login_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

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
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // ----- En-tête : photo, nom, titre -----
          Center(
            child: ClipOval(
              child: Image.asset(
                'assets/images/profil.jpg',
                width: 140,
                height: 140,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  width: 140,
                  height: 140,
                  color: theme.colorScheme.primaryContainer,
                  child: const Icon(Icons.person, size: 80),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Confiance', // TODO : ajoute ton nom de famille
            textAlign: TextAlign.center,
            style: theme.textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Étudiant en science informatique',
            textAlign: TextAlign.center,
            style: theme.textTheme.titleMedium?.copyWith(
              color: theme.colorScheme.primary,
            ),
          ),

          // ----- Formation -----
          const _Section(
            titre: 'Formation',
            icone: Icons.school,
            enfants: [
              _Element(
                titre: 'Science informatique',
                details: 'ISIG\nEn cours', // à confirmer
              ),
              _Element(
                titre: 'Diplôme d\'État',
                details: 'Collège Lwanga\n2021 - 2022',
              ),
              _Element(
                titre: 'Certificat d\'études primaires',
                details: 'EP Kitalaga\n2015 - 2016',
              ),
            ],
          ),

          // ----- Expériences -----
          const _Section(
            titre: 'Expériences',
            icone: Icons.work,
            enfants: [
              _Element(
                titre: 'Technicien en science informatique',
                details: 'Programmation web\nPériode à compléter',
              ),
              _Element(
                titre: 'Projet : application mobile CV',
                details: 'Flutter / Dart, GitHub\n2026',
              ),
            ],
          ),

          // ----- Compétences techniques -----
          const _Section(
            titre: 'Compétences techniques',
            icone: Icons.code,
            enfants: [
              _Puces(
                valeurs: [
                  'Programmation web',
                  'Flutter / Dart',
                  'Git / GitHub',
                ],
              ),
            ],
          ),

          // ----- Langues -----
          const _Section(
            titre: 'Langues',
            icone: Icons.language,
            enfants: [
              _Puces(valeurs: ['Français']), // ajoute les autres langues
            ],
          ),

          // ----- Centres d'intérêt -----
          const _Section(
            titre: 'Centres d\'intérêt',
            icone: Icons.favorite,
            enfants: [
              _Puces(valeurs: ['Informatique', 'Programmation']), // à compléter
            ],
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

/// Titre de section avec une icône
class _Section extends StatelessWidget {
  final String titre;
  final IconData icone;
  final List<Widget> enfants;

  const _Section({
    required this.titre,
    required this.icone,
    required this.enfants,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icone, color: theme.colorScheme.primary),
              const SizedBox(width: 8),
              Text(titre, style: theme.textTheme.titleLarge),
            ],
          ),
          const Divider(),
          ...enfants,
        ],
      ),
    );
  }
}

/// Une ligne de formation ou d'expérience
class _Element extends StatelessWidget {
  final String titre;
  final String details;

  const _Element({required this.titre, required this.details});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(titre, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(details),
      ),
    );
  }
}

/// Liste de petites pastilles (compétences, langues, intérêts)
class _Puces extends StatelessWidget {
  final List<String> valeurs;

  const _Puces({required this.valeurs});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: valeurs.map((v) => Chip(label: Text(v))).toList(),
    );
  }
}

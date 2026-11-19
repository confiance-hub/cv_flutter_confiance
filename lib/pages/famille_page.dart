import 'package:flutter/material.dart';

class MembreFamille {
  final String nom;
  final String lien;
  final String profession;
  final String? photo; // chemin d'une image dans assets, ou null

  const MembreFamille({
    required this.nom,
    required this.lien,
    required this.profession,
    this.photo,
  });
}

class FamillePage extends StatelessWidget {
  const FamillePage({super.key});

  // Remplace ces exemples par les vrais membres de ta famille
  static const List<MembreFamille> membres = [
    MembreFamille(
      nom: 'MWANCHALE JOSEPH',
      lien: 'Père',
      profession: 'COMMERCANT',
    ),
    MembreFamille(
      nom: 'JEANETTE MWINJA',
      lien: 'Mère',
      profession: 'TOUT TERRAIN',
    ),
    MembreFamille(nom: 'JEAN-PAUL BARAKA', lien: 'Frère', profession: 'M23'),
    MembreFamille(nom: 'TUNDA FURAHA', lien: 'Sœur', profession: 'COMMERCANTE'),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Ma famille')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: membres.length,
        itemBuilder: (context, index) {
          final m = membres[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 36,
                    backgroundColor: theme.colorScheme.primaryContainer,
                    backgroundImage: m.photo != null
                        ? AssetImage(m.photo!)
                        : null,
                    child: m.photo == null
                        ? Text(
                            m.nom.isNotEmpty ? m.nom[0].toUpperCase() : '?',
                            style: theme.textTheme.headlineSmall,
                          )
                        : null,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          m.nom,
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text('Lien : ${m.lien}'),
                        Text('Profession : ${m.profession}'),
                      ],
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

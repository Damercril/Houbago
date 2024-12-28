import 'package:flutter/material.dart';
import 'package:houbago_2/navigation/app_routes.dart';
import 'package:houbago_2/theme/houbago_theme.dart';
import 'package:houbago_2/widgets/bottom_nav_bar.dart';

class RegisterMotoScreen extends StatefulWidget {
  const RegisterMotoScreen({Key? key}) : super(key: key);

  @override
  State<RegisterMotoScreen> createState() => _RegisterMotoScreenState();
}

class _RegisterMotoScreenState extends State<RegisterMotoScreen> {
  final int _currentIndex = 2; // Index pour la moto

  void _onNavBarTap(int index) {
    if (index == _currentIndex) return;
    
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, AppRoutes.home);
        break;
      case 1:
        Navigator.pushReplacementNamed(context, AppRoutes.registerCar);
        break;
      case 2:
        // Déjà sur l'écran moto
        break;
      case 3:
        // Navigation vers l'écran des équipes (à implémenter)
        break;
      case 4:
        // Navigation vers l'écran du compte (à implémenter)
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Center(
              child: Icon(
                Icons.motorcycle,
                size: 80,
                color: Colors.grey[400],
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Inscrire une moto',
              style: HoubagoTheme.displaySmall,
            ),
            const SizedBox(height: 32),
            _buildDocumentInput(
              'Permis',
              '(prendre une photo)',
              onTap: () {
                // Ajouter la logique pour prendre une photo du permis
              },
            ),
            _buildDocumentInput(
              'Carte grise',
              '(prendre une photo)',
              onTap: () {
                // Ajouter la logique pour prendre une photo de la carte grise
              },
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Numéro de téléphone (Whatsapp)',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text('Notification'),
            ),
            const Spacer(),
            BottomNavBar(
              currentIndex: _currentIndex,
              onTap: _onNavBarTap,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDocumentInput(String title, String subtitle, {required VoidCallback onTap}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        elevation: 1,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: HoubagoTheme.bodyLarge,
                      ),
                      Text(
                        subtitle,
                        style: HoubagoTheme.bodySmall.copyWith(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.camera_alt,
                  color: HoubagoTheme.darkText,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

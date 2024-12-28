import 'package:flutter/material.dart';
import 'package:houbago_2/screens/home/home_screen.dart';
import 'package:houbago_2/theme/houbago_theme.dart';

class PinScreen extends StatefulWidget {
  const PinScreen({Key? key}) : super(key: key);

  @override
  _PinScreenState createState() => _PinScreenState();
}

class _PinScreenState extends State<PinScreen> {
  String pin = '';
  final int pinLength = 5;

  void _onKeyPressed(String value) {
    if (value == '<') {
      if (pin.isNotEmpty) {
        setState(() {
          pin = pin.substring(0, pin.length - 1);
        });
      }
    } else if (pin.length < pinLength) {
      setState(() {
        pin += value;
      });
      if (pin.length == pinLength) {
        // Vérifier le PIN et naviguer vers l'écran d'accueil
        _verifyPin();
      }
    }
  }

  void _verifyPin() {
    // Ici, vous pouvez ajouter la logique de vérification du PIN
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Deconnexion', 
          style: HoubagoTheme.bodyLarge.copyWith(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 50),
          CircleAvatar(
            radius: 40,
            backgroundColor: Colors.grey[200],
            child: Icon(Icons.person, size: 40, color: Colors.grey[400]),
          ),
          const SizedBox(height: 20),
          Text(
            'Bonjour Kwamey',
            style: HoubagoTheme.displaySmall,
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              pinLength,
              (index) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                width: 15,
                height: 15,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: index < pin.length ? HoubagoTheme.primary : Colors.grey[300],
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Entrée votre code secret',
            style: HoubagoTheme.bodyMedium,
          ),
          const Spacer(),
          _buildKeypad(),
          const SizedBox(height: 20),
          TextButton(
            onPressed: () {
              // Ajouter la logique pour le code oublié
            },
            child: Text(
              "j'ai oublié mon code",
              style: HoubagoTheme.bodyMedium.copyWith(
                color: HoubagoTheme.primary,
              ),
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildKeypad() {
    const keypadButtons = [
      ['1', '2', '3'],
      ['4', '5', '6'],
      ['7', '8', '9'],
      ['', '0', '<'],
    ];

    return Column(
      children: keypadButtons.map((row) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: row.map((value) {
            return Container(
              margin: const EdgeInsets.all(8),
              width: 70,
              height: 70,
              child: value.isEmpty
                  ? const SizedBox()
                  : TextButton(
                      onPressed: () => _onKeyPressed(value),
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(35),
                        ),
                      ),
                      child: value == '<'
                          ? const Icon(Icons.backspace_outlined, color: Colors.black)
                          : Text(
                              value,
                              style: HoubagoTheme.displaySmall.copyWith(
                                color: Colors.black,
                              ),
                            ),
                    ),
            );
          }).toList(),
        );
      }).toList(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:houbago_2/navigation/app_routes.dart';
import 'package:houbago_2/theme/houbago_theme.dart';

class PinScreen extends StatefulWidget {
  const PinScreen({Key? key}) : super(key: key);

  @override
  State<PinScreen> createState() => _PinScreenState();
}

class _PinScreenState extends State<PinScreen> {
  final TextEditingController _pinController = TextEditingController();
  final int _pinLength = 4;
  String _errorMessage = '';

  @override
  void dispose() {
    _pinController.dispose();
    super.dispose();
  }

  void _onPinSubmitted() {
    if (_pinController.text.length == _pinLength) {
      // TODO: Ajouter la validation du code PIN
      Navigator.pushReplacementNamed(context, AppRoutes.home);
    } else {
      setState(() {
        _errorMessage = 'Le code PIN doit contenir $_pinLength chiffres';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.lock_outline,
                size: 80,
                color: HoubagoTheme.primary,
              ),
              const SizedBox(height: 24),
              Text(
                'Entrez votre code PIN',
                style: HoubagoTheme.displaySmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              TextField(
                controller: _pinController,
                keyboardType: TextInputType.number,
                maxLength: _pinLength,
                obscureText: true,
                textAlign: TextAlign.center,
                style: HoubagoTheme.displaySmall,
                decoration: InputDecoration(
                  counterText: '',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  errorText: _errorMessage.isNotEmpty ? _errorMessage : null,
                ),
                onChanged: (value) {
                  setState(() {
                    _errorMessage = '';
                  });
                  if (value.length == _pinLength) {
                    _onPinSubmitted();
                  }
                },
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _onPinSubmitted,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: HoubagoTheme.primary,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Valider',
                    style: HoubagoTheme.bodyLarge.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

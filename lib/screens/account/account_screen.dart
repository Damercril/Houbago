import 'package:flutter/material.dart';
import 'package:houbago_2/navigation/app_routes.dart';
import 'package:houbago_2/theme/houbago_theme.dart';
import 'package:houbago_2/widgets/bottom_nav_bar.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  int _currentIndex = 4;

  void _onNavBarTap(int index) {
    setState(() {
      _currentIndex = index;
    });
    
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, AppRoutes.home);
        break;
      case 1:
        Navigator.pushReplacementNamed(context, AppRoutes.registerCar);
        break;
      case 2:
        Navigator.pushReplacementNamed(context, AppRoutes.registerMoto);
        break;
      case 3:
        Navigator.pushReplacementNamed(context, AppRoutes.teams);
        break;
      case 4:
        // Déjà sur l'écran du compte
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            icon: const Icon(Icons.settings, color: Colors.black),
            onPressed: () {
              // TODO: Implémenter les paramètres
            },
          ),
        ),
        actions: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  icon: const Icon(Icons.notifications_outlined, color: Colors.black),
                  onPressed: () {
                    // TODO: Implémenter les notifications
                  },
                ),
              ),
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    '1',
                    style: HoubagoTheme.bodySmall.copyWith(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildHeader(),
                    _buildBalance(),
                    _buildFilters(),
                    _buildTransactionList(),
                  ],
                ),
              ),
            ),
            BottomNavBar(
              currentIndex: _currentIndex,
              onTap: _onNavBarTap,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Icon(
            Icons.account_balance_wallet,
            size: 80,
            color: Colors.grey[400],
          ),
          const SizedBox(height: 16),
          Text(
            'Mon Compte',
            style: HoubagoTheme.displayLarge,
          ),
          const SizedBox(height: 8),
          Text(
            'Gérez vos transactions',
            style: HoubagoTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildBalance() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Solde actuel',
                style: HoubagoTheme.titleMedium,
              ),
              Icon(
                Icons.visibility_off,
                color: Colors.grey[600],
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            '100.000 FCFA',
            style: HoubagoTheme.displayLarge.copyWith(
              color: HoubagoTheme.primary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Dernier dépôt: #123456',
            style: HoubagoTheme.bodyMedium,
          ),
        ],
      ),
    );
  }

  Widget _buildFilters() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          _buildFilterChip('Aujourd\'hui'),
          _buildFilterChip('Cette semaine'),
          _buildFilterChip('Ce mois'),
          _buildFilterChip('Cette année'),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      child: FilterChip(
        label: Text(label),
        onSelected: (bool selected) {
          // TODO: Implémenter le filtrage
        },
        backgroundColor: Colors.grey[100],
        selectedColor: HoubagoTheme.primary,
        labelStyle: HoubagoTheme.bodyMedium,
      ),
    );
  }

  Widget _buildTransactionList() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Transactions récentes',
            style: HoubagoTheme.titleLarge,
          ),
          const SizedBox(height: 16),
          _buildTransactionItem(
            name: 'John Doe',
            phone: '+225 0123456789',
            amount: '15.000',
            date: '28 Dec 2024',
          ),
          _buildTransactionItem(
            name: 'Jane Smith',
            phone: '+225 9876543210',
            amount: '25.000',
            date: '27 Dec 2024',
          ),
          _buildTransactionItem(
            name: 'Bob Johnson',
            phone: '+225 5555555555',
            amount: '10.000',
            date: '26 Dec 2024',
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionItem({
    required String name,
    required String phone,
    required String amount,
    required String date,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey[300],
            child: Text(
              name[0],
              style: HoubagoTheme.titleMedium.copyWith(color: Colors.black),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: HoubagoTheme.titleSmall,
                ),
                Text(
                  phone,
                  style: HoubagoTheme.bodySmall,
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '$amount FCFA',
                style: HoubagoTheme.titleSmall.copyWith(
                  color: HoubagoTheme.primary,
                ),
              ),
              Text(
                date,
                style: HoubagoTheme.bodySmall,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:houbago_2/theme/houbago_theme.dart';
import 'package:houbago_2/widgets/bottom_nav_bar.dart';

class CarTeamScreen extends StatefulWidget {
  const CarTeamScreen({Key? key}) : super(key: key);

  @override
  State<CarTeamScreen> createState() => _CarTeamScreenState();
}

class _CarTeamScreenState extends State<CarTeamScreen> {
  String _selectedFilter = 'Tout';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            _buildGraphSection(),
            _buildFilterButtons(),
            _buildTeamList(),
            const Spacer(),
            BottomNavBar(
              currentIndex: 3,
              onTap: (index) => Navigator.pop(context),
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
          Row(
            children: [
              Icon(
                Icons.group,
                size: 30,
                color: Colors.grey[400],
              ),
              const SizedBox(width: 8),
              Icon(
                Icons.local_shipping,
                size: 30,
                color: Colors.grey[400],
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'Équipe voiture',
            style: HoubagoTheme.displaySmall,
          ),
        ],
      ),
    );
  }

  Widget _buildGraphSection() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Graphisme',
            style: HoubagoTheme.bodyLarge.copyWith(color: Colors.grey),
          ),
          const SizedBox(height: 50), // Espace pour le futur graphique
        ],
      ),
    );
  }

  Widget _buildFilterButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildFilterButton('Tout'),
          _buildFilterButton('Actifs'),
          _buildFilterButton('Non actifs'),
        ],
      ),
    );
  }

  Widget _buildFilterButton(String text) {
    final isSelected = _selectedFilter == text;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedFilter = text;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.black : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.black),
        ),
        child: Text(
          text,
          style: HoubagoTheme.bodyMedium.copyWith(
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _buildTeamList() {
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 2,
        itemBuilder: (context, index) {
          return _buildTeamMember();
        },
      ),
    );
  }

  Widget _buildTeamMember() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.grey[200],
            child: const Icon(Icons.person, color: Colors.grey),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'TEKOUA Mobio Nathanael Landry',
                  style: HoubagoTheme.bodyMedium,
                ),
                Text(
                  '+225070885726',
                  style: HoubagoTheme.bodySmall.copyWith(color: Colors.grey),
                ),
                Text(
                  '23 décembre 2024 à 18:21',
                  style: HoubagoTheme.bodySmall.copyWith(color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

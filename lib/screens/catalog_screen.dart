import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../widgets/equipment_card.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> equipmentList = [
      {'name': 'Digital Multimeter Pro', 'tag': 'SN-2026-001'},
      {'name': 'Oscilloscope 100MHz', 'tag': 'SN-2026-002'},
      {'name': 'Soldering Station Digital', 'tag': 'SN-2026-003'},
      {'name': 'Bench Power Supply', 'tag': 'SN-2026-004'},
      {'name': 'Cordless Rotary Tool', 'tag': 'SN-2026-005'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Workshop Equipment Catalog'),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20.0),
            margin: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  AppColors.primaryGradientStart,
                  AppColors.primaryGradientEnd,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16.0),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primaryGradientEnd.withValues(alpha: 0.35),
                  blurRadius: 14,
                  offset: const Offset(0, 6),
                ),
              ],
              border: Border.all(color: Colors.white24, width: 1.5),
            ),
            child: const Text(
              "Workshop Status: 85% Operational",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: equipmentList.length,
              itemBuilder: (context, index) {
                final item = equipmentList[index];
                return EquipmentCard(
                  equipmentName: item['name']!,
                  serialTag: item['tag']!,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => DetailsScreen(equipmentItem: item),
  ),
);
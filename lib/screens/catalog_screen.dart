import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../widgets/equipment_card.dart';
import 'details_screen.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> equipmentList = [
      {'name': 'Digital Multimeter Pro', 'tag': 'SN-2026-001', 'rate': 15.0},
      {'name': 'Oscilloscope 100MHz', 'tag': 'SN-2026-002', 'rate': 35.0},
      {'name': 'Soldering Station Digital', 'tag': 'SN-2026-003', 'rate': 12.0},
      {'name': 'Bench Power Supply', 'tag': 'SN-2026-004', 'rate': 20.0},
      {'name': 'Cordless Rotary Tool', 'tag': 'SN-2026-005', 'rate': 10.0},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Workshop Equipment Catalog'),
        backgroundColor: AppColors.primaryGradientStart,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          // Status Banner
          Container(
            width: double.infinity,
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

          // Equipment List
          Expanded(
            child: ListView.builder(
              itemCount: equipmentList.length,
              itemBuilder: (context, index) {
                final item = equipmentList[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsScreen(
                          equipmentName: item['name'],
                          serialTag: item['tag'],
                          ratePerHour: item['rate'],
                        ),
                      ),
                    );
                  },
                  child: EquipmentCard(
                    equipmentName: item['name'],
                    serialTag: item['tag'],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
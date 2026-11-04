
import 'package:flutter/material.dart';
import '../models/equipment_item.dart';
import '../utils/app_colors.dart';
import '../widgets/equipment_card.dart';
import 'detail_screen.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<EquipmentItem> equipmentList = [
      EquipmentItem(
        id: '1',
        name: 'Creality Ender-3 Pro 3D Printer',
        serial: 'WSS-3DP-01',
        isAvailable: true,
        ratePerHour: 12.0,
      ),
      EquipmentItem(
        id: '2',
        name: 'Epilog Zing 24 Laser Cutter',
        serial: 'WSS-LC-04',
        isAvailable: true,
        ratePerHour: 25.0,
      ),
      EquipmentItem(
        id: '3',
        name: 'Shapeoko 4 CNC Router Mill',
        serial: 'WSS-CNC-09',
        isAvailable: false,
        ratePerHour: 18.0,
      ),
      EquipmentItem(
        id: '4',
        name: 'Rigol 100MHz Digital Oscilloscope',
        serial: 'WSS-OSC-12',
        isAvailable: true,
        ratePerHour: 8.0,
      ),
      EquipmentItem(
        id: '5',
        name: 'Digital Multimeter Pro',
        serial: 'WSS-DMM-03',
        isAvailable: true,
        ratePerHour: 15.0,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Workshop Equipment Catalog'),
        backgroundColor: AppColors.primaryGradientStart,
        foregroundColor: Colors.white,
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
                  color: AppColors.primaryGradientEnd
                      .withValues(alpha: 0.35),
                  blurRadius: 14,
                  offset: const Offset(0, 6),
                ),
              ],
              border: Border.all(
                color: Colors.white24,
                width: 1.5,
              ),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.build_circle,
                  color: Colors.white,
                  size: 24,
                ),
                SizedBox(width: 10),
                Text(
                  "Workshop Status: 85% Operational",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: equipmentList.length,
              itemBuilder: (context, index) {
                final item = equipmentList[index];

                return InkWell(
                  onTap: () {
                    if (!item.isAvailable) return;

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsScreen(
                          item: item,
                        ),
                      ),
                    );
                  },
                  child: EquipmentCard(item: item),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

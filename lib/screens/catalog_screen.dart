import 'package:flutter/material.dart';
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
      body: ListView.builder(
        itemCount: equipmentList.length,
        itemBuilder: (context, index) {
          final item = equipmentList[index];
          return EquipmentCard(
            equipmentName: item['name']!,
            serialTag: item['tag']!,
          );
        },
      ),
    );
  }
}

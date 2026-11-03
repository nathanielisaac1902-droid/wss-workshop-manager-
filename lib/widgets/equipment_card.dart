import 'package:flutter/material.dart';

class EquipmentCard extends StatelessWidget {
  final String equipmentName;
  final String serialTag;

  const EquipmentCard({
    super.key,
    required this.equipmentName,
    required this.serialTag,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      margin: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            spreadRadius: 1,
            blurRadius: 3,
          ),
        ],
      ),
      child: Row(
        children: [
          const Icon(Icons.devices, color: Colors.blue),
          const SizedBox(width: 12.0),
          Expanded(
            child: Text(
              equipmentName,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
            ),
          ),
          const Spacer(),
          Text(
            serialTag,
            style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
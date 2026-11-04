import 'package:flutter/material.dart';
import '../models/equipment_item.dart';
import '../utils/app_colors.dart';

class EquipmentCard extends StatelessWidget {
  final EquipmentItem item;

  const EquipmentCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: item.isAvailable
              ? AppColors.availableGreen.withOpacity(0.4)
              : AppColors.maintenanceAmber.withOpacity(0.4),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Icon
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.precision_manufacturing, color: Colors.blue),
          ),
          const SizedBox(width: 12),

          // Name + serial + rate (Expanded prevents overflow)
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'SN: ${item.serial}  •  \$${item.ratePerHour.toStringAsFixed(2)}/hr',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),

          // Status badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: item.isAvailable
                  ? AppColors.availableGreen.withOpacity(0.15)
                  : AppColors.maintenanceAmber.withOpacity(0.15),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: item.isAvailable
                    ? AppColors.availableGreen.withOpacity(0.4)
                    : AppColors.maintenanceAmber.withOpacity(0.4),
              ),
            ),
            child: Text(
              item.isAvailable ? 'Available' : 'Maintenance',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
                color: item.isAvailable
                    ? AppColors.availableGreen
                    : AppColors.maintenanceAmber,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
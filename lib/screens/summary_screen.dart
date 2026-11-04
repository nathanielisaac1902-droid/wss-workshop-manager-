import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class SummaryScreen extends StatelessWidget {
  final String equipmentName;
  final String serial;
  final int rentalHours;
  final double ratePerHour;
  final double totalPrice;

  const SummaryScreen({
    super.key,
    required this.equipmentName,
    required this.serial,
    required this.rentalHours,
    required this.ratePerHour,
    required this.totalPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout Invoice'),
        backgroundColor: AppColors.primaryGradientStart,
        foregroundColor: Colors.white,
        automaticallyImplyLeading: false, // prevents normal back button
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            const Text(
              'RESERVATION SUMMARY',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w800,
                letterSpacing: 1.1,
                color: Colors.blueAccent,
              ),
            ),
            const SizedBox(height: 20),

            // Receipt-style box
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300, style: BorderStyle.solid),
              ),
              child: Column(
                children: [
                  _buildRow('Equipment', equipmentName),
                  _buildRow('Serial', serial),
                  _buildRow('Duration', '$rentalHours hour(s)'),
                  _buildRow('Hourly Rate', '\$${ratePerHour.toStringAsFixed(2)}/hr'),
                  const Divider(height: 28),
                  _buildRow(
                    'TOTAL DUE',
                    '\$${totalPrice.toStringAsFixed(2)} SGD',
                    isTotal: true,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),
            const Text(
              'Equipment checkout verified. Stack will reset on complete.',
              style: TextStyle(fontSize: 12, color: Colors.grey),
              textAlign: TextAlign.center,
            ),

            const Spacer(),

            // Final action button
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.availableGreen,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  // Required by the lab: pop all the way back to Catalog
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
                child: const Text(
                  'Order Finalized & Return to Home',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRow(String label, String value, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: isTotal ? 16 : 14,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.w500,
              color: isTotal ? Colors.black : Colors.grey.shade700,
            ),
          ),
          Flexible(
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: isTotal ? 18 : 14,
                fontWeight: FontWeight.bold,
                color: isTotal ? AppColors.availableGreen : Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class SummaryScreen extends StatelessWidget {
  final String equipmentName;
  final int rentalHours;
  final double totalPrice;

  const SummaryScreen({
    super.key,
    required this.equipmentName,
    required this.rentalHours,
    required this.totalPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout Invoice'),
        backgroundColor: AppColors.primaryGradientStart,
        foregroundColor: Colors.white,
        automaticallyImplyLeading: false, // prevent normal back
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Order Summary',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            _buildRow('Equipment', equipmentName),
            _buildRow('Duration', '$rentalHours hour(s)'),
            const Divider(height: 32),
            _buildRow(
              'Total Cost',
              '\$${totalPrice.toStringAsFixed(2)}',
              isTotal: true,
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.availableGreen,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  // Cleanly return to Catalog (first route)
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                child: const Text(
                  'Order Finalized',
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
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: isTotal ? 18 : 16,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: isTotal ? 20 : 16,
              fontWeight: FontWeight.bold,
              color: isTotal ? AppColors.primaryGradientStart : null,
            ),
          ),
        ],
      ),
    );
  }
}
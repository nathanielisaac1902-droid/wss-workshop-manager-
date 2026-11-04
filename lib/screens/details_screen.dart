import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import 'summary_screen.dart';

class DetailsScreen extends StatefulWidget {
  final String equipmentName;
  final String serialTag;
  final double ratePerHour;

  const DetailsScreen({
    super.key,
    required this.equipmentName,
    required this.serialTag,
    required this.ratePerHour,
  });

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int rentalHours = 1;
  double throttleValue = 0.0;
  bool isSafetyChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.equipmentName),
        backgroundColor: AppColors.primaryGradientStart,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Serial: ${widget.serialTag}',
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 24),

            // 1. Rental Duration Stepper (1–8 hours)
            const Text(
              'Rental Duration (Hours)',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.remove_circle_outline),
                  onPressed: rentalHours > 1
                      ? () => setState(() => rentalHours--)
                      : null,
                ),
                Text(
                  '$rentalHours hrs',
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: const Icon(Icons.add_circle_outline),
                  onPressed: rentalHours < 8
                      ? () => setState(() => rentalHours++)
                      : null,
                ),
              ],
            ),
            const SizedBox(height: 24),

            // 2. Power Throttle Slider
            Text(
              'Power Throttle: ${throttleValue.toStringAsFixed(0)}%',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Slider(
              value: throttleValue,
              min: 0,
              max: 100,
              divisions: 20,
              label: '${throttleValue.toStringAsFixed(0)}%',
              activeColor: AppColors.primaryGradientEnd,
              onChanged: (value) {
                setState(() => throttleValue = value);
              },
            ),
            const SizedBox(height: 24),

            // 3. Safety Switch
            SwitchListTile(
              title: const Text('Safety Induction Completed'),
              value: isSafetyChecked,
              activeColor: AppColors.availableGreen,
              onChanged: (value) {
                setState(() => isSafetyChecked = value);
              },
            ),
            const Spacer(),

            // Proceed Button (disabled until safety is checked)
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryGradientStart,
                  foregroundColor: Colors.white,
                  disabledBackgroundColor: Colors.grey.shade400,
                ),
                onPressed: isSafetyChecked
                    ? () {
                  final total = rentalHours * widget.ratePerHour;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SummaryScreen(
                        equipmentName: widget.equipmentName,
                        serial: widget.serialTag,
                        rentalHours: rentalHours,
                        ratePerHour: widget.ratePerHour,
                        totalPrice: total,
                      ),
                    ),
                  );
                }
                    : null,
                child: const Text(
                  'Proceed to Checkout',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

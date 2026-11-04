import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int rentalHours = 1;
  double throttleValue = 0.0;
  bool isCheckoutEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Equipment Detail Controls'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Rental Stepper (Bounds: 1 to 8 hrs)
            const Text('Rental Duration (Hours):', style: TextStyle(fontWeight: FontWeight.bold)),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: rentalHours > 1
                      ? () => setState(() => rentalHours--)
                      : null,
                ),
                Text('$rentalHours hrs', style: const TextStyle(fontSize: 18)),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: rentalHours < 8
                      ? () => setState(() => rentalHours++)
                      : null,
                ),
              ],
            ),
            const SizedBox(height: 20),

            // 2. Power Throttle Slider (0% to 100%)
            Text('Power Throttle: ${throttleValue.toStringAsFixed(0)}%', style: const TextStyle(fontWeight: FontWeight.bold)),
            Slider(
              value: throttleValue,
              min: 0,
              max: 100,
              divisions: 10,
              label: '${throttleValue.toStringAsFixed(0)}%',
              onChanged: (value) {
                setState(() {
                  throttleValue = value;
                });
              },
            ),
            const SizedBox(height: 20),

            // 3. Safety Induction Switch
            SwitchListTile(
              title: const Text('Safety Induction Checked'),
              value: isCheckoutEnabled,
              onChanged: (value) {
                setState(() {
                  isCheckoutEnabled = value;
                });
              },
            ),
            const SizedBox(height: 30),

            // Proceed to Checkout Button (Disabled until switch is true)
            Center(
              child: ElevatedButton(
                onPressed: isCheckoutEnabled
                    ? () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Checkout Proceeded Successfully!')),
                  );
                }
                    : null, // Disables button when false
                child: const Text('Proceed to Checkout'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
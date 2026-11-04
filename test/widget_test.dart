import 'package:flutter_test/flutter_test.dart';
import 'package:workshop_equipment_manager/main.dart';

void main() {
  testWidgets('Workshop Equipment Manager loads successfully', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    // Replace WorkshopEquipmentManager with your exact root class name from main.dart if different.
    await tester.pumpWidget(const WorkshopEquipmentManager());

    // Verify that the root widget is present in the widget tree.
    expect(find.byType(WorkshopEquipmentManager), findsOneWidget);
  });
}
class EquipmentItem {
  final String id;
  final String name;
  final String model;
  final bool isAvailable;
  final double ratePerHour;

  EquipmentItem({
    required this.id,
    required this.name,
    required this.model,
    required this.isAvailable,
    required this.ratePerHour,
  });
}
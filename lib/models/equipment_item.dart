class EquipmentItem {
  final String id;
  final String name;
  final String serial;          // or keep "model" if you prefer
  final bool isAvailable;
  final double ratePerHour;

  const EquipmentItem({
    required this.id,
    required this.name,
    required this.serial,
    required this.isAvailable,
    required this.ratePerHour,
  });
}
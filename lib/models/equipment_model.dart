class Equipment {
  final int id;
  final String EquipmentName;
  final String EquipmentDescription;
  final String EquipmentImageUrl;
  final int noOfMinutes;
  final double NumberOfCalory;
  final bool handOvered;

  Equipment({
    required this.id,
    required this.EquipmentName,
    required this.EquipmentDescription,
    required this.EquipmentImageUrl,
    required this.noOfMinutes,
    required this.NumberOfCalory,
    required this.handOvered,
  });
}

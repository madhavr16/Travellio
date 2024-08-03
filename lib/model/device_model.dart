class DeviceModel {
  String name;
  String iconPath;
  String offPath;
  String bgPath;
  bool isActive;

  DeviceModel({
    required this.name, 
    required this.iconPath, 
    required this.offPath,
    required this.bgPath,
    this.isActive = false
  });
}
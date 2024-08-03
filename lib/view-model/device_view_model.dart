import 'package:flutter/material.dart';
import 'package:travellio/model/device_model.dart';

class DeviceViewModel extends ChangeNotifier {
  final List<DeviceModel> _devices = [
    DeviceModel(
        name: 'Lights',
        iconPath: 'assets/images/light_on.png',
        offPath: 'assets/images/light_off.png',
        bgPath: 'assets/images/lamp_bg.png'),
    DeviceModel(
        name: 'Smart TV',
        iconPath: 'assets/images/tv.png',
        offPath: 'assets/images/tv_off.png',
        bgPath: 'assets/images/tv_bg.png'),
    DeviceModel(
        name: 'Speaker',
        iconPath: 'assets/images/speaker_on.png',
        offPath: 'assets/images/speaker_off.png',
        bgPath: 'assets/images/speaker_bg.png'),
    // Add more devices as needed
  ];

  int _selectedDeviceIndex = 0;

  List<DeviceModel> get devices => _devices;

  int get selectedDeviceIndex => _selectedDeviceIndex;

  DeviceModel get selectedDevice => _devices[_selectedDeviceIndex];

  void toggleDevice(int index) {
    _selectedDeviceIndex = index;
    _devices[index].isActive = !_devices[index].isActive;
    notifyListeners();
  }
}

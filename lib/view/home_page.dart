import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travellio/model/device_model.dart';
import 'package:travellio/view-model/device_view_model.dart';
import 'package:vertical_slider/vertical_slider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool showSlider = false;
  double newValue = 0;
  @override
  Widget build(BuildContext context) {
    final deviceViewModel = Provider.of<DeviceViewModel>(context);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 164, 180, 169),
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: Colors.transparent,
      //   actions: [
      //     IconButton(
      //       icon: const Icon(Icons.settings, color: Colors.white),
      //       onPressed: () {},
      //     ),
      //   ],
      // ),
      body: Stack(
        children: [
          SizedBox(
            height: 600,
            // height: double.maxFinite,
            width: 1,
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(deviceViewModel.selectedDevice.bgPath),
              ],
            ),
          ),

          // Container(
          //   padding: const EdgeInsets.only(left: 200),
          //   decoration: const BoxDecoration(
          //     image: DecorationImage(
          //       image: AssetImage('assets/images/lamp_bg.png'),
          //       fit: BoxFit.cover,
          //       alignment: Alignment.centerRight, // Align to the right
          //     ),
          //     border: Border(
          //       bottom: BorderSide(
          //         color: Colors.black,
          //         width: 2,
          //       ),
          //     ),
          //   ),
          // ),

          Padding(
            padding: const EdgeInsets.only(left: 25.0, right: 25, top: 100),
            child: Column(
              children: [
                const Text(
                  'Office',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  '6 devices active',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    //dfd
                    setState(() {
                      showSlider = !showSlider;
                    });
                  },
                  child: Container(
                    height: 40,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.thermostat, color: Colors.white),
                        const SizedBox(width: 5),
                        Text(
                          "${newValue.toStringAsFixed(0)}°C",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 200),
                SizedBox(
                    height: 200,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: deviceViewModel.devices.length,
                      itemBuilder: (context, index) {
                        final device = deviceViewModel.devices[index];
                        return GestureDetector(
                          onTap: () {
                            deviceViewModel.toggleDevice(index);
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 20),
                            width: 150,
                            decoration: BoxDecoration(
                              color: device.isActive
                                  ? Colors.white
                                  : Colors.white.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 10,
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // Image.asset(
                                //   device.isActive
                                //       ? device.iconPath
                                //       : device.offPath,
                                //   height: 50,
                                //   width: 20,
                                // ),
                                Image(
                                    image: AssetImage(device.isActive
                                        ? device.iconPath
                                        : device.offPath),
                                    height: 120,
                                    width: 90),
                                const SizedBox(height: 10),
                                Text(
                                  device.name,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    )),
                const Spacer(),
                FloatingActionButton(
                  onPressed: () {},
                  backgroundColor: Colors.white,
                  child: const Icon(Icons.add, color: Colors.black),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),

          showSlider
              ? Positioned(
                  left: MediaQuery.of(context).size.width / 2 * 0.13,
                  top: MediaQuery.of(context).size.height / 2 - 100,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 56, 54, 54),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    height: 70,
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Slider(
                        value: newValue,
                        max: 50,
                        divisions: 50,
                        onChanged: (value) {
                          setState(() {
                            newValue = value;
                          });
                        }),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}

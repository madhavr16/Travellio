import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travellio/view-model/device_view_model.dart';
import 'package:travellio/view/home_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => DeviceViewModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}
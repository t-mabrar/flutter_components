import 'package:flutter/material.dart';
import 'package:flutter_components/flutter_components.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(body: const MyHomePage()),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 50.0),
          AppButton(
            // buttonFullWidth: true,
            title: "Press",
            onPressed: () {},
            color: Colors.black,
            // isExpanded: true,
            borderRadius: 50.0,
            prefix: Icon(Icons.lock, color: Colors.white),
          ),
        ],
      ),
    );
  }
}

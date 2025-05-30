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
            title: "Button",
            onPressed: () {},
            padding: EdgeInsets.all(30.0),
            shape: BoxShape.circle,
            // borderRadius: BorderRadius.circular(10.0),
            // child: Icon(Icons.update),
          ),
        ],
      ),
    );
  }
}

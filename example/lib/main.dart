import 'package:flutter/material.dart';
import 'package:flutter_components/flutter_components.dart';
import 'package:group_dropdown_button/group_dropdown_button.dart';

void main() {
  FCAPIClient(baseUrl: '');
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
          FCButton(
            title: "Button",
            onPressed: () {},
            padding: EdgeInsets.all(30.0),
            shape: BoxShape.circle,
            // borderRadius: BorderRadius.circular(10.0),
            // child: Icon(Icons.update),
          ),
          // AppDropDown(
          //   items: [
          //     DropdownButtonItem(title: "Option 1", key: '1'),
          //     DropdownButtonItem(title: "Option 2", key: '2'),
          //     DropdownButtonItem(title: "Option 3", key: '3'),
          //     DropdownButtonItem(title: "Option 4", key: '4'),
          //   ],
          // ),
          // GroupDropdownButton(items: [], onSelect: (_){}),
        ],
      ),
    );
  }
}

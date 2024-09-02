import 'package:flutter/material.dart';
import 'package:flutter_accessibility_showcase/semantics_live_region_page.dart';

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
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            ListTile(title: const Text("Semantics LiveRegion"),onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const SemanticsLiveRegionPage()));
            },),
          ],
        ),
      ));
  }
}

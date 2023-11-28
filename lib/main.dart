import 'dart:math';

import 'package:flutter/material.dart';
import 'package:random_japan_city/data.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var generatedColor = Random().nextInt(Colors.primaries.length);
    return MaterialApp(
      title: 'Random City in Japan',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Colors.primaries[generatedColor]),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Random City in Japan'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String city = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (city != '') ...[
              const Text(
                'See you in',
              ),
              TextButton(
                child: Text(city,
                    style: Theme.of(context).textTheme.headlineMedium),
                onPressed: () {
                  var url = 'https://zh.wikipedia.org/wiki/$city';
                  launchUrl(Uri.parse(url));
                },
              )
            ] else
              const Text(
                'Press the button to get a random city in Japan',
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getRandomCity,
        tooltip: 'Random City',
        child: const Icon(Icons.airplanemode_active),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _getRandomCity() {
    setState(() {
      city = cities[Random().nextInt(cities.length)];
    });
  }
}

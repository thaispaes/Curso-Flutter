import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

/// Main application widget
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Contador';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const HomePage(),
      ),
    );
  }
}

/// Creating my column
class HomePage extends StatelessWidget {
  const HomePage({Key ? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Colors.black,
        body: Column(
            children: [
                Text(
                  'Pode Entrar',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                    '0',
                  style: TextStyle(
                    fontSize: 100,
                    color: Colors.white,
                  ),
                )
            ],
        )
    );
  }
}
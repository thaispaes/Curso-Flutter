import 'package:flutter/material.dart';
import 'package:flutter_course/methods.dart';

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
    return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          padding: const EdgeInsets.all(32),
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Pode Entrar',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Text(
                '0',
                style: TextStyle(
                  fontSize: 100,
                  color: Colors.white,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.yellow,
                        fixedSize: const Size(100, 100),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        )
                    ),
                    onPressed: decrement,
                    child: const Text('Saiu',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const SizedBox(width: 64),
                  TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.yellow,
                        fixedSize: const Size(100, 100),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        )
                    ),
                    onPressed: increment,
                    child: const Text('Entrou',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ], // Column Children
              )
            ], // Column Children
          ),
        )
    );
  }
}



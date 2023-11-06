import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

/// Main application widget
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home:  HomePage(),
    );
  }
}

/// Creating my column
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int count = 0;
  bool get isEmpty => count == 0;
  bool get isFull => count == 20;

  void increment(){
      setState(() {
        count++;
      });
      print(count);
  }

  void decrement(){
    setState(() {
      count--;
    });
    print(count);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('/images/Flutter01.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(Colors.black45, BlendMode.srcOver)
            )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              isFull ? 'Lotado' : 'Pode Entrar',
              style: TextStyle(
                fontSize: 30,
                color: isFull ? Colors.red : Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(32),
              child: Text(
                '$count',
                style: TextStyle(
                  fontSize: 100,
                  color: isFull ? Colors.red : Colors.white,
                ),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Decrement
                TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: isEmpty ? Colors.yellow.withOpacity(0.2) : Colors.yellow,
                      fixedSize: const Size(100, 100),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      )
                  ),
                  onPressed: isEmpty ? null : decrement,
                  child: const Text('Saiu',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                ),
                const SizedBox(width: 64),
                //Increment
                TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: isFull ? Colors.yellow.withOpacity(0.2) : Colors.yellow,
                      fixedSize: const Size(100, 100),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      )
                  ),
                  onPressed: isFull ? null : increment,
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
      ),
    );
  }
}





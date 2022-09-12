import 'package:flutter/material.dart';
import 'package:login_page/home.dart';

class ScreenChat extends StatelessWidget {
  final String name;

  const ScreenChat({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(name),
      ),
      body: SafeArea(
        child: SizedBox(
          height: 500,
          width: 500,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Screen Two'),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(
                      MaterialPageRoute(builder: (ctx) => const ScreenHome()));
                },
                child: Text(name),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

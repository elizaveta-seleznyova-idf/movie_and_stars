import 'package:flutter/material.dart';
import 'package:share_plugin/share_plugin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final String _helloMessage = 'Hello';
  final String _nameMethod = 'Sharing Example';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment:  MainAxisAlignment.center,
            children: <Widget>[
              const Text('Press button to say hello',),
              TextButton(
                onPressed: () {
                  SharePlugin.shareMethod(_helloMessage, _nameMethod);
                },
                child: Text('Say $_helloMessage'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

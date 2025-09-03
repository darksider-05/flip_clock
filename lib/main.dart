import 'package:flip_clock/holder.dart';
import 'package:flip_clock/themes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'body.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,DeviceOrientation.portraitDown]).then((_){
    runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => Gears()),
          ChangeNotifierProvider(create: (_) => Thime()),
        ],
        child: MyApp(),
      ),
    );
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage(), debugShowCheckedModeBanner: false,);
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Clock());
  }
}

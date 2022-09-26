import 'package:doain_id/page/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // return MultiProvider(
    // providers: [
    //   ChangeNotifierProvider(
    //     create: (context) => DoaProvider(),
    //   ),
    // ],
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const HomePage(),
      },
      // ),
    );
  }
}

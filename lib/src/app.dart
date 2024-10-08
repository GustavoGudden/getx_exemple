import 'package:flutter/material.dart';
import 'package:getx_exemple/src/pages/home_page.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Getx exemple',
      home: HomePage(),
    );
  }
}

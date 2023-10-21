import 'package:flutter/material.dart';

import 'package:game/view/main_menu.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainMenu(),
    ),
  );
}

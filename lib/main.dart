import 'package:flutter/material.dart';
import 'Features/Auth/presentation/screens/login.dart';
import 'Features/Auth/presentation/screens/register.dart';
import 'Features/Posts/presentation/screens/homescreen.dart';

void main() {
  runApp(const SocialHive());
}
class SocialHive extends StatelessWidget {
  const SocialHive({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}

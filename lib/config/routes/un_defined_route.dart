import 'package:flutter/material.dart';

Route<dynamic> unDefinedRoute() {
  return MaterialPageRoute(
    builder: (_) => Scaffold(
      appBar: AppBar(title: const Text('Screen Not Found')),
      body: const Center(
        child: Text('The screen you are looking for does not exist!'),
      ),
    ),
  );
}

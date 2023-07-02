import 'package:flutter/material.dart';

class MoviesPage extends StatelessWidget {
  static const String route = '/movies';
  const MoviesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Movies page'),
    );
  }
}

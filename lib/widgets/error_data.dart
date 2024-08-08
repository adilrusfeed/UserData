import 'package:flutter/material.dart';

class ErrorDisplay extends StatelessWidget {
  const ErrorDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.error, color: Colors.red, size: 48),
            const SizedBox(height: 16),
            Text(
              'No Internet Connection!\nPlease try again',
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.red, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}

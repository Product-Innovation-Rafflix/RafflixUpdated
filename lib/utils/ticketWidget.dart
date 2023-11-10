import 'package:flutter/material.dart';

class TicketWidget extends StatelessWidget {
  final Map item;
  final bool isSelected;
  final VoidCallback onTap;

  TicketWidget({
    required this.item,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    String value = item['value'] as String;
    String key = item['key'] as String;
    String extractedNumber = key.substring(key.lastIndexOf(':') + 1).trim();

    return GestureDetector(
      onTap:
          value == 'true' ? onTap : null, // Disable onTap if value is 'false'
      child: Card(
        color: value == 'true'
            ? (isSelected ? Colors.blue : Colors.white)
            : Colors.red[400], // Color set to red if value is 'false'
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              extractedNumber,
              style: TextStyle(
                  color: value == 'true'
                      ? (isSelected ? Colors.white : Colors.black)
                      : Colors.black54),
            ),
            // Add additional fields as needed
          ],
        ),
      ),
    );
  }
}

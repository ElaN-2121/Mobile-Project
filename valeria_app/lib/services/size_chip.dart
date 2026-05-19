import 'dart:ui';
import 'package:flutter/material.dart';

class SizeChip extends StatelessWidget {
    final String label;
    const SizeChip({
        required this.label,
    });

    @override 
    Widget build(BuildContext context) {
        return Container (
            margin: const EdgeInsets.only(right: 12),
            padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 12,
            ),

            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(
                    color: Colors.grey.shade300,
                ),

                boxShadow:[
                    BoxShadow(
                        color: Colors.black.withOpacity(0.04),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                    ),
                ],
            ),
            child: Text(
                label,
                style: const TextStyle(
                    fontWeight: FontWeight.w600,
                ),
            ),
        );
    }
}
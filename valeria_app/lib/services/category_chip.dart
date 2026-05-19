import 'dart:ui';
import 'package:flutter/material.dart';

Widget categoryChip(
    {
  required String category,
  required bool isSelected,
  required VoidCallback onTap,
    }
){

    return GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            margin: const EdgeInsets.only(right: 14),
            padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 13,
            ),
            decoration: BoxDecoration(
                gradient: isSelected ? const LinearGradient( colors: [Color(0xFFE7C5A7), Color(0xFFD6A57B),]): null,
                color: isSelected? null: Colors.white.withOpacity(0.55),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: isSelected?Colors.transparent: Colors.white.withOpacity(0.4),),
                boxShadow: [
                    if (isSelected) BoxShadow(
                        color: const Color(0xFFD6A57B).withOpacity(0.35),
                        blurRadius: 16,
                        offset: const Offset(0,8),
                    ),
                ],
            ),
            child: Row(
                children: [
                    if (isSelected)
                    const Padding(
                        padding: EdgeInsets.only(right: 6),
                        child: Icon(
                            Icons.check_rounded,
                            color: Colors.white,
                            size: 16,
                        ),
                    ),
                    Text(
                        category,
                        style: TextStyle(
                            color: isSelected? Colors.white: Colors.black87,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.3,
                        ),
                    ),
                ],
            ),
        ),
    );
}
import 'dart:ui';
import 'package:flutter/material.dart';
import '../models/product.dart';
import '../services/size_chip.dart';

class ProductDetailPage extends StatefulWidget {
    final Product product;

    const ProductDetailPage({
        super.key,
        required this.product,
    });

    @override
    State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
    @override
    Widget build(BuildContext context) {
        final product = widget.product;
        final screenHeight = MediaQuery.of(context).size.height;

        return Scaffold(
            backgroundColor: Colors.black,
            body: Stack(
                children:[
                    SizedBox(
                        height: screenHeight * 0.45,
                        width: double.infinity,
                        child: Hero(
                            tag: product.id,
                            child: Image.asset(
                                product.image,
                                fit: BoxFit.cover,
                            )
                        ),
                    ),

                    Container(
                        height: screenHeight*0.45,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                    Colors.black.withOpacity(0.1),
                                    Colors.black.withOpacity(0.8),
                                ],
                            ),
                        ),
                    ),

                    SafeArea(
                        child: Padding(
                            padding: const EdgeInsets.all(18),
                            child: GestureDetector(
                                onTap: () => Navigator.pop(context),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: BackdropFilter(
                                        filter: ImageFilter.blur(
                                            sigmaX: 12,
                                            sigmaY:12,
                                        ),

                                        child: Container(
                                            padding: const EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                                color: Colors.white.withOpacity(0.12),
                                                borderRadius: BorderRadius.circular(12),
                                                border: Border.all(
                                                    color: Colors.white.withOpacity(0.2),
                                                ),
                                            ),
                                            child: const Icon(
                                                Icons.arrow_back_ios_new_rounded,
                                                color: Colors.white,
                                                size: 20,
                                            ),
                                        ),
                                    ),
                                ),
                            ),
                        ),
                    ),
                    DraggableScrollableSheet(
                        initialChildSize: 0.62,
                        minChildSize: 0.58,
                        maxChildSize: 0.95,

                        builder: (context, scrollController) {
                            return ClipRRect(
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(32),
                                    topRight: Radius.circular(32),
                                ),
                                child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                        sigmaX: 25,
                                        sigmaY: 25,
                                    ),
                                    child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white.withOpacity(0.92),
                                            borderRadius: const BorderRadius.only(
                                                topLeft: Radius.circular(32),
                                                topRight: Radius.circular(32),
                                            ),
                                        ),
                                        child: ListView(
                                            controller: scrollController,
                                            padding: const EdgeInsets.all(22),
                                            children: [
                                                Center(
                                                    child: Container(
                                                        width: 55,
                                                        height: 5,
                                                        decoration: BoxDecoration(
                                                            gradient: const LinearGradient(
                                                                colors: [
                                                                    Color(0xFFE7C8AA),
                                                                    Color(0xFFD8B08C),
                                                                ],

                                                            ),
                                                            borderRadius: BorderRadius.circular(20),
                                                        ),
                                                    ),
                                                ),

                                                const SizedBox(height:24),

                                                Row(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                        Expanded(
                                                            child: Text(
                                                                product.name,
                                                                style: const TextStyle(
                                                                    fontSize: 30,
                                                                    fontWeight: FontWeight.bold,
                                                                    height: 1.1,
                                                                    letterSpacing: -1,
                                                                ),
                                                            ),
                                                        ),

                                                        Container(
                                                            padding: const EdgeInsets.symmetric(
                                                                horizontal: 12,
                                                                vertical: 7,
                                                            ),
                                                            decoration: BoxDecoration(
                                                                color: const Color(0xFFD8B08C).withOpacity(0.11),
                                                                borderRadius:BorderRadius.circular(30),
                                                            ),

                                                            child: const Text(
                                                                "NEW",
                                                                style: TextStyle(
                                                                    color: Color(0xFFD8B08C),
                                                                    fontWeight: FontWeight.w700,
                                                                    letterSpacing:1.5,
                                                                    fontSize: 11,
                                                                ),
                                                            ),
                                                        ),
                                                    ],
                                                ),

                                                const SizedBox(height: 6),

                                                Text(
                                                    product.category,
                                                    style: TextStyle(
                                                        color: Colors.grey.shade600,
                                                        fontSize: 15,
                                                        letterSpacing: 0.5,
                                                    ),
                                                ),

                                                const SizedBox(height: 25),

                                                ClipRRect(
                                                    borderRadius: BorderRadius.circular(24), 
                                                    child: BackdropFilter(
                                                        filter: ImageFilter.blur(
                                                            sigmaX: 15,
                                                            sigmaY: 15,
                                                        ),
                                                        child: Container(
                                                            padding: const EdgeInsets.all(20),
                                                            decoration: BoxDecoration(
                                                                color: Colors.white.withOpacity(0.5),
                                                                borderRadius: BorderRadius.circular(24),
                                                                border: Border.all(color: Colors.white.withOpacity(0.35),
                                                                ),
                                                            ),
                                                            child: Text(
                                                                product.description,
                                                                style: TextStyle(
                                                                    fontSize: 15,
                                                                    height: 1.8,
                                                                    color: Colors.grey.shade800,

                                                                ),
                                                            ),
                                                        ),
                                                    ),
                                                ),
                                                const SizedBox(height: 25),

                                                Wrap(
                                                    spacing: 12,
                                                    runSpacing: 12,
                                                    children: product.notes.map((note) {
                                                        return Container(
                                                            padding: const EdgeInsets.symmetric(
                                                                horizontal: 18,
                                                                vertical: 12,
                                                            ),

                                                            decoration: BoxDecoration(
                                                                gradient: const LinearGradient(
                                                                    colors: [
                                                                        Color(0xFFF6E5D8),
                                                                        Color(0xFFE7C3A3),
                                                                    ],
                                                                ),
                                                                borderRadius: BorderRadius.circular(16),
                                                                boxShadow:[
                                                                    BoxShadow(
                                                                        color: const Color(0xFFD8B08C).withOpacity(0.2),
                                                                        blurRadius: 12,
                                                                        offset: const Offset(0,6),
                                                                    ),
                                                                ],
                                                            ),
                                                            child: Text(
                                                                note,
                                                                style: const TextStyle(
                                                                    fontWeight: FontWeight.w600,
                                                                ),
                                                            ),
                                                        );
                                                    }).toList(),
                                                ),

                                                const SizedBox(height: 25),

                                                const Text(
                                                    "Available Sizes",
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight: FontWeight.bold,
                                                    ),
                                                ),

                                                const SizedBox(height: 14),

                                                Row(
                                                    children: [
                                                        SizeChip(label: "30ml"),
                                                        SizeChip(label:"50ml"),
                                                        SizeChip(label: "100ml"),
                                                    ],
                                                ),

                                                const SizedBox(height: 35),

                                                Container(
                                                    height: 70,
                                                    padding: const EdgeInsets.all(4),
                                                    decoration: BoxDecoration(
                                                        color: const Color(0xFF1D1D1D),
                                                        borderRadius: BorderRadius.circular(36),
                                                        boxShadow: [
                                                            BoxShadow(
                                                                color: Colors.black.withOpacity(0.2),
                                                                blurRadius: 20,
                                                                offset: const Offset(0, 12),
                                                            ),
                                                        ],
                                                    ),
                                                    child: Row(
                                                        children: [
                                                            Expanded(
                                                                flex: 3,
                                                                child: Container(
                                                                    decoration: BoxDecoration(
                                                                        gradient: const LinearGradient(
                                                                            colors: [
                                                                                Color(0xFFE3C2A4),
                                                                                Color(0xFFD4A67B),
                                                                            ],
                                                                        ),
                                                                        borderRadius: BorderRadius.circular(26),
                                                                    ),
                                                                    child: const Center(
                                                                        child: Row(
                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                            children:[
                                                                                Text(
                                                                                    "buy now",
                                                                                    style: TextStyle(
                                                                                        color: Colors.white,
                                                                                        fontSize: 18, 
                                                                                        fontWeight:FontWeight.w600,
                                                                                        fontStyle: FontStyle.italic,
                                                                                    ),
                                                                                ),
                                                                            ],
                                                                        ),
                                                                    ),
                                                                ),
                                                            ),

                                                            Expanded(
                                                                flex: 2,
                                                                child: Center(
                                                                    child: RichText(
                                                                        text: TextSpan(
                                                                            children: [
                                                                                TextSpan(
                                                                                    text: product.price,
                                                                                    style:const TextStyle(
                                                                                        color: Colors.white,
                                                                                        fontSize: 28,
                                                                                        fontWeight: FontWeight.bold,
                                                                                    ),
                                                                                ),
                                                                            ],
                                                                        ),
                                                                    ),
                                                                ),
                                                            ),
                                                        ],
                                                    ),
                                                ),
                                                
                                            ],
                                        ),
                                    ),
                                ),
                            );
                        },
                    ),
                ],
            ),
        );
    }
}

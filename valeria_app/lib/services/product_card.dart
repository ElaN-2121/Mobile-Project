import 'dart:ui';
import 'package:flutter/material.dart';
import '../models/product.dart';
import '../screens/product_details_page.dart';

Widget productCard(BuildContext context, Product product) {
    return GestureDetector(
        onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_)=>ProductDetailPage(product: product),
                ),
            );
        },
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.06),
                        blurRadius: 22,
                        offset: const Offset(0, 12),
                    ),
                ],
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: BackdropFilter(
                    filter: ImageFilter.blur(
                        sigmaX: 12,
                        sigmaY:12,
                    ),
                    child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.55),
                            borderRadius:BorderRadius.circular(30),
                            border: Border.all(
                                color: Colors.white.withOpacity(0.35),
                            ),
                        ),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                        Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10,
                                                vertical: 6,
                                            ),
                                            decoration: BoxDecoration(
                                                color: const Color(0xFFD8B08C).withOpacity(0.14),
                                                borderRadius: BorderRadius.circular(30),
                                            ),
                                            child: const Text(
                                                "NEW",
                                                style: TextStyle(
                                                    color: Color(0xFFD8B08C),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 10,
                                                    letterSpacing: 1,
                                                ),
                                            ),
                                        ),
                                        Icon(
                                            Icons.favorite_border_rounded,
                                            color: Colors.grey.shade500,
                                        ),
                                    ],
                                ),
                                const SizedBox(height: 12),

                                Expanded(
                                    child: Hero(
                                        tag: product.id,
                                        child: ClipRRect(
                                            borderRadius: BorderRadius.circular(20),
                                            child: Image.asset(
                                                product.image,
                                                fit: BoxFit.cover,
                                                width: double.infinity,
                                                height: double.infinity,
                                            ),
                                        ),
                                    ),
                                ),

                                const SizedBox(height: 12),

                                Text(
                                    product.name,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        height: 1.2,
                                    ),
                                ),

                                const SizedBox(height: 6),

                                Text(
                                    product.category,
                                    style: TextStyle(
                                        color: Colors.grey.shade500,
                                        fontSize: 13,
                                    ),
                                ),

                                const SizedBox(height: 14),

                                Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                        Text(
                                            "${product.price}",
                                            style: const TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.bold,
                                            ),
                                        ),
                                        Container(
                                            width: 40,
                                            height: 40,
                                            decoration: BoxDecoration(
                                                gradient: const LinearGradient(
                                                    colors:[
                                                        Color(0xFFE7C5A7),
                                                        Color(0xFFD6A57B),
                                                    ],
                                                ),
                                                borderRadius: BorderRadius.circular(14),
                                            ),
                                            child: const Icon(
                                                Icons.add_rounded,
                                                color: Colors.white,
                                            ),
                                        ),
                                    ],
                                ),
                            ],
                            
                        ),
                    ),
                ),
            ),
        ),
);
}
     
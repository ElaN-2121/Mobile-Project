import 'dart:ui';
import 'package:flutter/material.dart';
import '../data/product_data.dart';
import '../services/category_chip.dart';
import '../services/product_card.dart';
import 'product_details_page.dart';
import '../models/product.dart';

class ProductListPage extends StatefulWidget {
    const ProductListPage({super.key});

    @override
    State<ProductListPage> createState() => _ProductListPageState();
}


class _ProductListPageState extends State<ProductListPage> {
  final Color backgroundColor = const Color(0xFFFDF8F5);
  final Color primaryColor = const Color(0xFFD8B08C);

  String selectedCategory = "All";
  String searchQuery = "";

  List<Product> get filteredProducts {
    return products.where((product) {
      final matchCategory =
          selectedCategory == "All" || product.category == selectedCategory;

      final matchSearch =
          product.name.toLowerCase().contains(searchQuery.toLowerCase());

      return matchCategory && matchSearch;
    }).toList();
  }

  void onCategoryTap(String category) {
    setState(() {
      selectedCategory = category;
    });
  }

  void onSearch(String value) {
    setState(() {
      searchQuery = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          /// SOFT BACKGROUND GLOW
          Positioned(
            top: -120,
            right: -80,
            child: Container(
              width: 260,
              height: 260,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: primaryColor.withOpacity(0.15),
              ),
            ),
          ),

          Positioned(
            bottom: -100,
            left: -60,
            child: Container(
              width: 240,
              height: 240,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.pink.withOpacity(0.08),
              ),
            ),
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 18),

                  /// HEADER
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// LEFT TEXT
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Luxury Fragrances",
                            style: TextStyle(
                              color: Colors.grey.shade500,
                              fontSize: 14,
                              letterSpacing: 1,
                            ),
                          ),

                          const SizedBox(height: 4),

                          const Text(
                            "VALERIA",
                            style: TextStyle(
                              fontSize: 34,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1.5,
                              height: 1,
                            ),
                          ),
                        ],
                      ),

                      /// GLASS MENU BUTTON
                      ClipRRect(
                        borderRadius: BorderRadius.circular(18),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 15,
                            sigmaY: 15,
                          ),
                          child: Container(
                            padding: const EdgeInsets.all(14),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.45),
                              borderRadius: BorderRadius.circular(18),
                              border: Border.all(
                                color: Colors.white.withOpacity(0.4),
                              ),
                            ),
                            child: const Icon(
                              Icons.menu_rounded,
                              size: 24,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 28),

                  /// GLASS SEARCH BAR
                  ClipRRect(
                    borderRadius: BorderRadius.circular(22),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 12,
                        sigmaY: 12,
                      ),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(22),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.3),
                          ),
                        ),
                        child: TextField(
                          onChanged: onSearch,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(
                              Icons.search_rounded,
                              color: Colors.grey.shade600,
                            ),
                            hintText: "Search luxury perfume",
                            hintStyle: TextStyle(
                              color: Colors.grey.shade500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  /// CATEGORY CHIPS
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        categoryChip(
                            category: "All",
                            isSelected: selectedCategory == "All",
                            onTap: () {
                                setState(() {
                                selectedCategory = "All";
                                });
                            },
                        ),
                        categoryChip(
                            category: "Women",
                            isSelected: selectedCategory == "Women",
                            onTap: () {
                                setState(() {
                                selectedCategory = "Women";
                                });
                            },
                        ),
                        categoryChip(
                            category: "Men",
                            isSelected: selectedCategory == "Men",
                            onTap: () {
                                setState(() {
                                selectedCategory = "Men";
                                });
                            },
                        ),
                        categoryChip(
                            category: "Luxary",
                            isSelected: selectedCategory == "Luxary",
                            onTap: () {
                                setState(() {
                                selectedCategory = "Luxary";
                                });
                            },
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 28),

                  /// SECTION TITLE
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Popular Scents",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      Text(
                        "${filteredProducts.length} products",
                        style: TextStyle(
                          color: Colors.grey.shade500,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  /// PRODUCT GRID
                  Expanded(
                    child: GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: filteredProducts.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 18,
                        childAspectRatio: 0.64,
                      ),
                      itemBuilder: (context, index) {
                        final product = filteredProducts[index];
                        return productCard(context, product);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:hungry/theme/app_colors.dart';

class HomeCategory extends StatefulWidget {
  const HomeCategory({super.key});

  @override
  State<HomeCategory> createState() => _HomeCategoryState();
}

class _HomeCategoryState extends State<HomeCategory> {

    static final List<String> categories = [
    'All',
    'Pizza',
    'Burger',
    'Sushi',
    'Dessert',
  ];
  String selectedCategory = categories[0];
  @override
  Widget build(BuildContext context) {
    return   SingleChildScrollView(
                scrollDirection: .horizontal,
                child: Row(
                  children: List.generate(categories.length, (index) {
                    final category = categories[index];

                    final bool isSelected = selectedCategory == category;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedCategory = categories[index];
                        });
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        margin: .symmetric(horizontal: 5),
                        padding: .symmetric(horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? AppColors.primary
                              : Colors.grey.shade400,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          category,
                          style: Theme.of(context).textTheme.titleSmall
                              ?.copyWith(
                                color: isSelected
                                    ? Colors.white
                                    : AppColors.brown,
                                fontSize: 16,
                              ),
                        ),
                      ),
                    );
                  }),
                ),
              )
            
             ;
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hungry/theme/app_colors.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return     Material(
      
                borderRadius: BorderRadius.circular(20),
                shadowColor: Colors.white,
                elevation: 10,
                child: TextField(
                  onTapOutside: (event) => FocusScope.of(context).unfocus(),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: 'Search',
                    hintStyle: Theme.of(context).textTheme.titleMedium
                        ?.copyWith(color: AppColors.grey, fontSize: 16),
                    prefixIcon: Icon(CupertinoIcons.search, size: 28),
                  ),
                ),
              )
              ;
  }
}
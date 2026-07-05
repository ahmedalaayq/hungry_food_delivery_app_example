import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hungry/core/assetsManager/assets_manager.dart';
import 'package:hungry/core/widgets/custom_gap.dart';
import 'package:hungry/theme/app_colors.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return   Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Center(
                    child: Column(
                      crossAxisAlignment: .start,
                      children: [
                        SvgPicture.asset(
                          AssetsManager.hungry,
                          colorFilter: ColorFilter.mode(
                            AppColors.primary,
                            .srcIn,
                          ),
                        ),
                        CustomGap(4),
                        Text(
                          'Hello, Ahmed Alaayq',
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(color: AppColors.grey),
                        ),
                      ],
                    ),
                  ),
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: AppColors.primary,
                    child: Icon(CupertinoIcons.person, color: Colors.white),
                  ),
                ],
              )
              ;
  }
}
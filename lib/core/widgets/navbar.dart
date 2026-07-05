import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key, required this.currentIndex, required this.onTap});

  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 25),
        child: Container(
          height: 72,
          decoration: BoxDecoration(
            color: Colors.black.withValues(alpha: .85),
            borderRadius: BorderRadius.circular(28),
            border: Border.all(color: Colors.white.withValues(alpha: .08)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: .25),
                blurRadius: 30,
                offset: const Offset(0, 15),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _NavItem(
                index: 0,
                icon: CupertinoIcons.house_fill,
                label: "Home",
                selected: currentIndex == 0,
                onTap: onTap,
              ),
              _NavItem(
                index: 1,
                icon: CupertinoIcons.cart,
                label: "Cart",
                selected: currentIndex == 1,
                onTap: onTap,
              ),
              _NavItem(
                index: 2,
                icon: CupertinoIcons.square_grid_2x2_fill,
                label: "Menu",
                selected: currentIndex == 2,
                onTap: onTap,
              ),
              _NavItem(
                index: 3,
                icon: CupertinoIcons.person,
                label: "Profile",
                selected: currentIndex == 3,
                onTap: onTap,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.index,
    required this.icon,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final int index;
  final IconData icon;
  final String label;
  final bool selected;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => onTap(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
        padding: selected
            ? const EdgeInsets.symmetric(horizontal: 18, vertical: 10)
            : const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: selected
              ? Colors.white.withValues(alpha: .18)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(18),
        ),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 250),
          child: selected
              ? Row(
                  key: const ValueKey("selected"),
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(icon, color: Colors.white, size: 22),
                    const SizedBox(width: 8),
                    Text(
                      label,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                )
              : Icon(
                  icon,
                  key: const ValueKey("icon"),
                  color: Colors.white70,
                  size: 24,
                ),
        ),
      ),
    );
  }
}

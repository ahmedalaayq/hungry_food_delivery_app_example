import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hungry/core/assetsManager/assets_manager.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> with SingleTickerProviderStateMixin {

  late final AnimationController _logoController;
  late final Animation<double> _logoOpacity;
  late final Animation<Offset> _logoSlide;

  @override
  void initState() {
    super.initState();

    _logoController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );

    _logoOpacity = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _logoController, curve: Curves.easeOut));

    _logoSlide = Tween<Offset>(begin: const Offset(0, .25), end: Offset.zero)
        .animate(
          CurvedAnimation(parent: _logoController, curve: Curves.easeOutCubic),
        );

    _logoController.forward();

    
  }

  @override
  void dispose() {
    _logoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        bottom: false,
        child: Column(
          children: [
            const Spacer(),

            FadeTransition(
              opacity: _logoOpacity,
              child: SlideTransition(
                position: _logoSlide,
                child: SvgPicture.asset(AssetsManager.hungry, width: 258),
              ),
            ),

            const Spacer(),

            Image.asset(
              AssetsManager.splashBurger,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ],
        ),
      )
    
    ;
  }
}
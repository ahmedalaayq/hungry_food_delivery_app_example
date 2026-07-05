import 'package:flutter/material.dart';
import 'package:hungry/core/widgets/navbar.dart';
import 'package:hungry/features/home/views/home_view.dart';

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  List<Widget> views = [HomeView(), Container(), Container(), Container()];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavBar(
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        currentIndex: currentIndex,
      ),
      body: views[currentIndex],
    );
  }
}

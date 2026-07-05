import 'package:flutter/material.dart';
import 'package:hungry/core/widgets/custom_gap.dart';
import 'widgets/home_category.dart';
import 'widgets/home_header.dart';
import 'widgets/home_searchbar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.all(16),
              sliver: SliverAppBar(
                scrolledUnderElevation: 0.0,
                elevation: 0.0,
                backgroundColor: Colors.white,
                pinned: true,
                floating: false,
                snap: false,
                toolbarHeight: 170,
                flexibleSpace: Column(
                  spacing: 20,
                  children: [HomeHeader(), HomeSearchBar()],
                ),
              ),
            ),
            SliverToBoxAdapter(child: CustomGap(10)),

            SliverToBoxAdapter(child: HomeCategory()),
            SliverToBoxAdapter(child: CustomGap(20)),
            SliverPadding(
              padding: const EdgeInsets.all(16),
              sliver: SliverGrid.builder(
                itemCount: 20,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  );
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

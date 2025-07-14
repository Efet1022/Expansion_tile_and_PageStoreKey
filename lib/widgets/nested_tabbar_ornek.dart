import 'package:flutter/material.dart';

class NestedTabbarOrnek extends StatefulWidget {
  const NestedTabbarOrnek({super.key});

  @override
  State<NestedTabbarOrnek> createState() =>
      _NestedTabbarOrnekState();
}

class _NestedTabbarOrnekState
    extends State<NestedTabbarOrnek> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("İçiçe Sekmeli Tab"),
          foregroundColor: Colors.white,
          backgroundColor: Colors.blue,
          bottom: const TabBar(
            tabs: [
              Tab(text: "Category 1"),
              Tab(text: "Category 2"),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            InnerTabView(categoryName: "1"),
            InnerTabView(categoryName: "2"),
          ],
        ),
      ),
    );
  }
}

class InnerTabView extends StatelessWidget {
  final String categoryName;
  const InnerTabView({
    super.key,
    required this.categoryName,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          TabBar(
            labelColor: Colors.red,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(text: "Sub Category A"),
              Tab(text: "Sub Category B"),
              Tab(text: "Sub Category C"),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                Center(
                  child: Text(
                    "$categoryName - Alt Sekme A",
                  ),
                ),
                Center(
                  child: Text(
                    "$categoryName - Alt Sekme B",
                  ),
                ),
                Center(
                  child: Text(
                    "$categoryName - Alt Sekme C",
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

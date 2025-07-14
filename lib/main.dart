import 'package:flutter/material.dart';
import 'package:ornek_proje/widgets/expansiontile_page.dart';
import 'package:ornek_proje/widgets/filter_menu_chips.dart';
import 'package:ornek_proje/widgets/image_and_tabbar_page.dart';
import 'package:ornek_proje/widgets/liste_ornek.dart';
import 'package:ornek_proje/widgets/nested_tabbar_ornek.dart';
import 'package:ornek_proje/widgets/pageview_page.dart';
import 'package:ornek_proje/widgets/settings_expansion_menu.dart';
import 'package:ornek_proje/widgets/simple_image_slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FilterMenuChips(),
    );
  }
}

class MyProject extends StatefulWidget {
  const MyProject({super.key});

  @override
  State<MyProject> createState() =>
      _MyProjectState();
}

class _MyProjectState extends State<MyProject> {
  var keyList = PageStorageKey("key liste");
  late List<Widget> sayfalar;
  int bottomIndex = 0;

  @override
  void initState() {
    super.initState();
    sayfalar = [
      ListeOrnek(listKey: keyList),
      /*ExpansionTilePage(
        expansionKey: keyExpansion,
      ),
      */
      SettingsExpansionMenu(),
      //PageViewPage(),
      SimpleImageSlider(),
    ];
  }

  var keyExpansion = PageStorageKey(
    "key expansion",
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tasarım Araçları"),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      body: sayfalar[bottomIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.orange,
        unselectedItemColor:
            Colors.orange.shade200,
        currentIndex: bottomIndex,
        onTap: (value) {
          setState(() {
            bottomIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: "Liste",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.expand),
            label: "Expansion",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pages),
            label: "Pages",
          ),
        ],
      ),
    );
  }
}

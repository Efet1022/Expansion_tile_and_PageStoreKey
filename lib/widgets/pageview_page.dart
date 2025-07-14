import 'package:flutter/material.dart';

class PageViewPage extends StatefulWidget {
  const PageViewPage({super.key});

  @override
  State<PageViewPage> createState() =>
      _PageViewPageState();
}

class _PageViewPageState
    extends State<PageViewPage> {
  bool yatayEksen = true;
  bool isPageSnapping = true;
  int currentIndex = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 300,
          child: PageView(
            controller: pageController,
            scrollDirection: yatayEksen
                ? Axis.horizontal
                : Axis.vertical,
            //dokunduğumuzda diğer sayfaya mı geçsin yoksa harekete göre kalsın mı
            pageSnapping: isPageSnapping,
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            children: [
              Container(
                width: double.infinity,
                color: Colors.indigo.shade300,
                child: Center(
                  child: Text(
                    "Sayfa 0",
                    style: TextStyle(
                      fontSize: 36,
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                color: Colors.red.shade300,
                child: Center(
                  child: Text(
                    "Sayfa 1",
                    style: TextStyle(
                      fontSize: 36,
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                color: Colors.amber.shade300,
                child: Center(
                  child: Text(
                    "Sayfa 2",
                    style: TextStyle(
                      fontSize: 36,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment:
              MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: currentIndex == 0
                  ? null
                  : () {
                      pageController.previousPage(
                        duration: Duration(
                          seconds: 1,
                        ),
                        curve: Curves.easeIn,
                      );
                    },
              child: Text("Previous"),
            ),
            ElevatedButton(
              onPressed: currentIndex == 2
                  ? null
                  : () {
                      pageController.nextPage(
                        duration: Duration(
                          seconds: 1,
                        ),
                        curve: Curves.easeIn,
                      );
                    },
              child: Text("Next"),
            ),
          ],
        ),
        Container(
          height: 100,
          width: double.infinity,
          color: yatayEksen
              ? Colors.red
              : Colors.green,
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.center,
                children: [
                  Text(
                    "Yatay eksende çalış",
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  Checkbox(
                    value: yatayEksen,
                    onChanged: (value) {
                      setState(() {
                        yatayEksen = value!;
                      });
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.center,
                children: [
                  Text(
                    "Page Snapping değiştir",
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  Checkbox(
                    value: isPageSnapping,
                    onChanged: (value) {
                      setState(() {
                        isPageSnapping = value!;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

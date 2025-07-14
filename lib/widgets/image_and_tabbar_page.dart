import 'package:flutter/material.dart';

class ImageAndTabbarPage extends StatefulWidget {
  const ImageAndTabbarPage({super.key});

  @override
  State<ImageAndTabbarPage> createState() =>
      _ImageAndTabbarPageState();
}

class _ImageAndTabbarPageState
    extends State<ImageAndTabbarPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.brown,
          title: Text("Resim + Tabbar"),
          foregroundColor: Colors.white,
        ),
        body: Column(
          children: [
            //Resim alanı
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    "https://picsum.photos/id/1011/800/400",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              alignment: Alignment.bottomCenter,
              child: const Text(
                "Ürün Başlığı",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  shadows: [
                    Shadow(
                      blurRadius: 8,
                      color: Colors.pink,
                    ),
                  ],
                ),
              ),
            ),
            const TabBar(
              //Appbar ın altında olmak zorunda değil
              labelColor: Colors.blue,
              unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(text: "Açıklama"),
                Tab(text: "Yorumlar"),
                Tab(text: "Detay"),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Center(
                    child: Text(
                      "Açıklama",
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      "Yorumlar",
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      "Ürün Detay",
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

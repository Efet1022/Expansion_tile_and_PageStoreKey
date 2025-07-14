import 'package:flutter/material.dart';

class ExpansionTilePage extends StatefulWidget {
  final PageStorageKey expansionKey;
  const ExpansionTilePage({
    super.key,
    required this.expansionKey,
  });

  @override
  State<ExpansionTilePage> createState() =>
      _ExpansionTilePageState();
}

class _ExpansionTilePageState
    extends State<ExpansionTilePage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      key: widget.expansionKey,
      itemCount: 5,
      itemBuilder: (context, index) {
        return ExpansionTile(
          key: PageStorageKey(index),
          //textcolor özelliği de var
          //trailing: sağ köşedeki ikonu değiştrebiliriz
          //initiallyExpanded: true, açık olup gelmemesini belirler ilk sayfa açıldığında
          //mainstate: içerik temizlensin mi diye verilen parametre true yapılırsa içeriği temizler
          //tilePadding: , başlık alanını içine doldurur.
          title: Text("Başlık ${index + 1}"),
          leading: Icon(Icons.wb_sunny),
          children: [
            Container(
              height: 200,
              color: index % 2 == 0
                  ? Colors.redAccent.shade400
                  : Colors.yellow.shade400,
            ),
          ],
        );
      },
    );
  }
}

import 'package:flutter/material.dart';

class ListViewDoble extends StatelessWidget {
  final IndexedWidgetBuilder itemBuilder;
  final double aspecradio;
  final int itemCount;

  const ListViewDoble(
      {Key? key,
      required this.itemCount,
      required this.itemBuilder,
      this.aspecradio = 0.8})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 1,
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.red)),
        child: OverflowBox(
          maxHeight: MediaQuery.of(context).size.height * 1.1,
          child: GridView.builder(
              padding: EdgeInsets.only(bottom: 200, top: 100),
              itemCount: itemCount,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: aspecradio,
                crossAxisCount: 2,
                //mainAxisSpacing: 20,
                //  crossAxisSpacing: 20,
              ),
              itemBuilder: (context, index) {
                return LayoutBuilder(builder: (context, constraints) {
                  final altoitem = constraints.maxHeight;
                  final altoitemdos = constraints.maxWidth / aspecradio;
                  //la relacion de aspecto mantiene el alto en relacion del ancho
                  return Transform.translate(
                    offset: Offset(0.0, index.isOdd ? altoitemdos / 2 : 0),
                    child: Card(
                      margin: EdgeInsets.all(8),
                      color: Colors.grey[300],
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: itemBuilder(context, index),
                    ),
                  );
                });
              }),
        ),
      ),
    );
  }
}

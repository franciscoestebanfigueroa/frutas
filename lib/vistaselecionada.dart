import 'package:flutter/material.dart';

import 'model.dart';

class VistaSelecion extends StatelessWidget {
  const VistaSelecion({
    Key? key,
    required this.data,
  }) : super(key: key);

  final Data data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: BackButton(),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 8,
            child: Container(
              color: Colors.blue,
              child: Center(
                child: Hero(
                  tag: '${data.url}',
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Image.network(
                      '${data.url}',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
              flex: 1,
              child: Container(
                child: TextButton(
                  onPressed: () {
                    return Navigator.pop(context);
                  },
                  child: Text('Agregar'),
                ),
              ))
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frutas/bloc/frutas_bloc.dart';

void main() => runApp(Mybloc());

class Mybloc extends StatelessWidget {
  const Mybloc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (context) => FrutasBloc(),
      )
    ], child: MyApp());
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: BlocBuilder<FrutasBloc, FrutasState>(
          builder: (context, statez) {
            return ListViewDoble(
              itemBuilder: (BuildContext context, int index) {
                return ItemWidget(
                  data: datos[index],
                  index: index,
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class BlocTemp extends StatelessWidget {
  const BlocTemp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          //Text('${state.nombre}'),
          TextButton(
              onPressed: () {
                BlocProvider.of<FrutasBloc>(context).add(Consulta());
              },
              child: Text('on')),
          TextButton(
              onPressed: () {
                BlocProvider.of<FrutasBloc>(context).add(Escribir());
              },
              child: Text('off')),
          Divider(
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}

class ListViewDoble extends StatelessWidget {
  final IndexedWidgetBuilder itemBuilder;
  final double aspecradio;

  const ListViewDoble(
      {Key? key, required this.itemBuilder, this.aspecradio = 0.8})
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
              itemCount: datos.length,
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

class Data {
  final String url;
  final String nombre;
  final String precio;

  Data({required this.url, required this.nombre, required this.precio});
}

List<Data> datos = [
  Data(
      url: 'https://picsum.photos/id/20/120',
      nombre: 'Primero ',
      precio: '\$56'),
  Data(
      url: 'https://picsum.photos/id/13/120',
      nombre: 'Primero ',
      precio: '\$56'),
  Data(
      url: 'https://picsum.photos/id/222/120',
      nombre: 'Primero ',
      precio: '\$56'),
  Data(
      url: 'https://picsum.photos/id/165/120',
      nombre: 'Primero ',
      precio: '\$56'),
  Data(
      url: 'https://picsum.photos/id/62/120',
      nombre: 'Primero ',
      precio: '\$56'),
  Data(
      url: 'https://picsum.photos/id/44/120',
      nombre: 'Primero ',
      precio: '\$56'),
  Data(
      url: 'https://picsum.photos/id/99/120',
      nombre: 'Primero ',
      precio: '\$56'),
  Data(
      url: 'https://picsum.photos/id/24/120',
      nombre: 'Primero ',
      precio: '\$56'),
  Data(
      url: 'https://picsum.photos/id/55/120',
      nombre: 'Primero ',
      precio: '\$56'),
  Data(
      url: 'https://picsum.photos/id/565/120',
      nombre: 'Primero ',
      precio: '\$56')
];

class ItemWidget extends StatelessWidget {
  final index;
  final Data data;

  const ItemWidget({Key? key, required this.index, required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipOval(
          child: Image.network(
            data.url,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          '${data.nombre}',
          style: TextStyle(fontSize: 20),
        ),
        Text(
          '${data.precio}',
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
              5,
              (index) => Icon(
                    index < 4 ? Icons.star : Icons.star_border_outlined,
                    color: Colors.yellow[700],
                  )),
        )
      ],
    );
  }
}

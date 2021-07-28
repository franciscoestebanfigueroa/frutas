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

  const ListViewDoble({Key? key, required this.itemBuilder}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 0.8,
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.red)),
        child: OverflowBox(
          maxHeight: MediaQuery.of(context).size.height * 1.1,
          child: GridView.builder(
              padding: EdgeInsets.only(bottom: 200, top: 100),
              itemCount: datos.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 0.8,
                crossAxisCount: 2,
                //mainAxisSpacing: 20,
                //  crossAxisSpacing: 20,
              ),
              itemBuilder: itemBuilder),
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
      url: 'https://picsum.photos/100/100', nombre: 'Primero ', precio: '\n56'),
  Data(
      url: 'https://picsum.photos/100/100', nombre: 'Primero ', precio: '\n56'),
  Data(
      url: 'https://picsum.photos/100/100', nombre: 'Primero ', precio: '\n56'),
  Data(
      url: 'https://picsum.photos/100/100', nombre: 'Primero ', precio: '\n56'),
  Data(
      url: 'https://picsum.photos/100/100', nombre: 'Primero ', precio: '\n56'),
  Data(
      url: 'https://picsum.photos/100/100', nombre: 'Primero ', precio: '\n56'),
  Data(
      url: 'https://picsum.photos/100/100', nombre: 'Primero ', precio: '\n56'),
  Data(
      url: 'https://picsum.photos/100/100', nombre: 'Primero ', precio: '\n56'),
  Data(
      url: 'https://picsum.photos/100/100', nombre: 'Primero ', precio: '\n56'),
  Data(url: 'https://picsum.photos/100/100', nombre: 'Primero ', precio: '\n56')
];

class ItemWidget extends StatelessWidget {
  final index;
  final Data data;

  const ItemWidget({Key? key, required this.index, required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0.0, index.isOdd ? 100.0 : 0.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 11,
        color: Colors.white70,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipOval(
              child: Image.network(data.url),
            ),
            SizedBox(
              height: 10,
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
              height: 10,
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
        ),
      ),
    );
  }
}

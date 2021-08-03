import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frutas/bloc/frutas_bloc.dart';
import 'package:frutas/vistaselecionada.dart';

import 'model.dart';
import 'widget/duallistview.dart';

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
      title: 'Dual Listview',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Stock 2.0'),
        ),
        body: BlocBuilder<FrutasBloc, FrutasState>(
          builder: (context, state) {
            return Column(
              children: [
                Expanded(
                  flex: 8,
                  child: Container(
                    child: ListViewDoble(
                      itemCount: datos.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ItemWidget(
                          data: datos[index],
                          index: index,
                        );
                      },
                    ),
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      child: Container(
                        color: Colors.black,
                      ),
                    ))
              ],
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

class ItemWidget extends StatelessWidget {
  final index;
  final Data data;

  const ItemWidget({Key? key, required this.index, required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('ok --> ${index}');
        Navigator.push(
          context,
          PageRouteBuilder(
              //opaque: false,
              pageBuilder: (BuildContext context, Animation<double> animation,
                  Animation<double> secondaryAnimation) {
            return VistaSelecion(data: data);
          }, transitionsBuilder: (context, animation, _, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          }),
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipOval(
            child: Hero(
              tag: '${data.url}',
              child: Image.network(
                data.url,
              ),
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
      ),
    );
  }
}

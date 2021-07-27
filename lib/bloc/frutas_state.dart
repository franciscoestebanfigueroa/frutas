part of 'frutas_bloc.dart';

@immutable
abstract class FrutasState {
  final String nombre;

  FrutasState(this.nombre);
}

class FrutasInitial extends FrutasState {
  final data;

  FrutasInitial(this.data) : super(data);
}

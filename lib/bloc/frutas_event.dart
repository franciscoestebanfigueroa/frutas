part of 'frutas_bloc.dart';

@immutable
abstract class FrutasEvent {}

class Consulta extends FrutasEvent {}

class Escribir extends FrutasEvent {}

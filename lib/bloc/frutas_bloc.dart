import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'frutas_event.dart';
part 'frutas_state.dart';

class FrutasBloc extends Bloc<FrutasEvent, FrutasState> {
  FrutasBloc() : super(FrutasInitial('Primer estado'));

  @override
  Stream<FrutasState> mapEventToState(
    FrutasEvent event,
  ) async* {
    if (event is Consulta) {
      yield FrutasInitial('Consulta');
    }
    if (event is Escribir) {
      yield FrutasInitial('Escrtibir');
    }
    // TODO: implement mapEventToState
  }
}

import 'package:flutter_architecture_example/features/presentation/bloc/character/remote/remote_character_event.dart';
import 'package:flutter_architecture_example/features/presentation/bloc/character/remote/remote_character_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RemoteCharactersBloc
    extends Bloc<RemoteCharactersEvent, RemoteCharactersState> {

  RemoteCharactersBloc()
      : super(const RemoteCharactersState());

  Future<void> _getCharacters(Emitter<RemoteCharactersState> emit) async {
    emit(state.copyWith());
    }
}
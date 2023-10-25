import 'package:flutter_architecture_example/core/resources/data_state.dart';
import 'package:flutter_architecture_example/features/domain/usecases/get_character.dart';
import 'package:flutter_architecture_example/features/presentation/bloc/character/remote/remote_character_event.dart';
import 'package:flutter_architecture_example/features/presentation/bloc/character/remote/remote_character_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RemoteCharactersBloc
    extends Bloc<RemoteCharactersEvent, RemoteCharactersState> {
  final GetCharacterUseCase _getCharacterUseCase;
  int _page = 1;
  bool _isLoading = false;

  RemoteCharactersBloc(this._getCharacterUseCase)
      : super(const RemoteCharactersState()) {
    on<RefreshCharacters>((event, emit) async {
      _page = 1;
      emit(state.copyWith(
        pStatus: RemoteCharactersStatus.loading,
        pCharacters: [],
        pHasMaxReached: false,
      ));
      add(const GetCharacters());
    });

    on<GetCharacters>((event, emit) async {
      if (state.hasMaxReached) {
        emit(state);
      } else {
        if (!_isLoading) {
          await _getCharacters(emit);
        }
      }
    });
  }

  Future<void> _getCharacters(Emitter<RemoteCharactersState> emit) async {
    emit(state.copyWith(pStatus: RemoteCharactersStatus.loading));
    _isLoading = true;
    final dataResult = await _getCharacterUseCase(params: _page);

    if (dataResult is DataSuccess) {
      final characterResponse = dataResult.data!;
      final characters = characterResponse.results;
      emit(state.copyWith(
          pStatus: RemoteCharactersStatus.success,
          pHasMaxReached: characterResponse.info.pages <= _page,
          pCharacters: List.of(state.characters)..addAll(characters)));
      _page++;
    } else {
      emit(state.copyWith(pStatus: RemoteCharactersStatus.failed));
    }
    _isLoading = false;
  }
}

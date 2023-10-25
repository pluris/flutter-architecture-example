import 'package:flutter_architecture_example/core/resources/data_state.dart';
import 'package:flutter_architecture_example/core/usecase/usecase.dart';
import 'package:flutter_architecture_example/features/data/repository/character_repository.dart';
import 'package:flutter_architecture_example/features/domain/entity/character_entity.dart';

class GetCharacterUseCase
    implements UseCase<DataState<CharacterResponse>, int> {
  final CharacterRepository _characterRepository;

  GetCharacterUseCase(this._characterRepository);

  @override
  Future<DataState<CharacterResponse>> call({int? params}) {
    return _characterRepository.getCharacters(params!);
  }
}

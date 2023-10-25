import 'package:flutter_architecture_example/core/resources/data_state.dart';
import 'package:flutter_architecture_example/features/data/repository/character_repository.dart';
import 'package:flutter_architecture_example/features/domain/entity/character_entity.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  @override
  Future<DataState<CharacterResponse>> getCharacters(int page) {
    // TODO: implement getCharacters
    throw UnimplementedError();
  }

  @override
  Future<List<CharacterEntity>> getSavedCharacters() {
    // TODO: implement getSavedCharacters
    throw UnimplementedError();
  }

  @override
  Future<void> removeCharacter(CharacterEntity character) {
    // TODO: implement removeCharacter
    throw UnimplementedError();
  }

  @override
  Future<void> saveCharacter(CharacterEntity character) {
    // TODO: implement saveCharacter
    throw UnimplementedError();
  }
}

import 'package:flutter_architecture_example/core/resources/data_state.dart';
import 'package:flutter_architecture_example/features/domain/entity/character_entity.dart';

abstract class CharacterRepository {
  // API methods
  Future<DataState<CharacterResponse>> getCharacters(int page);

  // Database methods
  Future<List<CharacterEntity>> getSavedCharacters();

  Future<void> saveCharacter(CharacterEntity character);

  Future<void> removeCharacter(CharacterEntity character);
}

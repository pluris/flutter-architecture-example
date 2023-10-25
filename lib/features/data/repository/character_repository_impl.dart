import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_architecture_example/core/resources/data_state.dart';
import 'package:flutter_architecture_example/features/data/remote/news_api_service.dart';
import 'package:flutter_architecture_example/features/data/repository/character_repository.dart';
import 'package:flutter_architecture_example/features/domain/entity/character_entity.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  final NewsApiService _newsApiService;

  CharacterRepositoryImpl(this._newsApiService);

  @override
  Future<DataState<CharacterResponse>> getCharacters(int page) async {
    try {
      final httpResponse = await _newsApiService.getCharacters(
        page,
      );
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        final Map<String, dynamic> jsonDataMap = json.decode(httpResponse.data);
        final characters = CharacterResponse.fromJson(jsonDataMap);
        return DataSuccess(characters);
      } else {
        return DataFailed(DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<List<CharacterEntity>> getSavedCharacters() async {
    return [];
  }

  @override
  Future<void> removeCharacter(CharacterEntity character) {
    return Future(() => false);
  }

  @override
  Future<void> saveCharacter(CharacterEntity character) {
    return Future(() => false);
  }
}

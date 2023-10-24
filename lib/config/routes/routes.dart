import 'package:flutter/material.dart';
import 'package:flutter_architecture_example/config/constants/constants.dart';
import 'package:flutter_architecture_example/features/domain/entity/character_entity.dart';
import 'package:flutter_architecture_example/features/presentation/pages/character_details/character_detail.dart';
import 'package:flutter_architecture_example/features/presentation/pages/home/home.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case charactersListScreen:
        //temporary routes
        return _materialRoute(const HomePage());
      case characterDetailsScreen:
        final selectedCharacter = settings.arguments as CharacterEntity;
        return MaterialPageRoute(
            builder: (_) => CharacterDetail(character: selectedCharacter));
      default:
        return _materialRoute(const HomePage());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}

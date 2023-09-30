import 'package:flutter/material.dart';
import 'package:flutter_architecture_example/config/constants/constants.dart';
import 'package:flutter_architecture_example/features/presentation/pages/character_details/character_detail.dart';
import 'package:flutter_architecture_example/features/presentation/pages/home/home.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch(settings.name) {
      case charactersListScreen:
        //temporary routes
        return _materialRoute(const HomePage());
      case characterDetailsScreen:
        return _materialRoute(const CharacterDetail());
      default:
        return _materialRoute(const HomePage());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture_example/features/domain/entity/character_entity.dart';

class CharacterDetail extends StatelessWidget {
  final CharacterEntity character;
  const CharacterDetail({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Character Details'),
      ),
      body: _buildBody(),
    );
  }

  Center _buildBody() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 150.0,
            height: 150.0,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: CachedNetworkImage(
              imageUrl: character.image!,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 20.0),
          Text(
            character.name!,
            style: const TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10.0),

          // Character status
          Text(
            'Status: ${character.status}',
            style: const TextStyle(fontSize: 16.0),
          ),
          const SizedBox(height: 10.0),
          // Character species
          Text(
            'Species: ${character.species}',
            style: const TextStyle(fontSize: 16.0),
          ),
          const SizedBox(height: 10.0),
        ],
      ),
    );
  }
}

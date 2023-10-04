import 'package:flutter/material.dart';
import 'package:flutter_architecture_example/features/presentation/bloc/character/remote/remote_character_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final RemoteCharactersBloc _bloc;

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Home"));
  }
}
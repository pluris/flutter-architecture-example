import 'package:flutter/material.dart';
import 'package:flutter_architecture_example/features/domain/entity/character_entity.dart';
import 'package:flutter_architecture_example/features/presentation/bloc/character/remote/remote_character_bloc.dart';
import 'package:flutter_architecture_example/features/presentation/bloc/character/remote/remote_character_event.dart';
import 'package:flutter_architecture_example/features/presentation/bloc/character/remote/remote_character_state.dart';
import 'package:flutter_architecture_example/features/presentation/bloc/theme_mode/theme_bloc.dart';
import 'package:flutter_architecture_example/features/presentation/widgets/character_widget.dart';
import 'package:flutter_architecture_example/features/presentation/widgets/loading_failed.dart';
import 'package:flutter_architecture_example/features/presentation/widgets/loading_list_widget.dart';
import 'package:flutter_architecture_example/injection_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scrollController = ScrollController();
  late final RemoteCharactersBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = context.read<RemoteCharactersBloc>();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(context),
      body: _buildBody(),
    );
  }

  PreferredSizeWidget _buildAppbar(BuildContext context) {
    return AppBar(
      title: const Text('Characters'),
      actions: [
        IconButton(
          onPressed: () {
            sl<ThemeBloc>().add(const ThemeToggle());
          },
          icon: const Icon(Icons.light_mode),
        )
      ],
    );
  }

  Widget _buildBody() {
    return BlocBuilder<RemoteCharactersBloc, RemoteCharactersState>(
        builder: (_, state) {
      if (state.characters.isNotEmpty) {
        final characters = state.characters;
        return ListView.builder(
            key: const ValueKey('character_page_list_key'),
            controller: _scrollController,
            itemCount:
                state.hasMaxReached ? characters.length : characters.length + 1,
            itemBuilder: (context, index) {
              if (index >= characters.length) {
                return !state.hasMaxReached
                    ? const Center(child: CircularProgressIndicator())
                    : const SizedBox();
              }
              final item = characters[index];
              return CharacterWidget(
                  item: item,
                  onCharacterClick: () => _onCharacterPressed(context, item));
            });
      } else if (state.hasMaxReached) {
        return SizedBox.fromSize();
      } else {
        switch (state.status) {
          case RemoteCharactersStatus.loading:
            return const LoadingListWidget();
          case RemoteCharactersStatus.failed:
            return LoadingFailedWidget(
              onRetry: () {
                _bloc.add(const RefreshCharacters());
              },
            );
          default:
            return SizedBox.fromSize();
        }
      }
    });
  }

  void _onCharacterPressed(BuildContext context, CharacterEntity Character) {
    //TODO: move characterDetailsScreen
    //Navigator.pushNamed(context, characterDetailsScreen, arguments: character);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) {
      _bloc.add(const GetCharacters());
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}

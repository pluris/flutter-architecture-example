import 'package:equatable/equatable.dart';

enum RemoteCharactersStatus { loading, success, failed }

class RemoteCharactersState extends Equatable {

  const RemoteCharactersState();

  RemoteCharactersState copyWith() {
    return const RemoteCharactersState();
  }

  @override
  List<Object?> get props => [];
}
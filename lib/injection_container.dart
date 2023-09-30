import 'package:flutter_architecture_example/features/presentation/bloc/theme_mode/theme_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<ThemeBloc>(ThemeBloc());
}


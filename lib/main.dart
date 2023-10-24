import 'package:flutter/material.dart';
import 'package:flutter_architecture_example/config/routes/routes.dart';
import 'package:flutter_architecture_example/config/theme/app_themes.dart';
import 'package:flutter_architecture_example/features/presentation/bloc/character/remote/remote_character_bloc.dart';
import 'package:flutter_architecture_example/features/presentation/bloc/character/remote/remote_character_event.dart';
import 'package:flutter_architecture_example/features/presentation/bloc/theme_mode/theme_bloc.dart';
import 'package:flutter_architecture_example/features/presentation/pages/home/home.dart';
import 'package:flutter_architecture_example/injection_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RemoteCharactersBloc>(
          create: (context) => sl()..add(const GetCharacters()),
        ),
        BlocProvider<ThemeBloc>(
          create: (context) => sl<ThemeBloc>()..add(const ThemeLoad()),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeData>(
        builder: (context, theme) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: lightTheme,
              darkTheme: darkTheme,
              themeMode: theme.brightness == Brightness.dark
                  ? ThemeMode.dark
                  : ThemeMode.light,
              onGenerateRoute: AppRoutes.onGenerateRoutes,
              home: const HomePage());
        },
      ),
    );
  }
}

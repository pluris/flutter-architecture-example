import 'package:flutter/material.dart';
import 'package:flutter_architecture_example/config/routes/routes.dart';
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
        BlocProvider<ThemeBloc>(
          create: (context) => sl<ThemeBloc>()..add(const ThemeLoad()),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeData>(
        builder: (context, theme) {
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: AppRoutes.onGenerateRoutes,
          home: HomePage());
        },
      ),
    );
  }
}
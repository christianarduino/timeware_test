import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timeware_test/src/shared/app_router.dart';
import 'package:timeware_test/src/shared/di/injector.dart';
import 'package:timeware_test/src/shared/user/presentation/view_model/user_view_model.dart';

void main() async {
  await initDi();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => injector.get<UserViewModel>(),
        ),
      ],
      child: BlocBuilder<UserViewModel, bool?>(
        builder: (context, isAuthenticated) {
          if (isAuthenticated == null) {
            return const MaterialApp(
              home: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }

          return MaterialApp.router(
            title: 'Flutter Demo',
            routerConfig: goRouter,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
          );
        },
      ),
    );
  }
}

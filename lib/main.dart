import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/auth/login/bloc/login_bloc.dart';
import 'core/routes/routes.dart';
import 'di/injector.dart';
import 'features/auth/login/view/login.dart';
import 'features/home/bloc/home_bloc.dart';

void main() async {
  await setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(create: (context) => locator<LoginBloc>()),
        BlocProvider<HomeBloc>(create: (context) => HomeBloc()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          fontFamily: "Mont",
        ),
        debugShowCheckedModeBanner: false,
        home: const Login(),
        onGenerateRoute: onGenerateRoutes,
      ),
    );
  }
}

import 'package:get_it/get_it.dart';
import '../core/services/http/http_service.dart';
import '../datasource/auth/auth_datasource.dart';
import '../datasource/auth/auth_datasource_impl.dart';
import '../domain/auth/auth_repository.dart';
import '../domain/auth/auth_repository_impl.dart';
import '../features/auth/login/bloc/login_bloc.dart';
import '../features/home/bloc/home_bloc.dart';

final locator = GetIt.I;
Future<void> setup() async {
  locator
    ..registerLazySingleton<LoginBloc>(
      () => LoginBloc(locator()),
    )
    ..registerLazySingleton<HomeBloc>(
      () => HomeBloc(),
    )
    // datasource
    ..registerLazySingleton<AuthDatasource>(
      () => AuthDatasourceImpl(HttpService()),
    )
    //domain
    ..registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(locator()),
    );
}

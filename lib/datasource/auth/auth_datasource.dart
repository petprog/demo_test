import '../../core/models/requests.dart';

abstract class AuthDatasource {
  Future<bool> login(LoginRequest data);
}

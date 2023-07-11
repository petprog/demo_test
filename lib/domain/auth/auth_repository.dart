import '../../core/models/base_error.dart';
import '../../core/models/domain_response.dart';
import '../../core/models/requests.dart';

abstract class AuthRepository {
  Future<DomainResponse<void, BaseError>> login(LoginRequest data);
}

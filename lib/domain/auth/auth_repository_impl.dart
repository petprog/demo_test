import 'package:metrdev_mobile_test/core/models/base_error.dart';

import 'package:metrdev_mobile_test/core/models/domain_response.dart';

import 'package:metrdev_mobile_test/core/models/requests.dart';
import 'package:metrdev_mobile_test/core/utils/utility.dart';

import '../../datasource/auth/auth_datasource.dart';
import 'auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDatasource _dataSource;
  AuthRepositoryImpl(this._dataSource);

  @override
  Future<DomainResponse<void, BaseError>> login(LoginRequest data) async {
    var response = DomainResponse<void, BaseError>();
    try {
      final result = await _dataSource.login(data);
      Utility.debugPrint(result);
      response.success = await _dataSource.login(data);
    } catch (e) {
      response.error = BaseError(description: e.toString());
    }
    return response;
  }
}

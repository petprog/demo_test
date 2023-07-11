import 'dart:convert';

import 'package:metrdev_mobile_test/core/models/requests.dart';
import 'package:metrdev_mobile_test/core/utils/extension.dart';

import '../../core/network/api_endpoints.dart';
import '../../core/services/http/http_service.dart';
import '../../core/utils/utility.dart';
import 'auth_datasource.dart';

class AuthDatasourceImpl implements AuthDatasource {
  final HttpService _http;
  AuthDatasourceImpl(this._http);

  @override
  Future<bool> login(LoginRequest data) async {
    bool result = false;
    try {
      final res = await _http.post(kLoginEndpoint, json.encode(data.toJson()));
      if (res.statusCode.isSuccessful) {
        final data = json.decode(res.body);
        Utility.debugPrint(data);
        result = data['message'] == "success";
      } else {
        final data = json.decode(res.body);
        throw Exception(data['message']);
      }
    } catch (e) {
      rethrow;
    }
    return result;
  }
}

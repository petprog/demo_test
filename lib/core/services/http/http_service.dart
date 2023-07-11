import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../../utils/static_variables.dart';
import '../../utils/utility.dart';

class HttpService {
  final _client = http.Client();

  Future<http.Response> _interceptRequest(http.BaseRequest request) async {
    request.headers["Content-Type"] = "application/json";
    request.headers["Accept"] = "application/json";
    request.headers["Authorization"] = 'Bearer ${StaticVariables.token}';
    var response = await _client.send(request);
    return http.Response.fromStream(response);
  }

  Future<http.Response> _interceptResponse(http.Response response) async {
    Utility.debugPrint(response.toString());
    return response;
  }

  Future<http.Response> _handleError(dynamic error) async {
    if (error is TimeoutException) {
      throw TimeoutException('Request timed out.');
    } else if (error is SocketException) {
      throw const SocketException(
          'Connection failed. Please check your internet connection.');
    } else if (error is FormatException) {
      throw const FormatException('Invalid URL. Please provide a valid URL.');
    } else {
      throw Exception('An error occurred: $error');
    }
  }

  Future<http.Response> get(String url) async {
    late http.Response response;
    try {
      var request = http.Request('GET', Uri.parse(url));
      response = await _interceptRequest(request);
      response = await _interceptResponse(response);
    } catch (e) {
      await _handleError(e);
    }
    return response;
  }

  Future<http.Response> post(String url, dynamic body) async {
    late http.Response response;
    try {
      var request = http.Request('POST', Uri.parse(url));
      request.body = body;
      response = await _interceptRequest(request);
      response = await _interceptResponse(response);
    } catch (e) {
      await _handleError(e);
    }
    return response;
  }

  Future<http.Response> put(String url, dynamic body) async {
    late http.Response response;
    try {
      var request = http.Request('PUT', Uri.parse(url));
      request.body = body;
      response = await _interceptRequest(request);
      response = await _interceptResponse(response);
    } catch (e) {
      await _handleError(e);
    }
    return response;
  }

  Future<http.Response> delete(String url) async {
    late http.Response response;
    try {
      var request = http.Request('DELETE', Uri.parse(url));
      response = await _interceptRequest(request);
      response = await _interceptResponse(response);
    } catch (e) {
      await _handleError(e);
    }
    return response;
  }

  Future<http.Response> uploadImage(String url, String filePath) async {
    late http.Response response;
    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.files.add(await http.MultipartFile.fromPath('avatar', filePath));
      response = await _interceptRequest(request);
      response = await _interceptResponse(response);
    } catch (e) {
      await _handleError(e);
    }
    return response;
  }

  Future<http.Response> uploadDocument(
      String url, String filePath, String docType) async {
    late http.Response response;
    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.files
          .add(await http.MultipartFile.fromPath('document', filePath));
      request.fields['document_type'] = docType;
      response = await _interceptRequest(request);
      response = await _interceptResponse(response);
    } catch (e) {
      await _handleError(e);
    }
    return response;
  }
}

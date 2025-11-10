import 'package:dio/dio.dart';

abstract class BaseApiServices {
  Future<Map<String, dynamic>?> post(
    String endPoint,
    Map<String, dynamic> data, {
    Map<String, dynamic> queryParameters = const {},
    CancelToken? cancelToken,
  });
  Future<Map<String, dynamic>?> update(
    String endPoint,
    Map<String, dynamic> data, {
    Map<String, dynamic> queryParameters = const {},
    CancelToken? cancelToken,
  });
  Future<Map<String, dynamic>> postFile(
    String endPoint,
    Map<String, dynamic> data, {
    Map<String, dynamic> queryParameters = const {},
    CancelToken? cancelToken,
  });
  Future<Map<String, dynamic>?> get(
    String endPoint, {
    Map<String, dynamic> queryParameters = const {},
    CancelToken? cancelToken,
  });
  Future<Map<String, dynamic>?> delete(
    String endPoint,
    Map<String, dynamic> data, {
    Map<String, dynamic> queryParameters = const {},
    CancelToken? cancelToken,
  });
}

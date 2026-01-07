import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response, MultipartFile, FormData;
import 'package:structure_mvvm/data/exceptions/app_exceptions.dart';
import 'package:structure_mvvm/data/network/base_api_service.dart';
import 'package:structure_mvvm/utils/utils.dart';

class NetworkApiServices extends BaseApiServices {
  final Dio dio;
  NetworkApiServices(this.dio);

  dynamic returnResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = response.data;
        return responseJson;
      case 201:
        dynamic responseJson = response.data;
        return responseJson;
      case 400:
        dynamic responseJson = response.data;
        return responseJson;
      case 401:
        dynamic responseJson = response.data;
        return responseJson;
      case 403:
        dynamic responseJson = response.data;
        return responseJson;
      case 404:
        dynamic responseJson = response.data;
        return responseJson;
      case 409:
        dynamic responseJson = response.data;
        return responseJson;
      case 410:
        dynamic responseJson = response.data;
        return responseJson;
      case 422:
        dynamic responseJson = response.data;
        return responseJson;
      case 500:
        dynamic responseJson = response.data;
        return responseJson;
      case 503:
        dynamic responseJson = response.data;
        return responseJson;

      default:
        throw FetchDataException(
          "Error while communicating with server ${response.statusCode}",
        );
    }
  }

  @override
  Future<Map<String, dynamic>> post(
    String endPoint,
    Map<String, dynamic> data, {
    Map<String, dynamic> queryParameters = const {},
    CancelToken? cancelToken,
  }) async {
    try {
      Response response;
      response = await dio.post(
        endPoint,
        data: jsonEncode(data),
        cancelToken: cancelToken,
        queryParameters: queryParameters,
      );
      return returnResponse(response);
    } on DioException catch (e) {
      return handleError(e);
    } catch (e) {
      Utils.errorSnackBar(Get.context!, "Unexpected error: ${e.toString()}");

      throw UnknownException("Unexpected error: ${e.toString()}");
    }
  }

  @override
  Future<Map<String, dynamic>?> delete(
    String endPoint,
    Map<String, dynamic> data, {
    Map<String, dynamic> queryParameters = const {},
    CancelToken? cancelToken,
  }) async {
    try {
      Response response;
      response = await dio.delete(
        endPoint,
        data: jsonEncode(data),
        cancelToken: cancelToken,
        queryParameters: queryParameters,
      );
      return returnResponse(response);
    } on DioException catch (e) {
      return handleError(e);
    } catch (e) {
      Utils.errorSnackBar(Get.context!, "Unexpected error: ${e.toString()}");
      throw UnknownException("Unexpected error: ${e.toString()}");
    }
  }

  @override
  Future<Map<String, dynamic>?> update(
    String endPoint,
    Map<String, dynamic> data, {
    Map<String, dynamic> queryParameters = const {},
    CancelToken? cancelToken,
  }) async {
    try {
      Response response;
      dynamic body;
      if (data.values.any((element) => element is MultipartFile)) {
        body = FormData.fromMap(data);
      } else {
        body = jsonEncode(data);
      }

      response = await dio.put(
        endPoint,
        data: body,
        cancelToken: cancelToken,
        queryParameters: queryParameters,
      );
      return returnResponse(response);
    } on DioException catch (e) {
      return handleError(e);
    } catch (e) {
      Utils.errorSnackBar(Get.context!, "Unexpected error: ${e.toString()}");
      throw UnknownException("Unexpected error: ${e.toString()}");
    }
  }

  @override
  Future<Map<String, dynamic>> postFile(
    String endPoint,
    Map<String, dynamic> data, {
    Map<String, dynamic> queryParameters = const {},
    CancelToken? cancelToken,
  }) async {
    try {
      Response? response;
      response = await dio.post(
        endPoint,
        data: FormData.fromMap(data),
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        options: Options(method: 'POST', contentType: 'multipart'),
      );

      return returnResponse(response);
    } on DioException catch (e) {
      return handleError(e);
    } catch (e) {
      Utils.errorSnackBar(Get.context!, "Unexpected error: ${e.toString()}");
      throw UnknownException("Unexpected error: ${e.toString()}");
    }
  }

  @override
  Future<Map<String, dynamic>?> get(
    String endPoint, {
    Map<String, dynamic> queryParameters = const {},
    CancelToken? cancelToken,
  }) async {
    try {
      Response? response;
      response = await dio.get(
        endPoint,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
      );
      return returnResponse(response);
    } on DioException catch (e) {
      return handleError(e);
    } catch (e) {
      Utils.errorSnackBar(Get.context!, "Unexpected error: ${e.toString()}");
      throw UnknownException("Unexpected error: ${e.toString()}");
    }
  }

  handleError(DioException e) {
    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.sendTimeout ||
        e.type == DioExceptionType.receiveTimeout) {
      Utils.errorSnackBar(Get.context!, "Request timed out. Please try again.");

      throw RequestTimeOut("Request timed out. Please try again.");
    } else if (CancelToken.isCancel(e)) {
      Utils.errorSnackBar(
        Get.context!,
        "Request Cancelled: The request was cancelled",
      );
      throw RequestCancelledException(e.toString());
    } else if (e.type == DioExceptionType.connectionError ||
        e.error is SocketException) {
      Utils.errorSnackBar(
        Get.context!,
        "No internet connection or server unreachable.",
      );
      throw InternetException("No internet connection or server unreachable.");
    } else if (e.type == DioExceptionType.badResponse) {
      if ((e.response?.data ?? "").isNotEmpty) {
        return returnResponse(e.response!);
      } else {
        Utils.errorSnackBar(Get.context!, "Failed to connect to the server.");

        throw ServerException("Failed to connect to the server.");
      }
    } else {
      Utils.errorSnackBar(Get.context!, "Unexpected error: ${e.toString()}");
      throw UnknownException("Unexpected error: ${e.toString()}");
    }
  }
}

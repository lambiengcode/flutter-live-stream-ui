// Dart imports:
import 'dart:async';
import 'dart:convert' as convert;

// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:dio/dio.dart' as diox;

// Project imports:
import 'package:streamskit_mobile/core/app/constant/constants.dart';
import 'package:streamskit_mobile/core/types/http_status_code.dart';
import 'package:streamskit_mobile/core/types/service_method.dart';
import 'package:streamskit_mobile/core/util/logger.dart';
import 'package:streamskit_mobile/core/util/stop_watch_api.dart';

class BaseRemoteData {
  var dio = diox.Dio(diox.BaseOptions(
    baseUrl: serviceBaseEndpoint,
    connectTimeout: connectTimeOut,
    receiveTimeout: receiveTimeOut,
    sendTimeout: receiveTimeOut,
  )); // with default Options

  Future<diox.Response<dynamic>> downloadFile(
      String url, String path, Function onReceive) async {
    var response = await dio.download(
      url,
      path,
      options: getOptions(),
      onReceiveProgress: (received, total) {
        onReceive(received, total);
      },
    );
    return response;
  }

  Future<diox.Response<dynamic>> postFormData(
    String gateway,
    diox.FormData formData,
  ) async {
    try {
      var response = await dio.post(
        gateway,
        data: formData,
        options: getOptions(),
        onSendProgress: (send, total) {},
        onReceiveProgress: (received, total) {},
      );

      return response;
    } on diox.DioError catch (exception) {
      return catchDioError(exception: exception, gateway: gateway);
    }
  }

  Future<diox.Response<dynamic>> putFormData(
    String gateway,
    diox.FormData formData,
  ) async {
    try {
      var response = await dio.put(
        gateway,
        data: formData,
        options: getOptions(),
        onSendProgress: (send, total) {},
        onReceiveProgress: (received, total) {},
      );
      return response;
    } on diox.DioError catch (exception) {
      return catchDioError(exception: exception, gateway: gateway);
    }
  }

  Future<diox.Response<dynamic>> postRoute(
      String gateway, Map<String, dynamic> body,
      {String? query}) async {
    try {
      Map<String, String> paramsObject = {};
      if (query != null) {
        query.split('&').forEach((element) {
          paramsObject[element.split('=')[0].toString()] =
              element.split('=')[1].toString();
        });
      }
      var response = kDebugMode
          ? await StopWatch.stopWatchApi(
              () => dio.post(
                    gateway,
                    data: convert.jsonEncode(body),
                    options: getOptions(),
                    queryParameters: query == null ? null : paramsObject,
                  ),
              ServiceMethod.post.methodName,
              gateway)
          : await dio.post(
              gateway,
              data: convert.jsonEncode(body),
              options: getOptions(),
              queryParameters: query == null ? null : paramsObject,
            );
      return response;
    } on diox.DioError catch (exception) {
      return catchDioError(exception: exception, gateway: gateway);
    }
  }

  Future<diox.Response<dynamic>> putRoute(
    String gateway,
    Map<String, dynamic> body,
  ) async {
    try {
      var response = kDebugMode
          ? await StopWatch.stopWatchApi(
              () => dio.put(
                    gateway,
                    data: convert.jsonEncode(body),
                    options: getOptions(),
                  ),
              ServiceMethod.put.methodName,
              gateway)
          : await dio.put(
              gateway,
              data: convert.jsonEncode(body),
              options: getOptions(),
            );
      return response;
    } on diox.DioError catch (exception) {
      return catchDioError(exception: exception, gateway: gateway);
    }
  }

  Future<diox.Response<dynamic>> patchRoute(
    String gateway, {
    String? query,
    Map<String, dynamic>? body,
  }) async {
    try {
      Map<String, String> paramsObject = {};
      if (query != null) {
        query.split('&').forEach((element) {
          paramsObject[element.split('=')[0].toString()] =
              element.split('=')[1].toString();
        });
      }

      var response = kDebugMode
          ? await StopWatch.stopWatchApi(
              () => dio.patch(
                    gateway,
                    data: body == null ? null : convert.jsonEncode(body),
                    options: getOptions(),
                    queryParameters: query == null ? null : paramsObject,
                  ),
              ServiceMethod.patch.methodName,
              gateway)
          : await dio.patch(
              gateway,
              data: body == null ? null : convert.jsonEncode(body),
              options: getOptions(),
              queryParameters: query == null ? null : paramsObject,
            );
      return response;
    } on diox.DioError catch (exception) {
      return catchDioError(exception: exception, gateway: gateway);
    }
  }

  Future<diox.Response<dynamic>> getRoute(
    String gateway, {
    String? params,
    String? query,
  }) async {
    try {
      Map<String, String> paramsObject = {};
      if (query != null) {
        query.split('&').forEach((element) {
          paramsObject[element.split('=')[0].toString()] =
              element.split('=')[1].toString();
        });
      }

      var response = kDebugMode
          ? await StopWatch.stopWatchApi(
              () => dio.get(
                    gateway,
                    options: getOptions(),
                    queryParameters: query == null ? null : paramsObject,
                  ),
              ServiceMethod.get.methodName,
              gateway)
          : await dio.get(
              gateway,
              options: getOptions(),
              queryParameters: query == null ? null : paramsObject,
            );
      return response;
    } on diox.DioError catch (exception) {
      return catchDioError(exception: exception, gateway: gateway);
    }
  }

  Future<diox.Response<dynamic>> deleteRoute(
    String gateway, {
    String? params,
    String? query,
    Map<String, dynamic>? body,
    diox.FormData? formData,
  }) async {
    try {
      Map<String, String> paramsObject = {};
      if (query != null) {
        query.split('&').forEach((element) {
          paramsObject[element.split('=')[0].toString()] =
              element.split('=')[1].toString();
        });
      }

      var response = kDebugMode
          ? await StopWatch.stopWatchApi(
              () => dio.delete(
                    gateway,
                    data: formData ??
                        (body == null ? null : convert.jsonEncode(body)),
                    options: getOptions(),
                    queryParameters: query == null ? null : paramsObject,
                  ),
              ServiceMethod.delete.methodName,
              gateway)
          : await dio.delete(
              gateway,
              data:
                  formData ?? (body == null ? null : convert.jsonEncode(body)),
              options: getOptions(),
              queryParameters: query == null ? null : paramsObject,
            );
      return response;
    } on diox.DioError catch (exception) {
      return catchDioError(exception: exception, gateway: gateway);
    }
  }

  diox.Response catchDioError({
    required diox.DioError exception,
    required String gateway,
  }) {
    return diox.Response(
      requestOptions: diox.RequestOptions(path: gateway),
      data: null,
      statusCode: StatusCode.badGateway,
      statusMessage: "CATCH EXCEPTION DIO",
    );
  }

  diox.Options getOptions() {
    return diox.Options(
      validateStatus: (status) {
        // if (status == StatusCode.unauthorized &&
        //     UserLocal().getAccessToken().isNotEmpty) {
        //   UserLocal().clearAccessToken();
        //   showDialogLoading();
        //   AppBloc.authBloc.add(LogOutEvent());
        // }
        return true;
      },
      headers: getHeaders(),
    );
  }

  getHeaders() {
    return {
      'Authorization': 'Bearer ',
      'Content-Type': 'application/json; charset=UTF-8',
      'Connection': 'keep-alive',
      'Accept': '*/*',
      'Accept-Encoding': 'gzip, deflate, br',
    };
  }

  printEndpoint(String method, String endpoint) {
    UtilLogger.log('${method.toUpperCase()}: $endpoint');
  }

  printResponse(diox.Response<dynamic> response) {
    UtilLogger.log('StatusCode: ${response.statusCode}');
    UtilLogger.log('Body: ${response.data.toString()}');
  }
}

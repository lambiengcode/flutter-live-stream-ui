// Dart imports:
import 'dart:async';
import 'dart:convert' as convert;

// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart' as diox;
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';

// Project imports:
import 'package:streamskit_mobile/core/app/constant/constants.dart';
import 'package:streamskit_mobile/core/types/http_status_code.dart';
import 'package:streamskit_mobile/core/types/service_method.dart';
import 'package:streamskit_mobile/core/util/dio_transformer.dart';
import 'package:streamskit_mobile/core/util/logger.dart';
import 'package:streamskit_mobile/core/util/path_helper.dart';
import 'package:streamskit_mobile/core/util/stop_watch_api.dart';

class BaseRemoteData {
  static diox.Dio dio = diox.Dio(diox.BaseOptions(
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

  static Future<void> configureDio() async {
    // Integration cookie
    String tempDir = await PathHelper.tempDirStreamOS;
    String localHiveDir = await PathHelper.localStoreDirStreamOS;
    final PersistCookieJar cookieJar = PersistCookieJar(
      storage: FileStorage(tempDir),
    );
    dio.interceptors.add(CookieManager(cookieJar));

    // Integration retry
    dio.interceptors.add(RetryInterceptor(
      dio: dio,
      logPrint: print, // specify log function (optional)
      retries: 3, // retry count (optional)
      retryDelays: const [
        // set delays between retries (optional)
        Duration(seconds: 1), // wait 1 sec before first retry
        Duration(seconds: 2), // wait 2 sec before second retry
        Duration(seconds: 3), // wait 3 sec before third retry
      ],
    ));

    // Integration cache
    final CacheOptions cacheOptions = CacheOptions(
      // A default store is required for interceptor.
      store: HiveCacheStore(localHiveDir),

      // All subsequent fields are optional.
      // Default.
      policy: CachePolicy.request,
      // Returns a cached response on error but for statuses 401 & 403.
      // Also allows to return a cached response on network errors (e.g. offline usage).
      // Defaults to [null].
      hitCacheOnErrorExcept: [StatusCode.unauthorized, StatusCode.forbiden],
      // Overrides any HTTP directive to delete entry past this duration.
      // Useful only when origin server has no cache config or custom behaviour is desired.
      // Defaults to [null].
      maxStale: const Duration(milliseconds: connectTimeOut),
      // Default. Allows 3 cache sets and ease cleanup.
      priority: CachePriority.normal,
      // Default. Body and headers encryption with your own algorithm.
      cipher: null,
      // Default. Key builder to retrieve requests.
      keyBuilder: CacheOptions.defaultCacheKeyBuilder,
      // Default. Allows to cache POST requests.
      // Overriding [keyBuilder] is strongly recommended when [true].
      allowPostMethod: false,
    );
    dio.interceptors.add(DioCacheInterceptor(options: cacheOptions));

    // Transform
    dio.transformer = DioTransformer(); // replace dio default transformer
  }

  printEndpoint(String method, String endpoint) {
    UtilLogger.log('${method.toUpperCase()}: $endpoint');
  }

  printResponse(diox.Response<dynamic> response) {
    UtilLogger.log('StatusCode: ${response.statusCode}');
    UtilLogger.log('Body: ${response.data.toString()}');
  }
}

// Package imports:
import 'package:dio/dio.dart';

// Project imports:
import 'package:streamskit_mobile/core/app/constant/constants.dart';
import 'package:streamskit_mobile/core/util/logger.dart';

class StopWatch {
  static Future<Response> stopWatchApi(
      Future<Response> Function() next, String method, String endpoint) async {
    DateTime startTime = DateTime.now();
    var result = await next();
    DateTime endTime = DateTime.now();
    int duration = endTime.difference(startTime).inMilliseconds;
    if (duration >= delayASecond) {
      UtilLogger.log(
          'WARNING RESPONSE TIME', '**********************************');
      UtilLogger.log(
          'WARNING RESPONSE TIME', '$method: $endpoint - ${duration}ms\n');
      UtilLogger.log(
          'WARNING RESPONSE TIME', '**********************************');
    }
    return result;
  }
}

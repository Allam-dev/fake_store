import 'package:logger/logger.dart';

abstract class LoggerUtils {
  static final Logger _logger = Logger();

  static debug(String message) {
    _logger.d(message);
  }

  static error(message) {
    _logger.e(message);
  }

  static information(message) {
    _logger.i(message);
  }

  static warning(message) {
    _logger.w(message);
  }

  // static void httpSuccess({required String requestName, required http.Response response}){
  //   AppLog.debug("start ($requestName) request\nrequest information : (${response.request})\nresponse code : (${response.statusCode})\nresponse : (${response.body})\nend ($requestName) request");
  // }

  // static void httpError({required String requestName, required http.Response response}){
  //   AppLog.error("start ($requestName) request\nrequest information : (${response.request})\nresponse code : (${response.statusCode})\nresponse : (${response.body})\nend ($requestName) request");
  // }
}

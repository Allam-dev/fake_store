import 'dart:async';

import 'package:dio/dio.dart';
import 'package:fake_store/data_providers/remote/api/api_error_handler.dart';
import 'package:fake_store/data_providers/remote/api/api_methods.dart';
import 'package:fake_store/generated/l10n.dart';
import 'package:fake_store/utils/log.dart';
import 'package:fake_store/widgets/snack_bar_without_context.dart';

class ApiServices {
  ApiServices._privateConstructor() {
    _dio = Dio(_baseOptions);
  }
  static final ApiServices instance = ApiServices._privateConstructor();

  late Dio _dio;

  final BaseOptions _baseOptions = BaseOptions(
    baseUrl: "https://fakestoreapi.com/",
    // connectTimeout: 5000,
    // receiveTimeout: 3000,
  );

  Options _setOptions({Options? options, required ApiMethods method}) {
    if (options == null) {
      return Options(method: method.toText);
    } else {
      options.method = method.toText;
      return options;
    }
  }

  void _printResponse(Response response) {
    Log.debug(
        "status code : ${response.statusCode}\nstatus message : ${response.statusMessage}\ndata : ${response}");
  }

  Future<Response?> request({
    required ApiMethods method,
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    Options? options,
    dynamic data,
    CancelToken? cancelToken,
    void Function(int, int)? onReceiveProgress,
    void Function(int, int)? onSendProgress,
  }) async {
    try {
      Response response = await _dio.request(
        endPoint,
        queryParameters: queryParameters,
        options: _setOptions(method: method, options: options),
        data: data,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
        onSendProgress: onSendProgress,
      );
      _printResponse(response);
      return response;
    } on DioError catch (exception) {
      if (exception.type == DioErrorType.response) {
        _printResponse(exception.response!);
        return exception.response;
      } else {
        ApiErrorHandler.handle(exception);
      }
    } catch (exception) {
      Log.error(exception);
      SnackBarWithoutContext.show(message: S.current.something_went_wrong);
    }
  }
}

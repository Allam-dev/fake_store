import 'package:dio/dio.dart';
import 'package:fake_store/utils/log.dart';
import 'package:fake_store/generated/l10n.dart';
import 'package:fake_store/widgets/snack_bar_without_context.dart';

abstract class ApiErrorHandler{
  static void handle(DioError error){
    if(error.type == DioErrorType.connectTimeout || error.type == DioErrorType.receiveTimeout || error.type == DioErrorType.sendTimeout){
      Log.error(error);
      SnackBarWithoutContext.show(message: "${S.current.it_take_long_time}\n${S.current.check_your_internet_connection}");
    }else if(error.type == DioErrorType.cancel){
      Log.error(error);
      SnackBarWithoutContext.show(message: S.current.the_request_is_cancelled);
    }else{
      Log.error(error);
      SnackBarWithoutContext.show(message: S.current.something_went_wrong);
    }
  }
}
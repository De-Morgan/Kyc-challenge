import 'package:dio/dio.dart';

class ApiError {
  int errorType = 0;
  ApiErrorModel apiErrorModel;
  String errorDescription;

  ApiError({this.errorDescription});

  ApiError.fromDio(Object dioError) {
    _handleError(dioError);
  }

  void _handleError(Object error) {
    if (error is DioError) {
      DioError dioError = error; // as DioError;
      switch (dioError.type) {
        case DioErrorType.CANCEL:
          errorDescription = "Request to API server was cancelled";
          break;
        case DioErrorType.CONNECT_TIMEOUT:
          errorDescription =
              "Connection timeout with API server, please try again later";
          break;
        case DioErrorType.DEFAULT:
          errorDescription =
              "Connection to API server failed due to internet connection, please check and try again";
          break;
        case DioErrorType.RECEIVE_TIMEOUT:
          errorDescription =
              "Receive timeout in connection with API server, please try again later.";
          break;
        case DioErrorType.RESPONSE:
          this.errorType = dioError.response.statusCode;
          this.errorDescription = dioError.response.toString();
          break;
        case DioErrorType.SEND_TIMEOUT:
          errorDescription =
              "Connection to API server failed due to internet connection, please check and try again";
          break;
      }
    } else {
      errorDescription = "Something went wrong, try again";
    }
  }

  String extractDescriptionFromResponse(Response response) {
    String message = "";
    try {
      if (response?.data != null && response.data["message"] != null) {
        message = response.data["message"] as String;
      } else {
        message = response.statusMessage;
      }
    } catch (error, stackTrace) {
      message = response?.statusMessage ?? error.toString();
    }
    return message;
  }

  @override
  String toString() => '$errorDescription';
}

class ApiErrorModel {
  int code;
  String message;
  bool success;

  ApiErrorModel({
    this.code,
    this.message,
    this.success,
  });

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) => ApiErrorModel(
        code: json["code"] as int,
        message: json["message"] as String,
        success: json["success"] as bool,
      );
}

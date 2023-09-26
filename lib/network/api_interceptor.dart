import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:prezenty_card_app/utils/app_helper.dart';
import 'package:prezenty_card_app/utils/shared_prefs.dart';
import 'package:prezenty_card_app/utils/user.dart';


class ApiInterceptor extends Interceptor {
  int maxCharactersPerLine = 500;

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (UserDetails.apiToken.isNotEmpty) {
      if(!options.headers.containsKey('authorization')) {
        options.headers.addAll({"Authorization": "Bearer ${UserDetails.apiToken}"});
      }

      // options.headers.addAll({"Authorization": "Bearer $s1"});
    }

    log("!!!!!!!!!!!!!! Request Begin !!!!!!!!!!!!!!!!!!!!!");
    log(
        "REQUEST[${options.method}] => PATH: ${options.baseUrl}${options.path}");
    log("Headers:");
    options.headers.forEach((k, v) => log('$k: $v'));
    if (options.queryParameters != null) {
      log("QueryParameters:");
      options.queryParameters.forEach((k, v) => log('$k: $v'));
    }
    if (options.data != null) {
      try{
        log('body:');
        FormData d=options.data;
        d.fields.forEach((element) {
          log('${element.key}:${element. value}');
        });
      }catch(e){
        log("${options.data}");
      }
    }
    log("!!!!!!!!!!!!!!!!!!!! Request End !!!!!!!!!!!!!!!!!!!!!");

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log("************** Response Begin ************************");
    log("ResMethodType : [${response.requestOptions.method}]");
    log(
        "RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.baseUrl}${response.requestOptions.path}");
    if (response.statusCode == 401) {
      SharedPrefs.logOut();
      toastMessage('Unauthorized');
    }

    String responseAsString = response.data.toString();
    log(responseAsString);
    log("************** Response End ************************");

    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    log("#################### Error Begin #########################");
    if (err.response != null) {
      log('status code: ${err.response!.statusCode}');
      log('error response: ${err.response!.data.toString()}');

      if (err.response!.statusCode == 401) {
        SharedPrefs.logOut();
      }
    } else {
      log('${err.toString()}');
    }
    log("#################### Error End #########################");

    super.onError(err, handler);
  }

}

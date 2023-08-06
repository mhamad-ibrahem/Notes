import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:notes/Global/Core/Services/services.dart';
import '../../../Local/Core/Constant/Routes.dart';

class MiddleWare extends GetMiddleware {
  // i use it for check if user is login before so he don't need to login again so just get him to home screen

  @override
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    if (Services.userId != '') {
      return const RouteSettings(name: AppRoute.main);
    }

    return null;
  }
}

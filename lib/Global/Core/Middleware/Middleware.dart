
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../Local/Core/Middleware/MiddlewareRoutes.dart';
import '../Class/HiveKeys.dart';
import '../services/services.dart';

class MiddleWare extends GetMiddleware {
  // i use it for check if user is login before so he dont need to login again so just get him to home screen
  @override
  int? get priority => 1;
  Services services = Get.find();
  @override 
  RouteSettings? redirect(String? route){
     
   if(services.box.get(HiveKeys.tokenKeY) !=null){
   
    return const RouteSettings(name: MiddlewareRoutes.firstRoute);
   }
   
   return null;
  }
}

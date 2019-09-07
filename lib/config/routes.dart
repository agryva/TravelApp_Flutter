import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:travelapp/config/route_handler.dart';

class Routes {
  static String root = "/";
  static String dashboard = "/dashboard";
  static String detail = "/detail";

  static void configureRoutes(Router router) {
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
          print("ROUTE WAS NOT FOUND");
        }
    );

    router.define(root, handler: rootHandler);
    router.define(dashboard, handler: dashboardHandler);
    router.define(detail, handler: detailHandler);
  }
}
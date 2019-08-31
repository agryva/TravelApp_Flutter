import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:travelapp/view/dashboard.dart';
import 'package:travelapp/view/onboarding.dart';

var rootHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return OnBoardingWidget();
});

var dashboardHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return DashboardWidget();
});

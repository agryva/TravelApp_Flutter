import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:travelapp/onboarding.dart';

var rootHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return OnBoardingWidget();
});

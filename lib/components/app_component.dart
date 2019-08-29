import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travelapp/config/application.dart';
import 'package:travelapp/config/routes.dart';

class AppComponent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AppComponentState();
  }
}

class _AppComponentState extends State<AppComponent> {
  _AppComponentState() {
    final router = Router();
    Routes.configureRoutes(router);
    Application.router = router;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Traval App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      onGenerateRoute: Application.router.generator,
    );
  }
}

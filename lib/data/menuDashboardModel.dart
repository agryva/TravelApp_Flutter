import 'package:flutter/material.dart';

class MenuDashboardModel {
  IconData icon;
  Color color;
  String title;

  MenuDashboardModel({this.icon, this.color, this.title});
}

var listMenuDashboard = [
  MenuDashboardModel(
      icon: Icons.flight_land, color: Color(0xff4FDCCF), title: "Flight"),
  MenuDashboardModel(
      icon: Icons.train, color: Color(0xff737CCE), title: "Train"),
  MenuDashboardModel(
      icon: Icons.directions_boat, color: Color(0xffFF724C), title: "Cruise"),
  MenuDashboardModel(
      icon: Icons.directions_bus, color: Color(0xffF4C406), title: "Bus"),
];

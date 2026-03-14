import 'package:flutter/material.dart';

class AppSpacing {

  static double w(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static double h(BuildContext context) =>
      MediaQuery.of(context).size.height;

  static EdgeInsets padding(
      BuildContext context, {
        double horizontal = 0,
        double vertical = 0,
      }) {
    return EdgeInsets.symmetric(
      horizontal: w(context) * horizontal,
      vertical: h(context) * vertical,
    );
  }

  static EdgeInsets horizontal(
      BuildContext context, {
        required double value,
      }) {
    return EdgeInsets.symmetric(
      horizontal: w(context) * value,
    );
  }

  static EdgeInsets vertical(
      BuildContext context, {
        required double value,
      }) {
    return EdgeInsets.symmetric(
      vertical: h(context) * value,
    );
  }

  static double width(BuildContext context, double value) {
    return w(context) * value;
  }

  static double height(BuildContext context, double value) {
    return h(context) * value;
  }
}
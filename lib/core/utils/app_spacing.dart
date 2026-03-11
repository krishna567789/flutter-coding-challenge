import 'package:flutter/material.dart';
import 'package:krishnacoadingchallenge/core/utils/responsiv.dart';
class AppSpacing {
  static EdgeInsets screenPadding(BuildContext context) {
    if (Responsive.isTablet(context)) {
      return const EdgeInsets.symmetric(horizontal: 40, vertical: 16);
    }

    return const EdgeInsets.symmetric(horizontal: 16, vertical: 8);
  }
}
import 'package:flutter/widgets.dart';

// extension Navigation on BuildContext {
//   Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
//     return Navigator.of(this).pushNamed(routeName, arguments: arguments);
//   }
//
//   Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
//     return Navigator.of(this)
//         .pushReplacementNamed(routeName, arguments: arguments);
//   }
//
//   Future<dynamic> pushNamedAndRemoveUntil(String routeName,
//       {Object? arguments, required RoutePredicate predicate}) {
//     return Navigator.of(this)
//         .pushNamedAndRemoveUntil(routeName, predicate, arguments: arguments);
//   }
//
//   void pop() => Navigator.of(this).pop();
// }

extension StringExtension on String? {
  bool isNullOrEmpty() => this == null || this == "";
}

extension ListExtension<T> on List<T>? {
  bool isNullOrEmpty() => this == null || this!.isEmpty;
}

extension MediaQueryExtension on BuildContext {
  double get width => MediaQuery.sizeOf(this).width;

  double get height => MediaQuery.sizeOf(this).height;

  double get devicePixelRatio => MediaQuery.of(this).devicePixelRatio;

  bool get isLandscape => MediaQuery.of(this).orientation == Orientation.landscape;

  bool get isPortrait => MediaQuery.of(this).orientation == Orientation.portrait;
}

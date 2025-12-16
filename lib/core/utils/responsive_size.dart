import 'package:flutter/material.dart';

/// Classe utilitaire pour gérer les dimensions responsive
/// Basée sur une largeur de référence de 375px (iPhone standard)
class ResponsiveSize {
  static const double _referenceWidth = 375.0;

  /// Obtient la largeur de l'écran
  static double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  /// Obtient la hauteur de l'écran
  static double screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  /// Convertit une valeur en pixels en valeur responsive
  /// Exemple: w(20) sur un écran de 375px = 20px
  ///          w(20) sur un écran de 750px = 40px
  static double w(BuildContext context, double pixels) {
    return (pixels / _referenceWidth) * screenWidth(context);
  }

  /// Convertit une valeur en pixels en valeur responsive pour la hauteur
  static double h(BuildContext context, double pixels) {
    return (pixels / 812.0) * screenHeight(context); // 812 = iPhone X height
  }

  /// Taille de police responsive
  static double sp(BuildContext context, double pixels) {
    return w(context, pixels);
  }

  /// Padding horizontal responsive
  static EdgeInsets horizontalPadding(BuildContext context, double pixels) {
    return EdgeInsets.symmetric(horizontal: w(context, pixels));
  }

  /// Padding vertical responsive
  static EdgeInsets verticalPadding(BuildContext context, double pixels) {
    return EdgeInsets.symmetric(vertical: h(context, pixels));
  }

  /// Padding responsive complet
  static EdgeInsets padding(
    BuildContext context, {
    double? all,
    double? horizontal,
    double? vertical,
    double? left,
    double? top,
    double? right,
    double? bottom,
  }) {
    if (all != null) {
      return EdgeInsets.all(w(context, all));
    }
    return EdgeInsets.only(
      left: left != null
          ? w(context, left)
          : (horizontal != null ? w(context, horizontal) : 0),
      top: top != null
          ? h(context, top)
          : (vertical != null ? h(context, vertical) : 0),
      right: right != null
          ? w(context, right)
          : (horizontal != null ? w(context, horizontal) : 0),
      bottom: bottom != null
          ? h(context, bottom)
          : (vertical != null ? h(context, vertical) : 0),
    );
  }

  /// Border radius responsive
  static BorderRadius radius(BuildContext context, double pixels) {
    return BorderRadius.circular(w(context, pixels));
  }
}

/// Extensions pour faciliter l'utilisation
extension ResponsiveExtension on num {
  /// Largeur responsive
  double w(BuildContext context) => ResponsiveSize.w(context, toDouble());

  /// Hauteur responsive
  double h(BuildContext context) => ResponsiveSize.h(context, toDouble());

  /// Taille de police responsive
  double sp(BuildContext context) => ResponsiveSize.sp(context, toDouble());
}

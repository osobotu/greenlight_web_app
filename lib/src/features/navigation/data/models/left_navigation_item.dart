import 'package:flutter/material.dart';

@immutable
class LeftNavigationItem {
  const LeftNavigationItem({
    required this.icon,
    required this.label,
    required this.route,
    required this.isSelected,
  });
  final IconData icon;
  final String label;
  final String route;
  final bool isSelected;

  LeftNavigationItem copyWith({
    IconData? icon,
    String? label,
    String? route,
    bool? isSelected,
  }) {
    return LeftNavigationItem(
      icon: icon ?? this.icon,
      label: label ?? this.label,
      route: route ?? this.route,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}

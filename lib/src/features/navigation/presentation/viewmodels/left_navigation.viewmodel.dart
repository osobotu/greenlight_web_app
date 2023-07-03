import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:greenlight_web/src/core/core.dart';
import 'package:greenlight_web/src/features/navigation/navigation.dart';

class LeftNavigationViewModel extends StateNotifier<List<LeftNavigationItem>> {
  LeftNavigationViewModel(List<LeftNavigationItem> items) : super([]) {
    state = items;
  }

  void selectNavItem(LeftNavigationItem item) {
    if (item.route.isNotEmpty && Utils.tabNavKey.currentContext != null) {
      GoRouter.of(Utils.tabNavKey.currentContext!).go(item.route);
    }

    state = [
      for (var element in state) element.copyWith(isSelected: item == element)
    ];
  }
}

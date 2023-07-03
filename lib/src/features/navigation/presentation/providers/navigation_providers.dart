import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:greenlight_web/src/features/navigation/navigation.dart';

final navigationRepositoryProvider = Provider<INavigationRepository>(
  (ref) {
    return MockNavigationRepository();
  },
);

final navigationItemsProvider = Provider<List<LeftNavigationItem>>(
  (ref) {
    return ref.read(navigationRepositoryProvider).getDefaultNavItems();
  },
);

final navigationItemsViewModelProvider =
    StateNotifierProvider<LeftNavigationViewModel, List<LeftNavigationItem>>(
  (ref) {
    final items = ref.read(navigationItemsProvider);
    return LeftNavigationViewModel(items);
  },
);

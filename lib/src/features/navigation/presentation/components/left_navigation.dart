import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:greenlight_web/src/features/navigation/navigation.dart';

class LeftNavigationView extends ConsumerWidget {
  const LeftNavigationView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<LeftNavigationItem> navItems =
        ref.watch(navigationItemsViewModelProvider);

    return SizedBox(
      width: 256,
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "Greenlight",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        ...List.generate(
          navItems.length,
          (index) {
            return LeftNavigationItemTile(
              item: navItems[index],
            );
          },
        ),
      ]),
    );
  }
}

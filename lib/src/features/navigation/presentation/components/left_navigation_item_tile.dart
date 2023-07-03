import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:greenlight_web/src/core/core.dart';
import 'package:greenlight_web/src/features/navigation/navigation.dart';

class LeftNavigationItemTile extends ConsumerWidget {
  const LeftNavigationItemTile({
    super.key,
    required this.item,
  });

  final LeftNavigationItem item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var navItemColor =
        item.isSelected ? Palette.black : Palette.black.withOpacity(0.25);
    return InkWell(
      onTap: () {
        ref.read(navigationItemsViewModelProvider.notifier).selectNavItem(item);
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: navItemColor),
        ),
        child: Row(
          children: [
            Icon(
              item.icon,
              color: navItemColor,
            ),
            const SizedBox(width: 16),
            Text(
              item.label,
              style: TextStyle(color: navItemColor),
            ),
          ],
        ),
      ),
    );
  }
}

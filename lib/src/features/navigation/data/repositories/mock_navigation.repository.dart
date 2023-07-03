import 'package:flutter/material.dart';
import 'package:greenlight_web/src/features/contact_us/contact_us.dart';
import 'package:greenlight_web/src/features/docs/docs.dart';
import 'package:greenlight_web/src/features/movies/movies.dart';

import 'package:greenlight_web/src/features/navigation/navigation.dart';

class MockNavigationRepository extends INavigationRepository {
  @override
  List<LeftNavigationItem> getDefaultNavItems() {
    return const [
      LeftNavigationItem(
        icon: Icons.movie,
        label: 'Movies',
        route: MoviesPage.route,
        isSelected: true,
      ),
      LeftNavigationItem(
        icon: Icons.notes,
        label: 'Docs',
        route: DocsPage.route,
        isSelected: false,
      ),
      LeftNavigationItem(
        icon: Icons.contact_page,
        label: 'Contact Us',
        route: ContactUsPage.route,
        isSelected: false,
      )
    ];
  }
}

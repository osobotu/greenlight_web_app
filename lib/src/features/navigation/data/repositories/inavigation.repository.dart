import 'package:greenlight_web/src/features/navigation/navigation.dart';

abstract class INavigationRepository {
  List<LeftNavigationItem> getDefaultNavItems();
}

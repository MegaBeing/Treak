import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:treak/Data/data.dart';
import 'package:treak/Models/section_model.dart';

final navigationRailItemProvider = StateNotifierProvider<
    NavigationRailItemNotifier,List<NavigationRailDestination>>(
  (ref) => NavigationRailItemNotifier(),
);

class NavigationRailItemNotifier
    extends StateNotifier<List<NavigationRailDestination>> {
  NavigationRailItemNotifier() : super(navigationRail);

  void createGroupIconsInNavigationRail(List<SectionModel> sections) {
    for (final section in sections) {
      navigationRail.add(
        NavigationRailDestination(
          icon: section.icon,
          selectedIcon: section.selectedIcon,
          label: Text(section.title),
        ),
      );
    }
  }

  void addGroup(SectionModel section) {
    navigationRail.add(
      NavigationRailDestination(
        icon: section.icon,
        selectedIcon: section.selectedIcon,
        label: Text(section.title),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:treak/Data/data.dart';
import 'package:treak/Models/section_model.dart';

final List<NavigationRailDestination> navigationRail = user.section.map((ele) {
  return NavigationRailDestination(
    icon: ele.icon,
    selectedIcon: ele.selectedIcon,
    label: Text(ele.title),
  );
}).toList();

class NavigationRailHelper
{
  void addGroup(SectionModel section) {
    navigationRail.add(
      NavigationRailDestination(
        selectedIcon: section.selectedIcon,
        icon: section.icon,
        label: Text(section.title),
      ),
    );
  }
}

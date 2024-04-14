import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:treak/Helpers/data_helper.dart';
import 'package:treak/Models/section_model.dart';
import 'package:treak/Models/task_model.dart';
import 'package:treak/Providers/date_provider.dart';
import 'package:treak/Widgets/AddData/add_group_widget.dart';
import 'package:treak/Widgets/AddData/add_task_widget.dart';
import 'package:treak/Widgets/Section-Widgets/section_widget.dart';
import 'package:treak/Widgets/timeline_widget.dart';

import '../Data/data.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {

  List<NavigationRailDestination> navigationRail = user.section.map((ele) {
    return NavigationRailDestination(
      icon: ele.icon,
      selectedIcon: ele.selectedIcon,
      label: Text(ele.title),
    );
  }).toList();

  void addSectionToUser(String sectionTitle, String icon) {
    addSection(sectionTitle, Icon(textToIconMap[icon]),
        Icon(sectionIconOnSelectMap[textToIconMap[icon]]));
    setState(() {
      navigationRail = user.section.map((ele) {
        return NavigationRailDestination(
          icon: ele.icon,
          selectedIcon: ele.selectedIcon,
          label: Text(ele.title),
        );
      }).toList();
      _isAddSectionButtonVisible = true;
      _isAddSectionFormVisible = false;
    });
  }

  void addTaskToSection(SectionModel section, TaskModel task) {
    setState(() {
      _isAddTaskButtonVisible = !_isAddTaskButtonVisible;
      addTask(section, task);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Created Task'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              removeTask(section, task);
            });
          },
        ),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  final PreferredSizeWidget bar = AppBar(
    backgroundColor: const Color(0xff2b2b2b),
    bottom: const PreferredSize(
      preferredSize: Size(double.infinity, 150),
      child: TimeLineWidget(),
    ),
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(32), bottomRight: Radius.circular(32))),
  );
  int _selectedIndex = 0;
  bool _isAddTaskButtonVisible = true;
  bool _isAddTaskFormVisible = false;
  bool _isAddSectionButtonVisible = true;
  bool _isAddSectionFormVisible = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final sectionList = user.section;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            onDestinationSelected: (idx) {
              setState(() {
                _selectedIndex = idx;
              });
            },
            destinations: navigationRail,
            selectedIndex: _selectedIndex,
            groupAlignment: 0.0,
            labelType: NavigationRailLabelType.selected,
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.person),
            ),
          ),
          const VerticalDivider(
            thickness: 1,
            width: 1,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 260,
                  child: bar,
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Stack(
                    children: [
                      SizedBox(
                        height: height - 270,
                        width: _isAddTaskButtonVisible
                            ? double.infinity - 400
                            : double.infinity,
                        child: (mapTaskToDate(
                                    sectionList[_selectedIndex].taskList,
                                    ref.watch(dateProvider))
                                .isEmpty)
                            ? const Center(
                                child: Text(
                                  'Add Tasks',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 46),
                                ),
                              )
                            : ListView(
                                physics: const BouncingScrollPhysics(),
                                children: [
                                  SectionWidget(
                                    title: sectionList[_selectedIndex].title,
                                    taskList:
                                        sectionList[_selectedIndex].taskList,
                                  ),
                                ],
                              ),
                      ),
                      Positioned(
                        right: 8,
                        bottom: 8,
                        child: Visibility(
                          visible: _isAddTaskFormVisible,
                          child: AddTaskWidget(
                            height: height - 540,
                            sectionList: sectionList,
                            addTask: addTaskToSection,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 8,
                        bottom: 8,
                        child: Visibility(
                          visible: _isAddSectionFormVisible,
                          child: AddGroupWidget(
                            height: height - 540,
                            addSection: addSectionToUser,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 80,
                        bottom: 20,
                        child: Visibility(
                          visible: _isAddSectionButtonVisible,
                          child: FloatingActionButton.extended(
                            onPressed: () {
                              setState(() {
                                _isAddSectionFormVisible = true;
                                _isAddSectionButtonVisible = false;
                              });
                            },
                            label: const Text('Add Section'),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 10,
                        bottom:
                            _isAddSectionFormVisible || _isAddTaskFormVisible
                                ? height - 570
                                : 20,
                        child: FloatingActionButton(
                          onPressed: () {
                            setState(() {
                              // cross operations
                              if (_isAddSectionFormVisible == true) {
                                _isAddSectionFormVisible = false;
                                _isAddSectionButtonVisible = true;
                              } else if (_isAddTaskFormVisible == true) {
                                _isAddTaskFormVisible = false;
                                _isAddSectionButtonVisible = true;
                              }
                              // Add operations
                              else {
                                _isAddTaskFormVisible = true;
                                _isAddSectionButtonVisible = false;
                              }
                            });
                          },
                          backgroundColor:
                              _isAddSectionFormVisible || _isAddTaskFormVisible
                                  ? Colors.red
                                  : const Color(0xff58CCA2),
                          child: Icon(
                            _isAddSectionFormVisible || _isAddTaskFormVisible
                                ? Icons.close
                                : Icons.add,
                            color: Colors.white,
                            size: 28,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

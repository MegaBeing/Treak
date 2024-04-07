import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:treak/Models/section_model.dart';
import 'package:treak/Models/task_model.dart';
import 'package:treak/Helpers/data_helper.dart';
import 'package:treak/Widgets/Section-Widgets/section_widget.dart';
import 'package:treak/Widgets/add_task_widget.dart';
import 'package:treak/Widgets/timeline_widget.dart';
import '../Data/data.dart';
import '../Helpers/navigation_rail_helper.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  void addTaskToSection(SectionModel section, TaskModel task) {
    addTask(section, task);
    setState(() {
      _isFormVisible = !_isFormVisible;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Created Task'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            removeTask(section, task);
          },
        ),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  bool _isFormVisible = false;
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

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final sectionList = user.section;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _isFormVisible = !_isFormVisible;
          });
        },
        backgroundColor: const Color(0xff58CCA2),
        child: Icon(
          _isFormVisible ? Icons.close : Icons.add,
          color: Colors.white,
          size: 28,
        ),
      ),
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
              icon: const Icon(Icons.add_box_outlined),
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
                        width: _isFormVisible
                            ? double.infinity - 400
                            : double.infinity,
                        child: ListView(
                          physics: const BouncingScrollPhysics(),
                          children: [
                            SectionWidget(
                              title: sectionList[_selectedIndex].title,
                              taskList: sectionList[_selectedIndex].taskList,
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        right: 8,
                        bottom: 8,
                        child: Visibility(
                          visible: _isFormVisible,
                          child: AddTaskScreen(
                            height: height - 540,
                            sectionList: sectionList,
                            addTask: addTaskToSection,
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

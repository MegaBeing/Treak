import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:treak/Providers/section_provider.dart';
import 'package:treak/Widgets/Section-Widgets/section_widget.dart';
import 'package:treak/Widgets/timeline_widget.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final PreferredSizeWidget bar = AppBar(
    backgroundColor: const Color(0xff2b2b2b),
    bottom: PreferredSize(
      preferredSize: const Size(double.infinity, 150),
      child: TimeLineWidget(),
    ),
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(32), bottomRight: Radius.circular(32))),
  );

  void newTask() {}

  Widget floatingButton = FloatingActionButton(
    onPressed: () {},
    backgroundColor: const Color(0xff58CCA2),
    child: const Icon(
      Icons.add,
      color: Colors.white,
      size: 28,
    ),
  );
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final sections = ref.watch(sectionProvider);
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      floatingActionButton: floatingButton,
      body: Row(
        children: [
          NavigationRail(
            onDestinationSelected: (idx) {
              setState(() {
                _selectedIndex = idx;
              });
            },
            destinations: const <NavigationRailDestination>[
              NavigationRailDestination(
                icon: Icon(Icons.favorite_border),
                selectedIcon: Icon(Icons.favorite),
                label: Text('First'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.bookmark_border),
                selectedIcon: Icon(Icons.book),
                label: Text('Second'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.star_border),
                selectedIcon: Icon(Icons.star),
                label: Text('Third'),
              ),
            ],
            selectedIndex: _selectedIndex,
            groupAlignment: 0.0,
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
              children: [
                SizedBox(
                  height: 260,
                  child: bar,
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: height - 270,
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      for (final section in sections)
                        SectionWidget(
                            title: section.title, taskList: section.taskList)
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

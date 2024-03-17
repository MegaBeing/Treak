import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:treak/Widgets/timeline_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final PreferredSizeWidget bar = AppBar(
    toolbarHeight: 150,
    leadingWidth: 10,
    title: const Text(
      "Treak",
      style: TextStyle(
        color: Colors.grey,
        fontSize: 32,
      ),
    ),
    backgroundColor: const Color(0xff2b2b2b),
    bottom: PreferredSize(
      preferredSize: const Size(200, 150),
      child: TimeLineWidget(),
    ),
    actions: [
      IconButton(onPressed: () {}, icon: const Icon(Icons.search,color: Colors.white,size: 10,)),
    ],
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(32), bottomRight: Radius.circular(32))),
  );
  Widget floatingButton = FloatingActionButton(
    onPressed: () {},
    backgroundColor: const Color(0xff58CCA2),
    child: const Icon(Icons.add, color: Colors.white, size: 28),
  );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: bar,
      floatingActionButton: floatingButton,
    );
  }
}

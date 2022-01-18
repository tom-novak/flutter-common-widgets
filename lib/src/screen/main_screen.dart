import 'package:flutter/material.dart';

class NavigationSlot {
  final String label;
  final String appBarTitle;
  final Icon icon;
  final Widget content;

  NavigationSlot({
    required this.label,
    String? appBarTitle,
    required this.icon,
    required this.content,
  }) : appBarTitle = appBarTitle ?? label;
}

class MainScreen extends StatefulWidget {
  final PreferredSizeWidget? appBar;
  final Widget? appBarTitle;
  final List<NavigationSlot> slots;

  const MainScreen({
    Key? key,
    required this.slots,
    this.appBar,
    this.appBarTitle,
  })  : assert(slots.length <= 5, 'Slots count cannot be bigger than 5.'),
        super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.appBar ??
          (widget.appBarTitle != null
              ? AppBar(title: widget.appBarTitle)
              : null),
      body: widget.slots[_selectedIndex].content,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: List<BottomNavigationBarItem>.generate(
          widget.slots.length,
          (index) => BottomNavigationBarItem(
            icon: widget.slots[index].icon,
            label: widget.slots[index].label,
          ),
        ),
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}

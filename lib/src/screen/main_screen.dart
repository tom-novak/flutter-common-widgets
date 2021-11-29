import 'package:flutter/material.dart';

class PageSlot {
  final String label;
  final String? appBarTitle;
  final Icon icon;
  final Widget content;

  PageSlot({
    required this.label,
    String? appBarTitle,
    required this.icon,
    required this.content,
  }) : appBarTitle = appBarTitle ?? label;
}

class MainScreen extends StatefulWidget {
  final List<PageSlot> slots;

  const MainScreen({
    Key? key,
    List<PageSlot>? slots,
  })  : slots = slots ?? const <PageSlot>[],
        super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Preview app'),
      ),
      body: widget.slots[_selectedIndex].content,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: List<BottomNavigationBarItem>.generate(
              widget.slots.length > 5 ? 4 : widget.slots.length,
              (index) => BottomNavigationBarItem(
                icon: widget.slots[index].icon,
                label: widget.slots[index].label,
              ),
            ) +
            [
              if (widget.slots.length > 5)
                const BottomNavigationBarItem(
                  icon: Icon(Icons.menu),
                  label: 'Next',
                ),
            ],
        currentIndex: _selectedIndex,
        onTap: (index) {
          if (widget.slots.length <= 5 ||
              (widget.slots.length > 5 && index < 4)) {
            setState(() {
              _selectedIndex = index;
            });
          } else {
            // TODO implement on burger menu tap
          }
        },
      ),
    );
  }
}

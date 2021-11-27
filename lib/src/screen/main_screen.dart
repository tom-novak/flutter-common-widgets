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
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.coffee_sharp),
            label: 'Work',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_bike),
            label: 'Bike',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grass),
            label: 'Chill',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grass),
            label: 'Chill',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grass),
            label: 'Chill',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grass),
            label: 'Chill',
          ),
        ],
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

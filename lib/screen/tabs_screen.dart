import 'package:flutter/material.dart';
import 'package:tours/models/trip.dart';
import 'package:tours/screen/catigories_screen.dart';
import 'package:tours/screen/favorite_screen.dart';
import 'package:tours/widgets/app_drawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Trip> favoriteTrips;
  const TabsScreen(this.favoriteTrips, {super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedScreenIndex = 0;
  late final List<Map<String, Object>> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      {'Screen': const CatigoriesScreen(), 'Title': 'تصنيفات الرحلات'},
      {
        'Screen': FavoriteScreen(widget.favoriteTrips),
        'Title': 'الرحلات المفضلة',
      },
    ];
  }

  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.black, // ✅ Matches CatigoriesTripsScreen
      drawer: const AppDrawer(),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: theme.colorScheme.primary, // ✅ Amber
        foregroundColor: theme.colorScheme.onPrimary, // ✅ White or dark text
        title: Text(
          _screens[_selectedScreenIndex]['Title'] as String,
          style: theme.textTheme.titleSmall?.copyWith(
            color: theme.colorScheme.onPrimary,
          ),
        ),
      ),
      body: _screens[_selectedScreenIndex]['Screen'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        currentIndex: _selectedScreenIndex,
        backgroundColor: theme.colorScheme.primary, // ✅ Amber
        selectedItemColor: theme.colorScheme.onPrimary,
        unselectedItemColor: theme.colorScheme.onPrimary.withOpacity(0.6),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: "التصنيفات",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "المفضلة"),
        ],
      ),
    );
  }
}

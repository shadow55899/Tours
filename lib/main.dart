// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tours/app_data.dart';
import 'package:tours/models/trip.dart';
import 'package:tours/screen/catigories_trips_screen.dart';
import 'package:tours/screen/fliter_screen.dart';
import 'package:tours/screen/tabs_screen.dart';
import 'package:tours/screen/trip_details_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'summer': false,
    'winter': false,
    'family': false,
  };
  List<Trip> _availableTrips = Trips_data;

  List<Trip> _favortieTrips = [];

  void _changeFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableTrips = Trips_data.where((trip) {
        if (_filters['summer'] == true && trip.isInSummer != true) {
          return false;
        }
        if (_filters['winter'] == true && trip.isInWinter != true) {
          return false;
        }
        if (_filters['family'] == true && trip.isForFamilies != true) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _manageFavorite(String tripId) {
    final existingIndex = _favortieTrips.indexWhere(
      (trip) => trip.id == tripId,
    );
    if (existingIndex >= 0) {
      setState(() {
        _favortieTrips.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favortieTrips.add(Trips_data.firstWhere((trip) => trip.id == tripId));
      });
    }
  }

  bool _isFavorite(String id) {
    return _favortieTrips.any((trip) => trip.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [Locale('ar', 'AE')],
      title: 'tour app',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'ElMessiri',
        textTheme: ThemeData.light().textTheme.copyWith(
          titleLarge: const TextStyle(
            fontFamily: 'ElMessiri',
            color: Color(0xFF212121), // primary text
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
          titleMedium: const TextStyle(
            fontFamily: 'ElMessiri',
            color: Color(0xFF212121),
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
          titleSmall: const TextStyle(
            fontFamily: 'ElMessiri',
            color: Colors.white,
            fontSize: 26.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        colorScheme: const ColorScheme(
          brightness: Brightness.dark,

          // 🎨 Primary brand color (amber accent)
          primary: Color(0xFFFFA600),
          onPrimary: Colors.black, // text/icons on amber
          // 🎨 Secondary / accent gray
          secondary: Color(0xFFA8A8A8),
          onSecondary: Colors.white,

          // 🎨 Background & surface
          background: Color(0xFF000000), // main background
          onBackground: Color(0xFFD0D0D0), // text/icons on background

          surface: Color(0xFF000000), // cards, panels
          onSurface: Color(0xFFD0D0D0), // text/icons on surface
          // 🎨 Error colors
          error: Colors.red,
          onError: Colors.white,
        ),
      ),
      routes: {
        '/': (ctx) => TabsScreen(_favortieTrips),
        CatigoriesTripsScreen.ScreenRoute: (ctx) =>
            CatigoriesTripsScreen(_availableTrips),
        TripDetailsScreen.ScreenRoute: (ctx) =>
            TripDetailsScreen(_manageFavorite, _isFavorite),
        FliterScreen.screenRoute: (ctx) =>
            FliterScreen(_changeFilters, _filters),
      },
    );
  }
}

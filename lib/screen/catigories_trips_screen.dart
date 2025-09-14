import 'package:flutter/material.dart';
import 'package:tours/models/trip.dart';
import 'package:tours/widgets/trip_item.dart';

class CatigoriesTripsScreen extends StatefulWidget {
  static const String ScreenRoute = '/catigorires_trips';
  final List<Trip> availableTrips;

  const CatigoriesTripsScreen(this.availableTrips, {super.key});

  @override
  State<CatigoriesTripsScreen> createState() => _CatigoriesTripsScreenState();
}

class _CatigoriesTripsScreenState extends State<CatigoriesTripsScreen> {
  late String catigoryTitle;
  late List<Trip> displayTrips;
  bool _loaded = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_loaded) return;

    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final catigoryId = args['id']!;
    catigoryTitle = args['title']!;
    displayTrips = widget.availableTrips
        .where((t) => t.catigories.contains(catigoryId))
        .toList();
    _loaded = true;
  }

  void removeTrip(String tripId) {
    setState(() {
      displayTrips.removeWhere((t) => t.id == tripId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.surface, // neutral background
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          catigoryTitle,
          style: theme.textTheme.titleSmall?.copyWith(
            color: theme.colorScheme.onPrimary,
          ),
        ),
        backgroundColor: theme.colorScheme.primary, // amber
        foregroundColor: theme.colorScheme.onPrimary,
      ),
      body: ListView.builder(
        itemCount: displayTrips.length,
        itemBuilder: (context, index) {
          final trip = displayTrips[index];
          return TripItem(
            id: trip.id,
            title: trip.title,
            imageUrl: trip.imageUrl,
            duration: trip.duration,
            tripeType: trip.tripeType,
            saason: trip.season,
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:tours/models/trip.dart';
import 'package:tours/widgets/trip_Item.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Trip> favoriteTrips;
  const FavoriteScreen(this.favoriteTrips, {super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (favoriteTrips.isEmpty) {
      return Container(
        color: Colors.black, // ✅ Full black background
        alignment: Alignment.center,
        child: Text(
          "ليس لديك رحلات مفضللة",
          style: theme.textTheme.titleSmall?.copyWith(color: Colors.white),
        ),
      );
    } else {
      return Container(
        color: Colors.black, // ✅ Full black background
        child: ListView.builder(
          itemCount: favoriteTrips.length,
          itemBuilder: (context, index) {
            final trip = favoriteTrips[index];
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
}

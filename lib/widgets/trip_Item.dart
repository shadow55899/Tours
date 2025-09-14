import 'package:flutter/material.dart';
import 'package:tours/models/trip.dart';
import 'package:tours/screen/trip_details_screen.dart';

class TripItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final TripeType tripeType;
  final Season saason;

  const TripItem({
    super.key,
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.tripeType,
    required this.saason,
  });

  String get seasonText {
    switch (saason) {
      case Season.Winter:
        return "شتاء";
      case Season.Spring:
        return "ربيع";
      case Season.Summer:
        return "صيف";
      case Season.Autumn:
        return "خريف";
    }
  }

  String get tripeTypeText {
    switch (tripeType) {
      case TripeType.Activities:
        return "أنشطة";
      case TripeType.Exploration:
        return "استكشاف";
      case TripeType.Recovery:
        return "نقاهة";
      case TripeType.Therapy:
        return "علاجية";
    }
  }

  void selectTrip(BuildContext context) {
    Navigator.of(
      context,
    ).pushNamed(TripDetailsScreen.ScreenRoute, arguments: id).then((result) {
      if (result is String) {
        // Handle removal if needed
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Material(
        borderRadius: BorderRadius.circular(15),
        clipBehavior: Clip.antiAlias,
        elevation: 7,
        child: InkWell(
          onTap: () => selectTrip(context),
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: 250,
                    width: double.infinity,
                    child: Image.network(imageUrl, fit: BoxFit.cover),
                  ),
                  Container(
                    height: 250,
                    alignment: Alignment.bottomRight,
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.black.withOpacity(0),
                          Colors.black.withOpacity(0.8),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: const [0.6, 1],
                      ),
                    ),
                    child: Text(
                      title,
                      style: Theme.of(context).textTheme.titleSmall,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ],
              ),
              Container(
                color: Theme.of(context).colorScheme.secondary,
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.today,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          "$duration أيام",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.family_restroom,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          tripeTypeText,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.sunny,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          seasonText,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

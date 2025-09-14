// ignore_for_file: use_key_in_widget_constructors, non_constant_identifier_names, unnecessary_string_interpolations, constant_identifier_names

import 'package:flutter/material.dart';
import 'package:tours/app_data.dart';

class TripDetailsScreen extends StatelessWidget {
  final Function manageFavorite;
  final Function isFavorite;
  static const String ScreenRoute = "/trip-detail";

  const TripDetailsScreen(this.manageFavorite, this.isFavorite);

  Widget buildSelectedTitle(BuildContext context, String buildtitle) {
    return Container(
      alignment: Alignment.topRight,
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Text(
        buildtitle,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
    );
  }

  Widget buildListViewWidget(BuildContext context, Widget child) {
    return Container(
      height: 225,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface, // lighter surface
        border: Border.all(color: Theme.of(context).dividerColor),
        borderRadius: BorderRadius.circular(15),
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final String tripID = ModalRoute.of(context)?.settings.arguments as String;
    final selectedTrip = Trips_data.firstWhere((trip) => trip.id == tripID);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary, // amber
        foregroundColor: Theme.of(context).colorScheme.onPrimary, // dark text
        title: Text(
          selectedTrip.title,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 250,
              width: double.infinity,
              child: Image.network(selectedTrip.imageUrl, fit: BoxFit.cover),
            ),
            buildSelectedTitle(context, "الأنشطة"),
            buildListViewWidget(
              context,
              ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                    elevation: 0.3,
                    color: Theme.of(context).colorScheme.secondary, // accent
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        selectedTrip.activites[index],
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Theme.of(context).colorScheme.onSecondary,
                        ),
                      ),
                    ),
                  );
                },
                itemCount: selectedTrip.activites.length,
              ),
            ),
            buildSelectedTitle(context, 'البرنامج اليومي'),
            buildListViewWidget(
              context,
              ListView.builder(
                itemBuilder: (ctx, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Theme.of(
                          context,
                        ).colorScheme.primary, // amber
                        child: Text(
                          "يوم ${index + 1}",
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                      title: Text(
                        selectedTrip.program[index],
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                    ),
                    Divider(color: Theme.of(context).dividerColor),
                  ],
                ),
                itemCount: selectedTrip.program.length,
              ),
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.primary, // amber
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        onPressed: () => manageFavorite(tripID),
        child: Icon(isFavorite(tripID) ? Icons.star : Icons.star_border),
      ),
    );
  }
}

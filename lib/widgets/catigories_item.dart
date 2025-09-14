import 'package:flutter/material.dart';
import 'package:tours/screen/catigories_trips_screen.dart';

class CatigoriesItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  // ignore: non_constant_identifier_names
  void SelectCatigory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      CatigoriesTripsScreen.ScreenRoute,
      arguments: {'id': id, 'title': title},
    );
  }

  // ignore: use_key_in_widget_constructors
  const CatigoriesItem(this.id, this.title, this.imageUrl);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: double.infinity,
      child: Material(
        borderRadius: BorderRadius.circular(15.0),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () => SelectCatigory(context),
          splashColor: Theme.of(context).primaryColorDark,
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.network(imageUrl, fit: BoxFit.cover),
              ),
              Container(
                decoration: BoxDecoration(color: Colors.black26),
                padding: EdgeInsets.all(30),
                alignment: Alignment.center,
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

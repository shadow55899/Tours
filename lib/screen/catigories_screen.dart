import 'package:flutter/material.dart';
import 'package:tours/widgets/catigories_item.dart';
import '../app_data.dart';

class CatigoriesScreen extends StatelessWidget {
  const CatigoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // ✅ full black background
      body: GridView(
        padding: const EdgeInsets.all(20),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 6 / 8,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        children: Catigories_data.map(
          (CatigoriesData) => CatigoriesItem(
            CatigoriesData.id,
            CatigoriesData.title,
            CatigoriesData.imageUrl,
          ),
        ).toList(),
      ),
    );
  }
}

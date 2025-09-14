// ignore_for_file: constant_identifier_names

enum Season { Winter, Spring, Summer, Autumn }

enum TripeType { Exploration, Recovery, Activities, Therapy }

class Trip {
  final String id;
  final List<String> catigories;
  final String title;
  final String imageUrl;
  final List<String> activites;
  final List<String> program;
  final int duration;
  final Season season;
  final TripeType tripeType;
  final bool isInSummer;
  final bool isInWinter;
  final bool isForFamilies;

  const Trip({
    required this.id,
    required this.catigories,
    required this.title,
    required this.imageUrl,
    required this.activites,
    required this.program,
    required this.duration,
    required this.season,
    required this.tripeType,
    required this.isInSummer,
    required this.isInWinter,
    required this.isForFamilies,
  });
}

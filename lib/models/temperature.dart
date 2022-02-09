import 'station.dart';

class Temperature {
  Station? station;
  DateTime? date;
  double? resultat;

  Temperature({
    required this.station,
    required this.date,
    required this.resultat
  });
}

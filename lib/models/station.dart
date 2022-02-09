import 'package:latlong2/latlong.dart';

class Station {
  String? code;
  String? libelle;
  LatLng? location;

  Station({
    required this.code,
    required this.libelle,
    required this.location
  });
}

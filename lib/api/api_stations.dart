import 'dart:convert';
import 'package:http/http.dart';
import 'package:hub_eau/models/station.dart';
import 'package:latlong2/latlong.dart';

class ApiStations {
  static const String baseUrl = "https://hubeau.eaufrance.fr/api/v1/temperature/station";


  static Future<List<Station>?> byRegion({ required int code }) async {
    Request request = Request(
      "GET",
      Uri.parse("$baseUrl?code_region=$code")
    );

    StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      String body = await response.stream.bytesToString();
      dynamic result = json.decode(body);

      List<Station> stations = [];
      for (dynamic station in result["data"]) {
        stations.add(Station(
          code: station["code_station"],
          libelle: station["libelle_station"],
          location: LatLng(
            station["latitude"],
            station["longitude"]
          )
        ));
      }
      return stations;
    }

    return null;
  }
}

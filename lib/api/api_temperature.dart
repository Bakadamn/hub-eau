import 'dart:convert';
import 'package:http/http.dart';
import 'package:hub_eau/models/station.dart';
import 'package:hub_eau/models/temperature.dart';

class ApiTemperatures {
  static const String baseUrl = "https://hubeau.eaufrance.fr/api/v1/temperature/chronique";

  static Future<Temperature?> lastTemperatureAtStation({ required Station station }) async {
    Request request = Request(
      "GET",
      Uri.parse("$baseUrl?code_station=${station.code}&size=1&sort=desc")
    );

    StreamedResponse response = await request.send();
    if (response.statusCode >= 200 && response.statusCode < 400) {
      String body = await response.stream.bytesToString();
      dynamic result = json.decode(body);


      return Temperature(
        station: station,
        date: DateTime.parse(result["data"].first["date_mesure_temp"]),
        resultat: result["data"].first["resultat"]
      );
    }

    return null;
  }
}

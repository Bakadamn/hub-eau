import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hub_eau/api/api_stations.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import 'front_elements.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hub\'Eau',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<Station>? stations;

  static List<Widget> stationsWidgetsFrom(List<Station>? stations) {
    if (stations == null) {
      return [
        const Text("Error: no data")
      ];
    }

    List<Widget> widgets = [];
    for (Station station in stations) {
      widgets.add(
        ListTile(
          onTap: null,
          title: Text(
            station.libelle!,
            style: const TextStyle(color: Colors.white)
          )
        )
      );
    }
    return widgets;
  }

  void retrieveStations() async {
    stations = await ApiStations.byDepartment(code: 76);
    setState(() {});
  }

  @override
  void initState() {
    retrieveStations();
    super.initState();
  }


  Widget infoStation = Container(height: 0,width: 0,);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    void afficherInfo(){
      showDialog(
          context: context,
          builder: (BuildContext buildContext){
        return infoWindow(size, context);

      });
    }

    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: Text(widget.title),

          ),
          drawer: Drawer(
              child : Column(

              )
          ),
          body: FlutterMap(
            options: MapOptions(
              center: LatLng(51.5, -0.09),
              zoom: 13.0,
            ),
            layers: [
              TileLayerOptions(
                urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                subdomains: ['a', 'b', 'c'],
                attributionBuilder: (_) {
                  return Text("© OpenStreetMap contributors");
                },
              ),
              MarkerLayerOptions(
                markers: [
                  Marker(
                    width: 80.0,
                    height: 80.0,
                    point: LatLng(51.5, -0.09),
                    builder: (ctx) =>
                        InkWell(
                          child: Image.asset("assets/goutte.png", fit: BoxFit.fitHeight,),
                          onTap: (){
                            setState(() {
                              afficherInfo();
                            });
                          },
                        ),
                  ),
                ],
              ),
            ],
          )
          ,
        ),
        infoStation
      ]

    );
  }
}

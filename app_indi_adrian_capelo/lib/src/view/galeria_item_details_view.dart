// ignore_for_file: prefer_const_constructors

import 'package:app_indi_adrian_capelo/src/model/galerias_datos.dart';
import 'package:flutter/material.dart';
import 'package:app_indi_adrian_capelo/src/service/galeria_service.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// Displays detailed information about a SampleItem.
class GaleriaItemDetailsView extends StatelessWidget {
  GaleriaItemDetailsView({Key? key, required this.galeria}) : super(key: key);

  final Galerias galeria;
  static const routeName = '/sample_item';

  @override
  Widget build(BuildContext context) {
    //Google maps
    List<Marker> marks = [];

    marks.add(Marker(
        markerId: MarkerId(galeria.nombre),
        position: LatLng(
            double.parse(galeria.latitud), double.parse(galeria.longitud)),
        infoWindow: InfoWindow(title: galeria.direccion)));

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.titulo),
      ),
      body: FutureBuilder<List<Galerias>>(
          future: GalleryService.getDatosGaleria(galeria),
          builder: (BuildContext context, snapshop) {
            //Mapa, no se muestra no se por que
            SizedBox(
                width: 400.0,
                height: 300.0,
                child: GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: LatLng(double.parse(galeria.latitud),
                        double.parse(galeria.longitud)),
                  ),
                  markers: Set<Marker>.of(marks),
                ));
            if (snapshop.hasData) {
              return ListView.builder(
                  itemCount: snapshop.data?.length,
                  itemBuilder: (BuildContext context, int index) {
                    var galeria = snapshop.data![index];
                    return GaleriaWigget(galeria);
                  });
            } else if (snapshop.hasError) {
              return Center(
                child: Text(
                  "Error:\n ${snapshop.error}",
                  // ignore: prefer_const_constructors
                  style: TextStyle(color: Colors.red),
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}

class GaleriaWigget extends StatelessWidget {
  final Galerias galeria;
  GaleriaWigget(this.galeria);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          /*
          Row(children: <Widget>[ 
            Image.network(
              galeria.foto,
              width: 100,
              height: 100,
            ),
          ]),
          */
          Text(galeria.nombre, style: TextStyle(fontWeight: FontWeight.bold)),
          Text("\n\n"),
          Text(AppLocalizations.of(context)!.direccion),
          Text("  " + galeria.direccion),
          Text(""),
          Text(AppLocalizations.of(context)!.email),
          Text("  " + galeria.email),
          Text(""),
          Text(AppLocalizations.of(context)!.codigoPostal),
          Text("  " + galeria.codigoPostal),
          Text(""),
          Text(AppLocalizations.of(context)!.municipio),
          Text("  " + galeria.municipio),
          Text(""),
          Text(AppLocalizations.of(context)!.pedania),
          Text("  " + galeria.pedania),
          Text(""),
          Text(AppLocalizations.of(context)!.contacto),
          Text("  " + galeria.telefono),
          Text(""),
          Text(AppLocalizations.of(context)!.web),
          Text("  " + galeria.webGaleria),
          Text("\n\n")
        ],
      ),
    ));
  }
}

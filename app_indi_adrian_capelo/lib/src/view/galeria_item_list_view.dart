import 'package:app_indi_adrian_capelo/src/model/galerias_datos.dart';
import 'package:app_indi_adrian_capelo/src/service/galeria_service.dart';
import 'package:flutter/material.dart';

import '../view/settings_view.dart';
import 'galeria_item_details_view.dart';

/// Displays a list of SampleItems.
class GaleriasItemListView extends StatefulWidget {
  const GaleriasItemListView({
    Key? key,
  }) : super(key: key);

  @override
  State<GaleriasItemListView> createState() => _GaleriasState();

  static const routeName = '/';
}

class _GaleriasState extends State<GaleriasItemListView> {
  // Lista de las galerias del JSON
  List<Galerias> list = [];

  // Lista que recibe los datos del JSON (galerias)
  List<dynamic> listDynamic = [];

  // Variable para buscar por nombre en la lista de galerias
  String buscar = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Galerias"),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Navegacion a la ventana de ajustes, recuperando el contexto
              // (posicion en la lista en la que se encontraba el usuario)
              Navigator.restorablePushNamed(context, SettingsView.routeName);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Row(
            children: <Widget>[
              Container(
                // MediaQuery devuelve el ancho de la pantalla, tanto portrait como landscape
                width: MediaQuery.of(context).size.width - 96,
                margin: const EdgeInsets.only(
                    bottom: 8, top: 16, left: 24, right: 8),
                // TextField para buscar por nombre o direccion
                child: TextField(
                    decoration: const InputDecoration(
                        hintText: "Buscar",
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(color: Colors.blue))),
                    onChanged: (value) {
                      buscar = value;
                      buscarGaleriaPorNombre(buscar);
                    }),
              ),
              // Boton para aplicar los filtros por distrito o etiqueta
            ],
          ),
          Expanded(
              // Crea la ListView
              child: GaleriaWidget())
        ],
      ),
    );
  }

  GaleriaWidget() {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return FutureBuilder(
            // Cargar desde cache la lista
            future: loadCache(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                // Construir el ListView con su propio Builder
                return ListView.builder(
                  shrinkWrap: true,
                  restorationId: 'sampleItemListView',
                  itemCount: list.length,
                  itemBuilder: (BuildContext context, int index) {
                    final item = list[index];
                    return ListTile(
                        leading: ConstrainedBox(
                          constraints: const BoxConstraints(
                            minWidth: 100,
                            minHeight: 550,
                            maxWidth: 104,
                            maxHeight: 551,
                          ),
                          /*
                          child: Image.network(
                            item.foto,
                            width: 100,
                          ),
                          */
                        ),
                        title: Text(item.nombre),
                        subtitle: Text(item.direccion),
                        onTap: () {
                          // Navegacion a la ventana de detalle de cada galeria de la lista
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  GaleriaItemDetailsView(galeria: item)));
                        });
                  },
                );
              } else if (snapshot.hasError) {
                // En caso de error
                return Text(snapshot.error.toString());
              } else {
                return Center(
                    child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                      Padding(
                          padding: EdgeInsets.only(top: 50),
                          child: SizedBox(
                            width: 80,
                            height: 80,
                            // Abstraccion de carga con un CircularProgressIndicator
                            child: CircularProgressIndicator(),
                          )),
                      Padding(
                        padding: EdgeInsets.only(top: 16),
                      )
                    ]));
              }
            });
      },
    );
  }

  @override
  void initState() {
    super.initState();
    // Inicializar el listado de galerias
    list.addAll(GalleryService.gallery);
    //filtrando por nombre
    buscarGaleriaPorNombre(buscar);
  }

  // Carga de la cache
  Future<List<Galerias>> loadCache() async {
    listDynamic = await GalleryService.getGalerias();
    return GalleryService.getGalerias();
  }

  void buscarGaleriaPorNombre(String aux) {
    List<Galerias> listaInicial = [];
    List<Galerias> listaFinal = [];
    // Filtrar según se escriba nombre, dirección, municipio o CP
    listaInicial.addAll(GalleryService.gallery);
    if (aux.isNotEmpty) {
      for (var galeria in listaInicial) {
        if (galeria.nombre.toLowerCase().contains(aux.toLowerCase()) ||
            galeria.direccion.toLowerCase().contains(aux.toLowerCase()) ||
            galeria.municipio.toLowerCase().contains(aux.toLowerCase()) ||
            galeria.pedania.toLowerCase().contains(aux.toLowerCase()) ||
            galeria.codigoPostal.toLowerCase().contains(aux.toLowerCase())) {
          listaFinal.add(galeria);
        }
      }
      // Actualizar la lista
      setState(() {
        list.clear();
        list.addAll(listaFinal);
      });
    }
    // Restablecer lista inicial si no se usa el filtro
    else {
      setState(() {
        list.clear();
        list.addAll(listaInicial);
      });
    }
  }
}

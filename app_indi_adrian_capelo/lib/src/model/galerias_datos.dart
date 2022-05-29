class Galerias {
  // Atributos
  String nombre;
  String direccion;
  String codigoPostal;
  String municipio;
  String pedania;
  String telefono;
  String email;
  String webGaleria;
  String latitud;
  String longitud;
  //String descripcion;
  //String foto;

  // Constructor
  Galerias({
    required this.nombre,
    required this.direccion,
    required this.codigoPostal,
    required this.municipio,
    required this.pedania,
    required this.telefono,
    required this.email,
    required this.webGaleria,
    //required this.descripcion,
    required this.latitud,
    required this.longitud,
    //required this.foto,
  });

  //Convierto los datos del JSON a una lista de objetos de tipo Galerias
  static List<Galerias> recorrer_datos_galeria(
      List<dynamic> lista_datos_galeria) {
    List<Galerias> gallery = [];
    for (var aux in lista_datos_galeria) {
      if (aux["Nombre"] == "Babel Arte Contemporáneo ") {
        gallery.add(Galerias(
            nombre: aux["Nombre"],
            direccion: aux["Dirección"],
            codigoPostal: aux["C.P."],
            municipio: aux["Municipio"],
            pedania: aux["Pedanía"],
            telefono: aux["Teléfono"],
            email: aux["Email"],
            webGaleria: aux["URL Real"],
            //descripcion: aux["Descripción"],
            latitud: "37.98390633230996",
            longitud: "-1.1271599846741045"));
        //foto: aux["Foto 1"]));
      } else if (aux["Nombre"] == "Bisel") {
        gallery.add(Galerias(
            nombre: aux["Nombre"],
            direccion: aux["Dirección"],
            codigoPostal: aux["C.P."],
            municipio: aux["Municipio"],
            pedania: aux["Pedanía"],
            telefono: aux["Teléfono"],
            email: aux["Email"],
            webGaleria: aux["URL Real"],
            //descripcion: aux["Descripción"],
            latitud: "37.602883668433996",
            longitud: "-0.9884952964379629"));
        //foto: aux["Foto 1"]));
      } else if (aux["Nombre"] == "CHYS") {
        gallery.add(Galerias(
            nombre: aux["Nombre"],
            direccion: aux["Dirección"],
            codigoPostal: aux["C.P."],
            municipio: aux["Municipio"],
            pedania: aux["Pedanía"],
            telefono: aux["Teléfono"],
            email: aux["Email"],
            webGaleria: aux["URL Real"],
            //descripcion: aux["Descripción"],
            latitud: "37.98543482989693",
            longitud: "-1.1291667914196244"));
        //foto: aux["Foto 1"]));
      } else if (aux["Nombre"] == "DETRAS DEL ROLLO") {
        gallery.add(Galerias(
            nombre: aux["Nombre"],
            direccion: aux["Dirección"],
            codigoPostal: aux["C.P."],
            municipio: aux["Municipio"],
            pedania: aux["Pedanía"],
            telefono: aux["Teléfono"],
            email: aux["Email"],
            webGaleria: aux["URL Real"],
            //descripcion: aux["Descripción"],
            latitud: "37.978880275577126",
            longitud: "-1.1285830606307272"));
        //foto: aux["Foto 1"]));
      } else if (aux["Nombre"] == "EFE SERRANO") {
        gallery.add(Galerias(
            nombre: aux["Nombre"],
            direccion: aux["Dirección"],
            codigoPostal: aux["C.P."],
            municipio: aux["Municipio"],
            pedania: aux["Pedanía"],
            telefono: aux["Teléfono"],
            email: aux["Email"],
            webGaleria: aux["URL Real"],
            //descripcion: aux["Descripción"],
            latitud: "38.2368846869472",
            longitud: "-1.4240350607620649"));
        //foto: aux["Foto 1"]));
      } else if (aux["Nombre"] == "Fernando Guerao") {
        gallery.add(Galerias(
            nombre: aux["Nombre"],
            direccion: aux["Dirección"],
            codigoPostal: aux["C.P."],
            municipio: aux["Municipio"],
            pedania: aux["Pedanía"],
            telefono: aux["Teléfono"],
            email: aux["Email"],
            webGaleria: aux["URL Real"],
            //descripcion: aux["Descripción"],
            latitud: "37.98832756559967",
            longitud: "-1.1312533829980047"));
        //foto: aux["Foto 1"]));
      } else if (aux["Nombre"] == "Galería Artnueve") {
        gallery.add(Galerias(
            nombre: aux["Nombre"],
            direccion: aux["Dirección"],
            codigoPostal: aux["C.P."],
            municipio: aux["Municipio"],
            pedania: "Murcia",
            telefono: aux["Teléfono"],
            email: aux["Email"],
            webGaleria: aux["URL Real"],
            //descripcion: aux["Descripción"],
            //Cambiar latitud por longitud, mal en el JSON
            latitud: aux["Longitud"],
            longitud: aux["Latitud"]));
        //foto: aux["Foto 1"]));
      } else if (aux["Nombre"] == "Gigarpe") {
        gallery.add(Galerias(
            nombre: aux["Nombre"],
            direccion: aux["Dirección"],
            codigoPostal: aux["C.P."],
            municipio: aux["Municipio"],
            pedania: aux["Pedanía"],
            telefono: aux["Teléfono"],
            email: aux["Email"],
            webGaleria: aux["URL Real"],
            //descripcion: aux["Descripción"],
            latitud: "37.607675366548435",
            longitud: "-0.990891770243062"));
        //foto: aux["Foto 1"]));
      } else if (aux["Nombre"] == "Kim Gallery") {
        gallery.add(Galerias(
            nombre: aux["Nombre"],
            direccion: aux["Dirección"],
            codigoPostal: aux["C.P."],
            municipio: aux["Municipio"],
            pedania: aux["Pedanía"],
            telefono: aux["Teléfono"],
            email: aux["Email"],
            webGaleria: aux["URL Real"],
            //descripcion: aux["Descripción"],
            latitud: "37.987897798732604",
            longitud: "-1.1346753124126714"));
        //foto: aux["Foto 1"]));
      } else if (aux["Nombre"] == "LA AURORA") {
        gallery.add(Galerias(
            nombre: aux["Nombre"],
            direccion: aux["Dirección"],
            codigoPostal: aux["C.P."],
            municipio: aux["Municipio"],
            pedania: aux["Pedanía"],
            telefono: aux["Teléfono"],
            email: aux["Email"],
            webGaleria: aux["URL Real"],
            //descripcion: aux["Descripción"],
            latitud: "37.98833180902024",
            longitud: "-1.1312222124144684"));
        //foto: aux["Foto 1"]));
      } else if (aux["Nombre"] == "T20") {
        gallery.add(Galerias(
            nombre: aux["Nombre"],
            direccion: aux["Dirección"],
            codigoPostal: aux["C.P."],
            municipio: aux["Municipio"],
            pedania: aux["Pedanía"],
            telefono: aux["Teléfono"],
            email: aux["Email"],
            webGaleria: aux["URL Real"],
            //descripcion: aux["Descripción"],
            latitud: "37.9861863374288",
            longitud: "-1.1252881984624572"));
        //foto: aux["Foto 1"]));
      }
    }
    return gallery;
  }
}

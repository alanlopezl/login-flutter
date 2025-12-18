import 'dart:convert';

List<Usuario> usuarioFromJson(String str) =>
    List<Usuario>.from(json.decode(str).map((x) => Usuario.fromJson(x)));

String usuarioToJson(List<Usuario> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Usuario {
  final String codigoUsuario;
  final String clave;
  final String nombreCompleto;

  Usuario({
    required this.codigoUsuario,
    required this.clave,
    required this.nombreCompleto,
  });

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        codigoUsuario: json["codigo_usuario"] ?? "",
        clave: json["clave"] ?? "",
        nombreCompleto: json["nombre_completo"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "codigo_usuario": codigoUsuario,
        "clave": clave,
        "nombre_completo": nombreCompleto,
      };
}





// import 'dart:convert';

// List<Usuario> usuarioFromJson(String str) => List<Usuario>.from(json.decode(str).map((x) => Usuario.fromJson(x)));

// String usuarioToJson(List<Usuario> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class Usuario {
//     RowToJson rowToJson;

//     Usuario({
//         required this.rowToJson,
//     });

//     factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
//         rowToJson: RowToJson.fromJson(json["row_to_json"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "row_to_json": rowToJson.toJson(),
//     };
// }

// class RowToJson {
//     String codigoUsuario;
//     String clave;
//     String nombreCompleto;
    

//     RowToJson({
//         required this.codigoUsuario,
//         required this.clave,
//         required this.nombreCompleto,
  
//     });

//     factory RowToJson.fromJson(Map<String, dynamic> json) => RowToJson(
//         codigoUsuario: json["codigo_usuario"],
//         clave: json["clave"],
//         nombreCompleto: json["nombre_completo"],
        
//     );

//     Map<String, dynamic> toJson() => {
//         "codigo_usuario": codigoUsuario,
//         "clave": clave,
//         "nombre_completo": nombreCompleto,

//     };
// }

import 'package:flutter/material.dart';
import 'package:login/constans.dart';
import 'package:login/models/usuario.dart';
import 'package:http/http.dart' as http;

final urlApi = url;
class Usuarioprovider with ChangeNotifier {

  List<Usuario> usuarios = [];
  Usuario? usuarioLogueado; 

  Usuarioprovider(){
    getUsuarios();
  }

  getUsuarios() async{
    final url1 = Uri.http(urlApi, '/data');
    final resp = await http.get(url1, headers: {
    "Access-Control-Allow-Origin": "*",
    "Access-Control-Allow-Credentials": "true",
    "content-type": "application/json",
    "Accept": "application/json"
    });
    final response = usuarioFromJson(resp.body);
    usuarios = response;
    notifyListeners();
  }


  /// 🔐 LOGIN
  bool login(String usuario, String clave) {
    try {
      final user = usuarios.firstWhere(
        (u) =>
            u.codigoUsuario == usuario &&
            u.clave == clave,
      );

      usuarioLogueado = user; // 👈 guardamos el usuario
      notifyListeners();
      return true;
    } catch (e) {
      return false;
    }
  }


}
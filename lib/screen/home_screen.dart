
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:login/providers/usuario_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);


@override
Widget build(BuildContext context) {
  final usuarioProvider = Provider.of<Usuarioprovider>(context);
  final usuario = usuarioProvider.usuarioLogueado;

  return Scaffold(
    backgroundColor: Colors.deepPurple.shade50,
    appBar: AppBar(
      title: const Text('Inicio'),
      backgroundColor: Colors.deepPurple,
    ),
    body: Column(
      children: [
        const SizedBox(height: 30),

        // 👤 ICONO + NOMBRE
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 55,
                backgroundColor: Colors.deepPurple.shade100,
                child: const Icon(
                  Icons.person,
                  size: 110,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 15),
              Text(
                usuario != null ? usuario.nombreCompleto : 'Bienvenido',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.05,
                ),
              ),
            ],
          ),
        ),

        // 👉 aquí puedes seguir agregando tarjetas, saldo, etc.
      ],
    ),
  );
}
}



// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:login/providers/usuario_provider.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final usuarioProvider = Provider.of<Usuarioprovider>(context);
//     final usuario = usuarioProvider.usuarioLogueado;

//     return Scaffold(
//       backgroundColor: Colors.blue.shade50, // fondo claro como el ejemplo
//       appBar: AppBar(
//         title: const Text('INICIO'),
//         backgroundColor: Colors.blue,
//       ),
//       body: Column(
//         children: [
//           const SizedBox(height: 40),

//           /// 👤 ICONO DE PERSONA
//           CircleAvatar(
//             radius: 55,
//             backgroundColor: Colors.blue.shade200,
//             child: const Icon(
//               Icons.person,
//               size: 110,
//               color: Colors.white,
//             ),
//           ),

//           const SizedBox(height: 15),

//           /// 🧑 NOMBRE DEL USUARIO
//           Text(
//             usuario != null
//                 ? usuario.nombreCompleto
//                 : 'Bienvenido',
//             style: const TextStyle(
//               fontSize: 22,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';

class InputDecorations {
  static InputDecoration inputDecoration({
    required String hintText,
    required String labelText,
    required Icon icono,
  }) {
    return InputDecoration(
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.deepPurple),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.deepPurple, width: 2),
      ),
      hintText: hintText,
      labelText: labelText,
      prefixIcon: icono,
    );
  }
}




// import "package:flutter/material.dart";

// class InputDecorations {
//   static InputDecoration inputDecoration({
//     required String hintText,
//     required String labelText,
//     required Icon icono,
//     }){
//     return inputDecoration(
//            enabledBorder: UnderlineInputBorder(
//           borderSide: BorderSide(color: Colors.deepPurple),
//           ),
//           focusedBorder: UnderlineInputBorder(
//             borderSide: BorderSide(
//               color: Colors.deepPurple, width: 2),
//           ),
//               hintText: hintText,
//               labelText: labelText,
//               prefixIcon: icono,  
//     );
//   }
// }
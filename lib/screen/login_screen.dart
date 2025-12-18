import 'package:flutter/material.dart';
import 'package:login/models/usuario.dart';
import 'package:login/providers/usuario_provider.dart';
import 'package:login/widgets/input_decoration.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Cajapurpura(size),
            iconopersona(),
            LoginForm(context)

          ],
        ),
      ),
    );
  }

  // Column LoginForm(BuildContext context) {
  //   return Column(
  //           children: [
  //             SizedBox(height: 320),
  //             Container(
  //               padding: EdgeInsets.all(20),
  //               margin: EdgeInsets.symmetric(horizontal: 30),
  //               width: double.infinity,
  //               height: 350,
  //               decoration: BoxDecoration(
  //                 color: Colors.white,
  //                 borderRadius: BorderRadius.circular(25),
  //                 boxShadow: [
  //                 BoxShadow(
  //                   color: Colors.black12,
  //                   blurRadius: 25,
  //                   offset: Offset(0,5),
  //                 )
  //                 ]
  //               ),
  //               child: Column(
  //                 children: [
  //                  SizedBox(height: 10), 
  //                  Text('Login', style: Theme.of(context).textTheme.headlineMedium), 
  //                  SizedBox(height: 30),
  //                  Container(
  //                   child: Form(
  //                     child: Column(
  //                       children: [
  //                         TextFormField(
  //                           autocorrect: false,
  //                           decoration: InputDecorations.inputDecoration(
  //                             hintText: 'ejemplo@hotmail.com', 
  //                             labelText:'Correo electronico',
  //                             icono: Icon(Icons.alternate_email_rounded)),
                            
  //                         //   InputDecoration(
  //                         //     enabledBorder: UnderlineInputBorder(
  //                         //       borderSide: BorderSide(color: Colors.deepPurple)),
  //                         //       focusedBorder: UnderlineInputBorder(
  //                         //         borderSide: BorderSide(
  //                         //           color: Colors.deepPurple, width: 2,
  //                         //         )
  //                         //       ) ,   
  //                         //           hintText: 'ejemplo@hotmail.com',
  //                         //           labelText: 'Correo electronico',
  //                         //           prefixIcon: Icon(Icons.alternate_email_rounded),        
  //                         //   ),  
  //                         ),
  //                         SizedBox(height: 30),
  //                             TextFormField(
  //                           autocorrect: false,
  //                           decoration: InputDecorations.inputDecoration(
  //                             hintText: '*******', 
  //                             labelText:'Contraseña',
  //                             icono: Icon(Icons.lock_outline)),
  //                           ),
  //                         ),
  //                         SizedBox(height: 30),
  //                       ],  
  //                     )),
  //                  )
  //                 ],
  //               ),
  //             ),
  //             SizedBox(height: 50),
  //             Text('Crear una nueva cuenta',
  //             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
  //             ),

  //           ],
  //         );
  // }
SingleChildScrollView LoginForm(BuildContext context) {
  // final UsuarioProvider = Provider.of<Usuario_provider>(context);
    final usuarioProvider = Provider.of<Usuarioprovider>(context);
   var txtUsuario = TextEditingController();
   var txtPassword = TextEditingController();
    // usuarioProvider.getUsuarios();
  
  return SingleChildScrollView(
    child: Column(
      children: [
        SizedBox(height: 320),
        Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.symmetric(horizontal: 30),
          width: double.infinity,
          // height: 350,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 25,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            children: [
              SizedBox(height: 10),
              Text('Login', style: Theme.of(context).textTheme.headlineMedium),
              SizedBox(height: 30),
              Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(                  
                  children: [
                    TextFormField(
                      autocorrect: false,
                      controller: txtUsuario,
                      decoration: InputDecorations.inputDecoration(
                        hintText: 'ejemplo@hotmail.com',
                        labelText: 'Correo electrónico',
                        icono: Icon(Icons.alternate_email_rounded),                  
                      ),
                      // validator: (value) {
                      //  // Expresión regular para validar correos
                      //   final String pattern =
                      //       r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$';

                      //   final RegExp regExp = RegExp(pattern);

                      //   return regExp.hasMatch(value ?? '')
                      //       ? null
                      //       : 'El valor ingresado no es un correo electrónico';
                      // },
                    ),
                    SizedBox(height: 30),
                    TextFormField(
                      obscureText: true,
                      autocorrect: false,
                      controller: txtPassword,
                      decoration: InputDecorations.inputDecoration(
                        hintText: '*******',
                        labelText: 'Contraseña',
                        icono: Icon(Icons.lock_outline),
                      ),
                      validator: (value) {
                        return  (value != null && value.length >= 6)
                        ? null
                        : 'La contraseña debe ser mayor o igual a los 6 caracteres';
                      },
                    ),
                    SizedBox(height: 30),
                    MaterialButton(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      disabledColor: Colors.grey, 
                      color: Colors.deepPurple,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 80,
                          vertical: 15,
                          ),
                          child: Text('Ingresar',
                           style:  TextStyle(color: Colors.white),),
                      ),
                      onPressed: () { 
                        // print(usuarioProvider.usuarios);
                        var usser = usuarioProvider.usuarios;
                         if (usser.where((e) => e.codigoUsuario == txtUsuario.text).length > 0 && 
                            usser.where((e) => e.clave == txtPassword.text).length > 0){
                            print('Bienvenido al sistema');    
                         }else{
                        print('Error al ingresar las credenciales');

                         }

                        // Navigator.pushReplacementNamed(context, 'home');
                       },
//                   onPressed: () {
//   if (txtUsuario.text.isEmpty || txtPassword.text.isEmpty) {
//     print('Debe ingresar usuario y contraseña');
//     return;
//   }

//   final usuarios = usuarioProvider.usuarios;

//   final existe = usuarios.any((u) =>
//       u.codigoUsuario == txtUsuario.text &&
//       u.clave == txtPassword.text);

//   if (existe) {
//     print('Bienvenido al sistema');
//   } else {
//     print('Error al ingresar las credenciales');
//   }
// },


                    )
                    
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 50),
        Text(
          'Crear una nueva cuenta',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}

  SafeArea iconopersona() {
    return SafeArea(
            child: Container(
              margin: const EdgeInsets.only(top: 30),
              width: double.infinity,
              child:  const Icon(
                Icons.person_pin,
                color: Colors.white,
                size: 100,
              ),
            ) 
          );
  }

  Container Cajapurpura(Size size) {
    return Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors:[
                Color.fromRGBO(63, 63, 156, 1),
                Color.fromRGBO(90, 70, 178, 1),
              ]           
              )
            ),
            width: double.infinity,
            height: size.height * 0.4,
            child: Stack(
              children: [
                Positioned(child: burbuja(), top: 290, left: 30,),
                Positioned(child: burbuja(), top: -40, left: -30),
                Positioned(child: burbuja(), top: -50, right: -20),
                Positioned(child: burbuja(), bottom: 100, left: 300),
                Positioned(child: burbuja(), top: 90, left: 30),
              ],
            ),
          );
  }

  Container burbuja() {
    return Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Color.fromRGBO(255, 255, 255, 0.05),
                ),
              );
  }
}
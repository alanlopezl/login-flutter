import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:login/providers/usuario_provider.dart';
import 'package:login/screen/home_screen.dart';
import 'package:login/screen/login_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Usuarioprovider())
        ],
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'Demo Flutter',
       routes: {
        'Login' : (_) => LoginScreen(),
        'home' : (_) => HomeScreen(),
       },
       initialRoute: 'Login',
      ),
    );
  }
}
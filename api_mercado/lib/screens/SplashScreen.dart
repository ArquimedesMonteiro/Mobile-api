import 'package:flutter/material.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {


  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 20,
        children:[
          Image.network("https://static.vecteezy.com/ti/vetor-gratis/p1/78816939-laranja-compras-carrinho-icone-apresentando-uma-vibrante-verde-folha-representando-organico-supermercados-ecologico-varejo-lojas-e-sustentavel-natural-comida-comercio-gratis-vetor.jpg",width: 200),
          CircularProgressIndicator(color: Colors.orange,)
        ])) // Column // Center
      ); // Scaffold
  }
}
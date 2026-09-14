import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:api_mercado/screens/produtos.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  List produtos = [];

  @override
  void initState() {
    super.initState();
    fazerGet();
  }

  void fazerGet() async {
    try {
      final respostaServidor = await http.get(Uri.parse("https://mobile-api-oh65.onrender.com/produtos"));
      if (respostaServidor.statusCode == 200) {
        final dados = jsonDecode(respostaServidor.body);
        setState(() {
          produtos = dados;
        });
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Falha na API! Status: ${respostaServidor.statusCode}")));
        }
      }
    } catch (erro) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Erro de conexão: $erro")));
      }
      // ignore: avoid_print
      print("Erro no fazerGet: $erro");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tela Home"), backgroundColor: Colors.orange, centerTitle: true),
      body: produtos.isEmpty
          ? Center(child: Text("Carregando produtos....."))
          : GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: produtos.length,
              itemBuilder: (context, index) {
                final produto = produtos[index];
                return ProdutosCard(
                  nome: produto['nome'] ?? '',
                  preco: (produto['preco'] ?? 0).toDouble(),
                  urlImagem: produto['imagem'] ?? '',
                );
              },
            ),
    );
  }
}
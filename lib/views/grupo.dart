import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

class Grupo extends StatefulWidget {
  const Grupo({super.key});

  @override
  State<Grupo> createState() => _GrupoState();
}

class _GrupoState extends State<Grupo> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _descricao = TextEditingController();
  TextEditingController _valor = TextEditingController();

  salvarGrupo(var des, var valor) async {
    final response = await http.post(
      Uri.parse('http://192.168.56.1:8080/adicionar-grupo'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'descricaoGrupo': des,
        'valorDiariaGrupo': valor,
        'dataCriacao': "2023-05-16",
        'dataAtualizacao': "2023-05-16",
        'status': 'true'
      }),
    );

    if (response.statusCode == 200) {
      _showDialog();
    } else {
      _showDialogErro();
      throw Exception('falha na criacao do grupo.');
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastro do Grupo", style: TextStyle(fontSize: 25)),
        centerTitle: true,
      ),
      body: Form(
          key: _formKey,
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFormField(
                    textAlign: TextAlign.center,
                    decoration:
                        const InputDecoration(hintText: "Descrição do Grupo"),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, inserir um valor.';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(hintText: "Valor Diaria"),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, inserir um valor.';
                      }
                      return null;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 150),
                    child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {}
                        },
                        child: const Text(
                          "Cadastrar",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )),
                  ),
                ],
              ))),
    );
  }
}

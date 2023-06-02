import 'package:appalocacao/views/grupo.dart';
import 'package:flutter/material.dart';

class Alocacao extends StatefulWidget {
  const Alocacao({super.key});

  @override
  State<Alocacao> createState() => _AlocacaoState();
}

class _AlocacaoState extends State<Alocacao> {
  void _abrirGrupo() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const Grupo()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(30, 0, 30, 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton.icon(
                onPressed: () {
                  _abrirGrupo();
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    backgroundColor: const Color.fromARGB(255, 95, 247, 84)),
                icon: const Icon(
                  Icons.car_crash_rounded,
                  size: 40,
                ),
                label: const Text(
                  "Grupo",
                  style: TextStyle(fontSize: 30),
                )),
            const SizedBox(height: 30),
            ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    backgroundColor: const Color.fromARGB(255, 95, 247, 84)),
                icon: const Icon(
                  Icons.person,
                  size: 40,
                ),
                label: const Text(
                  "Cliente",
                  style: TextStyle(fontSize: 30),
                )),
            const SizedBox(height: 30),
            ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.car_rental_rounded, size: 40),
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    backgroundColor: const Color.fromARGB(255, 95, 247, 84)),
                label: const Text(
                  "Carro",
                  style: TextStyle(fontSize: 30),
                ))
          ],
        ),
      ),
    );
  }
}

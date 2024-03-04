import 'package:calculadora_mini/operadores.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';


class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  @override
  final _operador = Operando();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text("Calculadora"),
      ),
        body: Column(
          children: <Widget>[
            _criaDisplay(),
            Divider(height: 0.1),
            _criaTeclado(),
          ],
        ),

    );
  }

  Widget _criaDisplay() {
    return Expanded(
      flex: 1,
      child: Container(
        color: const Color.fromARGB(255, 22, 25, 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AutoSizeText(
                _operador.result,
                minFontSize: 20.0,
                maxFontSize: 80.0,
                maxLines: 1,
                textAlign: TextAlign.end,
                style: const TextStyle(
                  fontWeight: FontWeight.w200,
                  decoration: TextDecoration.none,
                  fontSize: 80.0,
                  color: Colors.white70,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _criaBotoes(String label,
      {int flex = 1,
        Color backgroundColor = const Color.fromARGB(255, 3, 92, 176)}) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: backgroundColor,
              shape: RoundedRectangleBorder(
                  side: BorderSide(width: 2, color: backgroundColor),
                  borderRadius: BorderRadius.circular(10))),
          child: Text(
            label,
            style: const TextStyle(fontSize: 16),
          ),
          onPressed: () {
            setState(() {
              _operador.aplicaComando(label);
            });
          },
        ),
      ),
    );
  }

  Widget _criaTeclado() {
    return Container(
      color: const Color.fromARGB(255, 22, 25, 30),
      height: 400.0,
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _criaBotoes('AC',
                    backgroundColor: Colors.grey.shade700),
                _criaBotoes('DEL'),
                _criaBotoes('/'),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _criaBotoes('7'),
                _criaBotoes('8'),
                _criaBotoes('9'),
                _criaBotoes('x'),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _criaBotoes('4'),
                _criaBotoes('5'),
                _criaBotoes('6'),
                _criaBotoes('+'),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _criaBotoes('1'),
                _criaBotoes('2'),
                _criaBotoes('3'),
                _criaBotoes('-'),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _criaBotoes('0'),
                _criaBotoes('.'),
                _criaBotoes('='),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

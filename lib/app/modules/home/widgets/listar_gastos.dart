import 'package:exemplo/app/models/gasto.dart';
import 'package:flutter/material.dart';

class GastosWidget extends StatefulWidget {
  final Categoria gasto;
  const GastosWidget({super.key, required this.gasto});

  @override
  State<GastosWidget> createState() => _GastosWidgetState();
}

class _GastosWidgetState extends State<GastosWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            //mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: widget.gasto.nome,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        //fontFamily:
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                color: Colors.purple,
              ),
              //Text(
              //widget.gasto.gasto,
              //style: const TextStyle(
              // fontSize: 15,
              // color: Colors.white,
              //),
              // ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

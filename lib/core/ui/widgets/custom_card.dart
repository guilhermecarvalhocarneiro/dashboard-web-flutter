/// CustomCard é um widget que retorna um Card com algumas configurações
/// recebendo como parâmetro um widget filho
/// Modo de usar:
/// 
/// * CustomCard( child: Widget )
/// 
import 'package:flutter/material.dart';

class CustomCard extends StatefulWidget {
  final Widget child;

  const CustomCard({super.key, required this.child});

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    //  Retornando um card contendo como filho o
    // widget passado como parâmetro. O card terá um elevation de 1.5
    // as bordas arredondadas em 12 a cor de fundo do Card será branco
    // com uma transparência de 0.8 e a cor da sombra será preta com
    // uma transparência de 0.5
    return Card(
        elevation: 1.5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        color: Colors.white.withOpacity(.8),
        shadowColor: Colors.black.withOpacity(.5),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: widget.child,
        ));
  }
}

/*
Classe de ajuda geral
trazendo métodos e funções que auxiliam no desenvolvimento do projeto 
*/
import 'dart:math';

class GeneralHelperUtilsClass {
  static GeneralHelperUtilsClass? _instance;
  GeneralHelperUtilsClass._();

  static GeneralHelperUtilsClass get instance {
    _instance ??= GeneralHelperUtilsClass._();
    return _instance!;
  }

  /// Método para retornar um valor booleano randômico
  bool getRandomBoolean() {
    // Simulação de uma chamada para um booleano randômico
    return Random().nextBool();
  }
}

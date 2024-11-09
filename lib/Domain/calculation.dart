import 'package:calculator/Domain/operation.dart';

class Calculation {
  static Operation startSum(){
    return Summary();
  }

  static Operation startMin(){
    return Minus();
  }

  static Operation startUmnozh(){
    return Umnozhit();
  }

  static Operation startDel(){
    return Delit();
  }

  static List <Operation> getAllOperations() {
    return[
      Summary(),
      Minus(),
      Umnozhit(),
      Delit(),
    ];
  }
}
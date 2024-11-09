abstract class Operation {
  String? shortName();
  String? longName();
  double? operation (double? num1, double? num2);
}

class Summary implements Operation {
  @override
  String? longName() => "Сложение";

  @override
  double? operation(double? num1, double? num2) {
    return (num1 ?? 0) + (num2 ?? 0);
  }

  @override
  String? shortName() => "+";

  @override
  bool operator == (Object object) => 
  object is Operation && object.shortName() == shortName();

}


class Minus implements Operation {
  @override
  String? longName() => "Вычитание";

  @override
  double? operation(double? num1, double? num2) {
    return (num1 ?? 0) - (num2 ?? 0);
  }

  @override
  String? shortName() => "-";

  @override
  bool operator == (Object object) => 
  object is Operation && object.shortName() == shortName();


}

class Umnozhit implements Operation {
  @override
  String? longName() => "Умножение";

  @override
  double? operation(double? num1, double? num2) {
    return (num1 ?? 0) * (num2 ?? 0);
  }

  @override
  String? shortName() => "*";
  @override
  bool operator == (Object object) => 
  object is Operation && object.shortName() == shortName();


}

class Delit implements Operation {
  @override
  String? longName() => "Деление";

  @override
  double? operation(double? num1, double? num2) {
    if (num2 == 0 || num2 == null){
      return null;
    }
    else if (num1 == null){
      return 0;
    }
    else {
      return num1/num2;
    }
  }

  @override
  String? shortName() => "/";

  @override
  bool operator == (Object object) => 
  object is Operation && object.shortName() == shortName();


}
import 'package:calculator/Domain/calculation.dart';
import 'package:calculator/Domain/operation.dart';
import 'package:calculator/Presentor/Factory/controller.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(title: 'Рассчёты'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double? num1;
  double? num2;
  double? result;
  Operation? dropdownValue;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, 
          children: <Widget>[
            Expanded(child: Column(
              mainAxisAlignment: MainAxisAlignment.center, 
              children: [Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 20),
                child: Row(children: [
                  Flexible(child: TextField(autofocus: true, 
                  decoration: const InputDecoration(hintText: "Первое число"),
                  keyboardType: const TextInputType.numberWithOptions(
                    signed: false,
                    decimal: true,
                  ),
                  onChanged: (value) {
                    num1 = double.tryParse(value);

                  },
                  )),
                  const VerticalDivider(),
                  
                  DropdownButton<Operation>(
                    value: dropdownValue,
                    items: Calculation.getAllOperations()
                    .map(
                    (value) => DropdownMenuItem(value: value,child: Text(value.shortName().toString()),
                    ),
                    )
                    .toList(),
                    onChanged: (value) {
                      setState(() {
                        dropdownValue = value;
                      }
                    );
                    }
                    ),
                  
                  const VerticalDivider(),

                  Flexible(child: TextField(autofocus: true, 
                  decoration: const InputDecoration(hintText: "Второе число"),
                  keyboardType: const TextInputType.numberWithOptions(
                    signed: false,
                    decimal: true,
                  ),
                  onChanged: (value) {
                    num2 = double.tryParse(value);
                  },
                  )),
                ]),
              ),
               const Text('Результат:'),
               Container(margin: const EdgeInsets.only(
                top: 20,
                ), 
               child: Text (result != null? result.toString() : "", style: const TextStyle(fontSize: 20),)
               ),
              ]
          )),
            UIController.getFabric()!.getButton(
              title: ("Произвести расчёт"), 
              callBack: () {
                setState(() {
               if(dropdownValue != null) {
                result = dropdownValue?.operation(num1, num2);
               }
                });
              },  )
          ],
        ),
      ),
    ),
    );
  }
}
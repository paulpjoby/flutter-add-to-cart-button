import 'package:add_to_cart_button/add_to_cart_button.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyExampleApp());
}

class MyExampleApp extends StatelessWidget {
  const MyExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Example App'),
        ),
        body: Center(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              const SizedBox(
                width: 16,
              ),
              const Text("Item Name Here"),
              const SizedBox(
                width: 16,
              ),
              const Expanded(
                  child: SizedBox(
                width: double.infinity,
              )),
              AddToCartCounterButton(
                initNumber: 0,
                minNumber: 0,
                maxNumber: 10,
                increaseCallback: () {},
                decreaseCallback: () {},
                counterCallback: (int count) {
                  print('Current count: $count');
                },
                backgroundColor: Colors.orange,
                buttonFillColor: Colors.orange,
                buttonIconColor: Colors.white,
              ),
              const SizedBox(
                width: 16,
              ),
            ])),
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(Column(
    children:  <Widget>[
      const Text(
        'Deliver features faster',
        textDirection: TextDirection.ltr,
      ),
      const Text(
        'Craft beautiful UIs',
        textDirection: TextDirection.ltr,
      ),
      const Text(
        'Craft beautiful UIs',
        textDirection: TextDirection.ltr,
              ),
      const Text(
        'data',
        textDirection: TextDirection.rtl,
      )
      ,Column(
        children: const[
             Text('Test', textDirection: TextDirection.ltr,)
        ],
      ),
    ],
  ));
}

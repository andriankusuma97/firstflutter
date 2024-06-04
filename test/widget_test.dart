// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:firstflutter/main.dart';

void main() {
  // Create an instance of the Person class with optional arguments
  var person1 = Person(stay: true, nickName: "Bob");
  // Access and print the properties
  print(person1.stay); // Output: true
  print(person1.nickName); // Output: Bob
}

class Person {
  final bool stay; // Final boolean property (cannot be changed after initialization)
  final String nickName; // Final string property

  const Person({required this.stay, required this.nickName});

  // Use required for non-nullable parameters
}



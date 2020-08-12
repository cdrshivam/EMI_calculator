import 'package:flutter/material.dart';

import './homePage.dart';
void main()
{
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'EMI Calculator',
        home: HomePage(),
      ),
  );
}
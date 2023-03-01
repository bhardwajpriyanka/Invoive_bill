import 'dart:js';

import 'package:flutter/material.dart';
import 'package:invoice/bill.dart';

import 'package:invoice/home.dart';


void main()
{
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context)=>home(),
        'biling':(context)=>bill(),
      },
    )
  );
}
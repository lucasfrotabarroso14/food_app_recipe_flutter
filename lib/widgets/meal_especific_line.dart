

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MealEspecificLine extends StatelessWidget{

  const MealEspecificLine({super.key, required this.label, required this.icon});

  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context){
    return Row(
     children: [
       Icon(icon, size: 17, color: Colors.white),
       SizedBox(),
       Text(label,
       style: TextStyle(color: Colors.white),)
     ],

    );
  }

}
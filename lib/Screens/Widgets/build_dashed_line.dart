/*
**********Project Name: grad_project
**********File Name: build_dashed_line
**********Created At: 11/28/2024 8:06 PM
**********Author: Abdulrahman Akram
**********Description: 
*/

import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';

Widget buildDashedLine()=>Center(
  child: DottedLine(
    dashColor: Color(0xff2260FF),

    lineLength: 255,
    lineThickness: 1.5,
    dashGapLength: 4.5,


  ),


);
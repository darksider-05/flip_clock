import 'package:flip_clock/holder.dart';
import 'package:flip_clock/landscape.dart';
import 'package:flip_clock/portrait.dart';
import 'package:flip_clock/themes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Clock extends StatelessWidget {
  const Clock({super.key});

  @override
  Widget build(BuildContext context) {
    final gears = context.watch<Gears>();
    final pallet = context.watch<Thime>();

    gears.ggg();
    var width =  MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    bool isver = MediaQuery.of(context).orientation == Orientation.portrait;


    return Container(
      color: pallet.background,
      width: width,
      height: height,
      child: isver? Port() :  Land()
    );
  }
}


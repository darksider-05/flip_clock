import 'package:flip_clock/themes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'holder.dart';

class Port extends StatelessWidget {
  const Port({super.key});

  @override
  Widget build(BuildContext context) {


    final gears = context.watch<Gears>();
    final pallet = context.watch<Thime>();

    BoxDecoration con = BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(45)),
      color: pallet.box,
    );

    var width =  MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;




    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: height * 0.025,
      children: [
        // the first
        Container(
          decoration: con,
          width: width * 0.87,
          height: width * 0.87,
          child: Stack(
            children: [
              SizedBox(
                width: width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${trimm(gears.month)} / ${trimm(gears.day)} / ${gears.year.toString().length > 2 ?(int.parse(gears.year.toString().substring(2))):""}",
                      style: TextStyle(fontSize: 18, color: pallet.txt, fontWeight: FontWeight.bold, wordSpacing: -2),
                    ),
                  ],
                ),
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: width),
                  Transform.translate(
                    offset: Offset(0, 7),
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: AnimatedSwitcher(
                        duration: Duration(milliseconds: 500),
                        child: Text(
                          trimm(gears.hour % 12),
                          key: ValueKey(gears.hour),
                          style: TextStyle(
                            fontSize: 250, height: 1 , color: pallet.txt,fontWeight:FontWeight.bold,
                          ), // keep it big; FittedBox will scale
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              Positioned(
                left: 15,
                bottom: 15,
                child: Text(
                  gears.hour > 12 ? "PM" : "AM",
                  style: TextStyle(
                    fontSize: 18,
                    color: pallet.txt,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: width,
                    height: 3,
                    color: pallet.background,
                  ),
                ],
              ),
            ],
          ),
        ),

        // spacer
        SizedBox(width: width),

        //the second
        Container(
          decoration: con,
          width: width * 0.87,
          height: width * 0.87,
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: width),
                  Transform.translate(
                    offset: Offset(0, 7),
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: AnimatedSwitcher(
                        duration: Duration(milliseconds: 500),
                        child: Text(
                          trimm(gears.minute),
                          key: ValueKey(gears.minute),
                          style: TextStyle(
                            fontSize: 250, height: 1, color: pallet.txt, fontWeight:FontWeight.bold,
                          ), // keep it big; FittedBox will scale
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              Positioned(
                right: 15,
                bottom: 15,
                child: Text(
                  trimm(gears.second),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,color: pallet.txt),
                ),
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: width,
                    height: 3,
                    color: pallet.background,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}


String trimm(int inp) {
  var inpS = inp.toString();
  if (inpS.length == 1) {
    return "0$inpS";
  } else {
    return inpS;
  }
}

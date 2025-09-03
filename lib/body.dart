import 'package:flip_clock/holder.dart';
import 'package:flip_clock/themes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Clock extends StatelessWidget {
  const Clock({super.key});

  @override
  Widget build(BuildContext context) {
    final gears = context.watch<Gears>();
    final pallet = context.watch<Thime>();

    BoxDecoration con = BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(30)),
      color: pallet.box,
    );


    gears.ggg();
    print(trimm(int.parse(gears.year.toString())));
    return Container(
      color: pallet.background,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: MediaQuery.of(context).size.height * 0.025,
        children: [
          // the first
          Container(
            decoration: con,
            width: MediaQuery.of(context).size.width * 0.7,
            height: MediaQuery.of(context).size.width * 0.7,
            child: Stack(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
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
                    SizedBox(width: MediaQuery.of(context).size.width),
                    Transform.translate(
                      offset: Offset(0, 2.5),
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: Text(
                          trimm(gears.hour % 12),
                          style: TextStyle(
                            fontSize: 200, height: 1 , color: pallet.txt,fontWeight:FontWeight.bold,
                          ), // keep it big; FittedBox will scale
                        ),
                      ),
                    ),
                  ],
                ),

                Positioned(
                  left: 0,
                  bottom: 0,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      gears.hour > 12 ? "PM" : "AM",
                      style: TextStyle(
                        fontSize: 18,
                        color: pallet.txt,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 3,
                      color: pallet.background,
                    ),
                  ],
                ),
              ],
            ),
          ),

          // spacer
          SizedBox(width: MediaQuery.of(context).size.width),

          //the second
          Container(
            decoration: con,
            width: MediaQuery.of(context).size.width * 0.7,
            height: MediaQuery.of(context).size.width * 0.7,
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: MediaQuery.of(context).size.width),
                    Transform.translate(
                      offset: Offset(0, 2.5),
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: Text(
                          trimm(gears.minute),
                          style: TextStyle(
                            fontSize: 200, height: 1, color: pallet.txt, fontWeight:FontWeight.bold,
                          ), // keep it big; FittedBox will scale
                        ),
                      ),
                    ),
                  ],
                ),

                Positioned(
                  right: 10,
                  bottom: 10,
                  child: Text(
                    trimm(gears.second),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,color: pallet.txt),
                  ),
                ),

                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 3,
                      color: pallet.background,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
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

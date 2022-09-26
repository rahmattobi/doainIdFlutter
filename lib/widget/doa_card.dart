// import 'dart:math';
import 'package:doain_id/theme.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DoaCard extends StatelessWidget {
  String? doa;

  DoaCard({super.key, this.doa});
  // final _random = Random();
  // static const List<Color> color = <Color>[
  //   Colors.red,
  //   Colors.blue,
  //   Colors.green,
  //   Colors.brown,
  //   Colors.black,
  //   Colors.teal,
  //   Colors.cyan,
  // ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 10,
        bottom: 10,
      ),
      decoration: BoxDecoration(
        // color: color[_random.nextInt(color.length)],
        color: whiteColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: const Offset(5, 5),
            blurRadius: 10,
            color: primaryColor.withOpacity(0.2),
          ),
        ],
      ),
      child: Container(
        margin: EdgeInsets.only(
          top: 15,
          left: defaultMargin,
          right: 15,
          bottom: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    doa.toString(),
                    style: primaryTextStyle.copyWith(
                      fontSize: 15,
                      fontWeight: semiBold,
                    ),
                  ),
                ),
                Icon(
                  Icons.arrow_drop_down,
                  // color: whiteColor,
                  color: primaryColor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

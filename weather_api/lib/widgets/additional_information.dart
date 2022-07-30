
import 'package:flutter/material.dart';

TextStyle titleFont = const TextStyle(fontWeight: FontWeight.w600, fontSize: 18);
TextStyle infoFont = const TextStyle(fontWeight: FontWeight.w400, fontSize: 18);

Widget additionalInformation(String wind, String humidity, String pressure, String feels_like,){
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(18),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Wind",
                  style: titleFont,
                  ),
                const SizedBox(
                  height: 18,
                ),
                Text(
                  wind,
                  style: infoFont,
                ),
              ],
            ),
            const Divider(thickness: 5,height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Humidity",
                  style: titleFont,
                ),
                const SizedBox(
                  height: 18,
                ),
                Text(
                  humidity,
                  style: infoFont,
                ),
              ],
            ),
            const Divider(thickness: 5,height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Pressure",
                  style: titleFont,
                ),
                const SizedBox(
                  height: 18,
                ),
                Text(
                  pressure,
                  style: infoFont,
                ),
              ],
            ),
            const Divider(thickness: 5,height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Feels Lile",
                  style: titleFont,
                ),
                const SizedBox(
                  height: 18,
                ),
                Text(
                  feels_like,
                  style: infoFont,
                ),
              ],
            ),
            const Divider(thickness: 5,height: 20,),
          ],
        ),
      ],
    ),
  );
}

import 'package:flutter/material.dart';

Widget currentWeather(IconData icon, String temp, String location, String cntry){
  return Center(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: Colors.orange,
          size: 64,
        ),
        const SizedBox(height: 10,),
        Text(temp,
          style: const TextStyle(
            fontSize: 46
          ),
        ),
        const SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(location,
              style: const TextStyle(
                fontSize: 18,
                color: Color(0xFF5a5a5a),
              ),
            ),
            Text(" "),
            Text(cntry,
                style: const TextStyle(
                  fontSize: 18,
                  color: Color(0xFF5a5a5a),
                )
            ),
          ],
        ),
      ],
    ),
  );
}
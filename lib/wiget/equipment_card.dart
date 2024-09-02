import 'package:flutter/material.dart';
import 'package:workout_planner/constansts/color.dart';

class EquipmentCard extends StatelessWidget {
  final String EquipmentName;
  final String EquipmentDescription;
  final String EquipmentImageUrl;
  final int noOfMinutes;
  final double NumberOfCalory;

  const EquipmentCard({
    super.key,
    required this.EquipmentName,
    required this.EquipmentDescription,
    required this.EquipmentImageUrl,
    required this.noOfMinutes,
    required this.NumberOfCalory,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromARGB(255, 245, 244, 244),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              EquipmentName,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Image.asset(
                  EquipmentImageUrl,
                  fit: BoxFit.cover,
                  width: 100,
                ),
                SizedBox(
                  width: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${noOfMinutes.toString()} of workout",
                      style: TextStyle(
                          color: kMainPinkColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "${NumberOfCalory.toString()} Calories Burned",
                      style: TextStyle(
                          color: kMainPinkColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              EquipmentDescription,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black38,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

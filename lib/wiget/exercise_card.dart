import 'package:flutter/material.dart';
import 'package:workout_planner/constansts/color.dart';

class ExerciseCard extends StatelessWidget {
  final String title;
  final String ImageUrl;
  final String description;
  const ExerciseCard({
    super.key,
    required this.title,
    required this.ImageUrl,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.46,
      decoration: BoxDecoration(
        color: Color.fromARGB(250, 249, 247, 247).withOpacity(0.2),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 5),
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Image.asset(
              ImageUrl,
              width: 100,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              description,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.normal,
                color: kGradientTopColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}

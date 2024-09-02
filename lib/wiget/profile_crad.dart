import 'package:flutter/material.dart';
import 'package:workout_planner/constansts/color.dart';
import 'package:workout_planner/constansts/respones.dart';

class ProfileCrad extends StatefulWidget {
  final String taskName;
  final String taskImgUrl;
  final void Function() markAsdone;
  const ProfileCrad({
    super.key,
    required this.taskName,
    required this.taskImgUrl,
    required this.markAsdone,
  });

  @override
  State<ProfileCrad> createState() => _ProfileCradState();
}

class _ProfileCradState extends State<ProfileCrad> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color.fromARGB(255, 236, 236, 236),
      ),
      child: Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Row(
          children: [
            Image.asset(
              widget.taskImgUrl,
              width: 50,
              fit: BoxFit.cover,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              widget.taskName,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            IconButton(
              onPressed: () {
                widget.markAsdone();
              },
              icon: Icon(Icons.check),
              color: Colors.green,
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:workout_planner/constansts/color.dart';
import 'package:workout_planner/constansts/respones.dart';
import 'package:workout_planner/models/exercise_models.dart';
import 'package:workout_planner/wiget/exercise_card.dart';

class ExercisePage extends StatefulWidget {
  final String exerciseTitle;
  final String exerciseDescription;
  final List<Exercise> exerciseList;
  const ExercisePage({
    super.key,
    required this.exerciseTitle,
    required this.exerciseDescription,
    required this.exerciseList,
  });

  @override
  State<ExercisePage> createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {
  final DateFormat formatter = DateFormat("EEEE, MMMM");
  final DateFormat dayformat = DateFormat("dd");
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formatedDate = formatter.format(now);
    String formaterday = dayformat.format(now);
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "$formatedDate $formaterday",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: kSubtitleColor,
              ),
            ),
            Text(
              widget.exerciseTitle,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: kMainColor,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: Column(
            children: [
              Text(
                widget.exerciseDescription,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: kMainColor,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: kDefaultPadding,
                  mainAxisSpacing: kDefaultPadding,
                ),
                itemCount: widget.exerciseList.length,
                itemBuilder: (context, index) {
                  Exercise exercise = widget.exerciseList[index];
                  return ExerciseCard(
                    title: exercise.exerciseName,
                    ImageUrl: exercise.exerciseUrl,
                    description: "${exercise.noOfMinuites} Of WorkOut...",
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

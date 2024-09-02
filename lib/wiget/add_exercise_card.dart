import 'package:flutter/material.dart';
import 'package:workout_planner/constansts/color.dart';
import 'package:workout_planner/constansts/respones.dart';

class AddExerciseCard extends StatefulWidget {
  final String exerciseTitle;
  final String exerciseImageUrl;
  final int noOfMinutes;
  final bool isAdded;
  final bool isFavouriteed;
  final void Function() toggleAddExercise;
  final void Function() toggleAddFavExercise;
  const AddExerciseCard({
    super.key,
    required this.exerciseTitle,
    required this.exerciseImageUrl,
    required this.noOfMinutes,
    required this.toggleAddExercise,
    required this.isAdded,
    required this.toggleAddFavExercise,
    required this.isFavouriteed,
  });

  @override
  State<AddExerciseCard> createState() => _AddExerciseCardState();
}

class _AddExerciseCardState extends State<AddExerciseCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 15),
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color.fromARGB(255, 245, 244, 244),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 2),
            blurRadius: 2,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Column(
          children: [
            Text(
              widget.exerciseTitle,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Image.asset(
              widget.exerciseImageUrl,
              width: 100,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "${widget.noOfMinutes.toString()} Minuites",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.normal,
                color: kSubtitleColor,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: kSubtitleColor.withOpacity(0.2),
                    ),
                    child: Center(
                      child: IconButton(
                        onPressed: () {
                          widget.toggleAddExercise();
                        },
                        icon: Icon(
                          widget.isAdded ? Icons.remove : Icons.add,
                          size: 30,
                          color: kGradientBottomColor,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: kSubtitleColor.withOpacity(0.2),
                    ),
                    child: Center(
                      child: IconButton(
                        onPressed: () {
                          widget.toggleAddFavExercise();
                        },
                        icon: Icon(
                          widget.isFavouriteed
                              ? Icons.favorite
                              : Icons.favorite_border,
                          size: 30,
                          color: kMainPinkColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

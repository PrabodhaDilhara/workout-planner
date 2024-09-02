import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:workout_planner/constansts/color.dart';
import 'package:workout_planner/constansts/respones.dart';
import 'package:workout_planner/data/user_data.dart';
import 'package:workout_planner/models/equipment_model.dart';
import 'package:workout_planner/models/exercise_models.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  //date and time
  final DateFormat formatter = DateFormat("EEEE, MMMM");
  final DateFormat dayformat = DateFormat("dd");
  //user data
  final userData = user;
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formatedDate = formatter.format(now);
    String formaterday = dayformat.format(now);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(kDefaultPadding),
            child: Column(
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
                  "${userData.FullName}",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: kMainColor,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Here are all your favorited workouts",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    color: kGradientTopColor,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                //Exersice gride view
                GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: kDefaultPadding,
                      mainAxisSpacing: kDefaultPadding,
                      childAspectRatio: 16 / 17,
                    ),
                    itemCount: userData.favexerciseList.length,
                    itemBuilder: (context, index) {
                      Exercise favExercise = userData.favexerciseList[index];
                      return Card(
                        color: Color.fromARGB(255, 240, 239, 239),
                        child: Padding(
                          padding: const EdgeInsets.all(kDefaultPadding),
                          child: Column(
                            children: [
                              Text(
                                favExercise.exerciseName,
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Image.asset(
                                favExercise.exerciseUrl,
                                width: 100,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "${favExercise.noOfMinuites.toString()} Min Workout",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                  color: kMainPinkColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Here are all your favorited workouts",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    color: kGradientTopColor,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                //Exersice gride view
                GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: kDefaultPadding,
                      mainAxisSpacing: kDefaultPadding,
                      childAspectRatio: 16 / 32,
                    ),
                    itemCount: userData.favequipmentList.length,
                    itemBuilder: (context, index) {
                      Equipment favequipment = userData.favequipmentList[index];
                      return Card(
                        color: Color.fromARGB(255, 240, 239, 239),
                        child: Padding(
                          padding: const EdgeInsets.all(kDefaultPadding),
                          child: Column(
                            children: [
                              Text(
                                favequipment.EquipmentName,
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Image.asset(
                                favequipment.EquipmentImageUrl,
                                width: 100,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "${favequipment.noOfMinutes.toString()} Min Workout",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                  color: kMainPinkColor,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "${favequipment.EquipmentDescription} ",
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.normal,
                                  color: kSubtitleColor,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      );
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}

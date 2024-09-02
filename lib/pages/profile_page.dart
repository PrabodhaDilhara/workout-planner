import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:workout_planner/constansts/color.dart';
import 'package:workout_planner/constansts/respones.dart';
import 'package:workout_planner/data/user_data.dart';
import 'package:workout_planner/models/equipment_model.dart';
import 'package:workout_planner/models/exercise_models.dart';
import 'package:workout_planner/wiget/profile_crad.dart';
import 'package:workout_planner/wiget/progress_card.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
                  height: 20,
                ),
                ProgressCard(
                  progressValue: userData.calculateTotalCaloriesBurned(),
                  total: 100,
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color.fromARGB(255, 236, 236, 236),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(kDefaultPadding * 1.5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Total Minutes spend: ${userData.calculateTotalMinutesSpend().toString()}",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: kGradientTopColor,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Total Exercises Completed: ${userData.totalExerciseCompleted.toString()}",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: kMainColor,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Total Equipment Handover: ${userData.totalEquipmentHandOver.toString()}",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: kMainColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Your Exercises",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: userData.exerciseList.length,
                    itemBuilder: (context, index) {
                      Exercise userexercise = userData.exerciseList[index];
                      return ProfileCrad(
                        taskName: userexercise.exerciseName,
                        taskImgUrl: userexercise.exerciseUrl,
                        markAsdone: () {
                          setState(() {
                            userData.marksExerciseAsCompleted(userexercise.id);
                          });
                        },
                      );
                    }),
                Text(
                  "Your Equipments",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: kGradientTopColor,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: userData.equipmentList.length,
                    itemBuilder: (context, index) {
                      Equipment userequipmet = userData.equipmentList[index];
                      return ProfileCrad(
                        taskName: userequipmet.EquipmentName,
                        taskImgUrl: userequipmet.EquipmentImageUrl,
                        markAsdone: () {
                          setState(() {
                            userData.markAshandover(userequipmet.id);
                          });
                        },
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

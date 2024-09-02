import 'package:flutter/material.dart';
import 'package:workout_planner/constansts/color.dart';
import 'package:workout_planner/constansts/respones.dart';
import 'package:workout_planner/data/equipment_data.dart';
import 'package:workout_planner/data/exercise_data.dart';
import 'package:workout_planner/data/user_data.dart';
import 'package:workout_planner/models/equipment_model.dart';
import 'package:workout_planner/models/exercise_models.dart';
import 'package:workout_planner/wiget/add_equipment_card.dart';
import 'package:workout_planner/wiget/add_exercise_card.dart';

class AddNewPage extends StatefulWidget {
  const AddNewPage({super.key});

  @override
  State<AddNewPage> createState() => _AddNewPageState();
}

class _AddNewPageState extends State<AddNewPage> {
  final userData = user;
  final exerciseList = ExerciseData().exerciseList;
  final equipmentList = EquipmentData().equpimentList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(kDefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hellow , ${userData.FullName}",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      color: kMainColor,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Lets Add Some Workouts and Equipment for today!",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: kGradientTopColor,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "All Exercises",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: kMainColor,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  //list view to scroll horizontally
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.34,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: exerciseList.length,
                        itemBuilder: (
                          context,
                          index,
                        ) {
                          Exercise exercise = exerciseList[index];
                          return AddExerciseCard(
                            exerciseTitle: exercise.exerciseName,
                            exerciseImageUrl: exercise.exerciseUrl,
                            noOfMinutes: exercise.noOfMinuites,
                            isAdded: userData.exerciseList.contains(exercise),
                            isFavouriteed:
                                userData.favexerciseList.contains(exercise),
                            toggleAddExercise: () {
                              setState(
                                () {
                                  if (userData.exerciseList
                                      .contains(exercise)) {
                                    userData.removeExercise(exercise);
                                    print(userData.exerciseList.length);
                                  } else {
                                    userData.addExercise(exercise);
                                    print(userData.exerciseList.length);
                                  }
                                },
                              );
                            },
                            toggleAddFavExercise: () {
                              setState(() {
                                if (userData.favexerciseList
                                    .contains(exercise)) {
                                  userData.removeFavExercise(exercise);
                                  print(userData.favexerciseList.length);
                                } else {
                                  userData.addFavExercise(exercise);
                                  print(userData.favexerciseList.length);
                                }
                              });
                            },
                          );
                        }),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "All Equipments",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: kMainColor,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  //list view the scrolls vertically
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: equipmentList.length,
                      itemBuilder: (context, index) {
                        Equipment equipment = equipmentList[index];
                        return AddEquipmentCard(
                          EquipmentName: equipment.EquipmentName,
                          EquipmentImageUrl: equipment.EquipmentImageUrl,
                          noOfMinutes: equipment.noOfMinutes,
                          NumberOfCalory: equipment.NumberOfCalory,
                          Equipmentdescriotion: equipment.EquipmentDescription,
                          isAddEquipment:
                              userData.equipmentList.contains(equipment),
                          isAddFavEquipment:
                              userData.favequipmentList.contains(equipment),
                          toggleAddEquipment: () {
                            setState(() {
                              if (userData.equipmentList.contains(equipment)) {
                                userData.removeEquipment(equipment);
                              } else {
                                userData.addEquipment(equipment);
                              }
                            });
                          },
                          toggleAddFavEquipment: () {
                            setState(() {
                              if (userData.favequipmentList
                                  .contains(equipment)) {
                                userData.removeFavEquipment(equipment);
                              } else {
                                userData.addFavEquipment(equipment);
                              }
                            });
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

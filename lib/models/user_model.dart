import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:workout_planner/models/equipment_model.dart';
import 'package:workout_planner/models/exercise_models.dart';
import 'package:workout_planner/wiget/add_exercise_card.dart';

class User {
  final String userId;
  final String FullName;
  final String Gender;
  final String address;
  final int age;
  final String description;
  int totalExerciseCompleted = 0;
  int totalEquipmentHandOver = 0;

  final List<Exercise> exerciseList;
  final List<Equipment> equipmentList;

  final List<Exercise> favexerciseList;
  final List<Equipment> favequipmentList;

  User(
      {required this.userId,
      required this.FullName,
      required this.Gender,
      required this.address,
      required this.age,
      required this.description,
      required this.exerciseList,
      required this.equipmentList,
      required this.favexerciseList,
      required this.favequipmentList});

  //methodes
  //methods to add new exercise to the exerciseList

  void addExercise(Exercise exercise) {
    exerciseList.add(exercise);
  }

  //mmethod remove a exercise form the exercise list
  void removeExercise(Exercise exercise) {
    exerciseList.remove(exercise);
  }

  // method to add new fav to the favExerciseList

  void addFavExercise(Exercise exercise) {
    favexerciseList.add(exercise);
  }
  //method to remove from exerciselist

  void removeFavExercise(Exercise exercise) {
    favexerciseList.remove(exercise);
  }

  //method to add new equipment to equipmentList
  void addEquipment(Equipment equipment) {
    equipmentList.add(equipment);
  }

  //method to remove a equipment from the equipmentlist
  void removeEquipment(Equipment equipment) {
    equipmentList.remove(equipment);
  }

  // methode the add an equipment to the equipmentList
  void addFavEquipment(Equipment equipment) {
    favequipmentList.add(equipment);
  }

  //methode the remove the equipment from the equipmentList
  void removeFavEquipment(Equipment equipment) {
    favequipmentList.remove(equipment);
  }
  //methods to calculate  the total minutes spend

  int calculateTotalMinutesSpend() {
    int totalMinutesSpend = 0;
    //loop through the exerciseslist and equipmentlist the no of minutes
    for (var exercise in exerciseList) {
      totalMinutesSpend += exercise.noOfMinuites;
    }
    for (var eqipment in equipmentList) {
      totalMinutesSpend += eqipment.noOfMinutes;
    }
    return totalMinutesSpend;
  }

  void marksExerciseAsCompleted(int exerciseId) {
    final exercise =
        exerciseList.firstWhere((Exercise) => Exercise.id == exerciseId);

    exercise.completed = true;

    //remove from exercise list
    removeExercise(exercise);

    totalExerciseCompleted++;
  }

  void markAshandover(int equipmentId) {
    final equipment =
        equipmentList.firstWhere((Equipment) => Equipment.id == equipmentId);

    equipment.handOvered == true;

    removeEquipment(equipment);

    totalEquipmentHandOver++;
  }

  double calculateTotalCaloriesBurned() {
    double totacaloriesBurned = 0;
    for (var equipment in equipmentList) {
      totacaloriesBurned += equipment.NumberOfCalory;
    }
    if (totacaloriesBurned > 0 && totacaloriesBurned <= 10) {
      totacaloriesBurned = totacaloriesBurned / 10;
    }
    if (totacaloriesBurned > 10 && totacaloriesBurned <= 100) {
      totacaloriesBurned = totacaloriesBurned / 100;
    }
    if (totacaloriesBurned > 100 && totacaloriesBurned <= 1000) {
      totacaloriesBurned = totacaloriesBurned / 1000;
    }
    return totacaloriesBurned;
  }
}

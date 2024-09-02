import 'package:workout_planner/models/equipment_model.dart';
import 'package:workout_planner/models/exercise_models.dart';
import 'package:workout_planner/models/user_model.dart';

User user = User(
  userId: "1234",
  FullName: "Prabodha",
  Gender: "Male",
  address: "Anuradhapura",
  age: 23,
  description: "Fitness enthusiast",
  exerciseList: [
    Exercise(
      exerciseName: "High Knees",
      exerciseUrl: "assests/icon8.png.png",
      noOfMinuites: 10,
      id: 7,
      completed: false,
    ),
    Exercise(
      exerciseName: "Bicycle Crunches",
      exerciseUrl: "assests/icon9.png.png",
      noOfMinuites: 20,
      id: 8,
      completed: false,
    ),
  ],
  equipmentList: [
    Equipment(
      id: 0,
      EquipmentName: "Dumbells",
      EquipmentDescription:
          "Welcome to our travel app, your ultimate guide to discovering captivating destinations around the globe! Whether you're seeking the tranquility visit offers something for every traveler.",
      EquipmentImageUrl: "assests/icon.10.png.png",
      noOfMinutes: 5,
      NumberOfCalory: 2,
      handOvered: false,
    ),
    Equipment(
      id: 0,
      EquipmentName: "Dumbells",
      EquipmentDescription:
          "Welcome to our travel app, your ultimate guide to discovering captivating destinations around the globe! Whether you're seeking the tranquility visit offers something for every traveler.",
      EquipmentImageUrl: "assests/icon.10.png.png",
      noOfMinutes: 5,
      NumberOfCalory: 2,
      handOvered: false,
    ),
  ],
  favexerciseList: [
    Exercise(
      exerciseName: "Bicycle Crunches",
      exerciseUrl: "assests/icon9.png.png",
      noOfMinuites: 20,
      id: 8,
      completed: false,
    ),
  ],
  favequipmentList: [
    Equipment(
      id: 0,
      EquipmentName: "Dumbells",
      EquipmentDescription:
          "Welcome to our travel app, your ultimate guide to discovering captivating destinations around the globe! Whether you're seeking the tranquility visit offers something for every traveler.",
      EquipmentImageUrl: "assests/icon.10.png.png",
      noOfMinutes: 5,
      NumberOfCalory: 2,
      handOvered: false,
    ),
  ],
);

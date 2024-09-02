import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:workout_planner/constansts/color.dart';
import 'package:workout_planner/constansts/respones.dart';
import 'package:workout_planner/data/equipment_data.dart';
import 'package:workout_planner/data/exercise_data.dart';
import 'package:workout_planner/data/user_data.dart';
import 'package:workout_planner/pages/equipment_page.dart';
import 'package:workout_planner/pages/exercise_page.dart';
import 'package:workout_planner/wiget/exercise_card.dart';
import 'package:workout_planner/wiget/progress_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //date and time
  final DateFormat formatter = DateFormat("EEEE, MMMM");
  final DateFormat dayformat = DateFormat("dd");
  //user data
  final userData = user;
  //exercise and equpment data
  final exerciseList = ExerciseData().exerciseList;
  final equipmentList = EquipmentData().equpimentList;

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
                Text(
                  "Today’s Activity",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ExercisePage(
                              exerciseTitle: "Warmup",
                              exerciseDescription:
                                  "Welcome to our travel app, your ultimate guide to discovering captivating destinations around the globe! Whether you're seeking the tranquility visit offers something for every traveler.",
                              exerciseList: exerciseList,
                            ),
                          ),
                        );
                      },
                      child: ExerciseCard(
                        description: "See more....",
                        title: "Warmup",
                        ImageUrl: "assests/icon1.png.png",
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EquipmentPage(
                              equipmentTitle: "Equipments",
                              equDescription:
                                  "Welcome to our travel app, your ultimate guide to discovering captivating destinations around the globe! Whether you're seeking the tranquility visit offers something for every traveler.",
                              equipmentList: equipmentList,
                            ),
                          ),
                        );
                      },
                      child: ExerciseCard(
                        description: "See more....",
                        title: "Equipment",
                        ImageUrl: "assests/icon8.png.png",
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ExercisePage(
                              exerciseTitle: "Exercise",
                              exerciseDescription:
                                  "Welcome to our travel app, your ultimate guide to discovering captivating destinations around the globe! Whether you're seeking the tranquility visit offers something for every traveler.",
                              exerciseList: exerciseList,
                            ),
                          ),
                        );
                      },
                      child: ExerciseCard(
                        description: "See more....",
                        title: "Exercise",
                        ImageUrl: "assests/icon4.png.png",
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ExercisePage(
                              exerciseTitle: "Stretching",
                              exerciseDescription:
                                  "Welcome to our travel app, your ultimate guide to discovering captivating destinations around the globe! Whether you're seeking the tranquility visit offers something for every traveler.",
                              exerciseList: exerciseList,
                            ),
                          ),
                        );
                      },
                      child: ExerciseCard(
                        description: "See more....",
                        title: "Stretching",
                        ImageUrl: "assests/icon2.png.png",
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

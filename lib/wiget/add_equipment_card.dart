import 'package:flutter/material.dart';
import 'package:workout_planner/constansts/color.dart';
import 'package:workout_planner/constansts/respones.dart';

class AddEquipmentCard extends StatefulWidget {
  final String EquipmentName;
  final String Equipmentdescriotion;
  final String EquipmentImageUrl;
  final int noOfMinutes;
  final double NumberOfCalory;
  final void Function() toggleAddEquipment;
  final void Function() toggleAddFavEquipment;

  final bool isAddEquipment;
  final bool isAddFavEquipment;
  const AddEquipmentCard({
    super.key,
    required this.EquipmentName,
    required this.EquipmentImageUrl,
    required this.noOfMinutes,
    required this.NumberOfCalory,
    required this.Equipmentdescriotion,
    required this.toggleAddEquipment,
    required this.isAddEquipment,
    required this.toggleAddFavEquipment,
    required this.isAddFavEquipment,
  });

  @override
  State<AddEquipmentCard> createState() => _AddEquipmentCardState();
}

class _AddEquipmentCardState extends State<AddEquipmentCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      width: double.infinity,
      decoration: BoxDecoration(
        color: kCardBackgroundColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            offset: Offset(0, 2),
            blurRadius: 2,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: kDefaultPadding,
          horizontal: kDefaultPadding * 2,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.EquipmentName,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: kMainColor,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  widget.EquipmentImageUrl,
                  width: 100,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.Equipmentdescriotion,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: kGradientBottomColor,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Time : ${widget.noOfMinutes.toString()} min and ${widget.NumberOfCalory.toString()}cateries Burned",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: kSubtitleColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
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
                          widget.toggleAddEquipment();
                        },
                        icon: Icon(
                          widget.isAddEquipment ? Icons.remove : Icons.add,
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
                          widget.toggleAddFavEquipment();
                        },
                        icon: Icon(
                          widget.isAddFavEquipment
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

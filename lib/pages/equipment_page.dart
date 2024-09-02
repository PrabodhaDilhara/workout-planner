import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:workout_planner/constansts/color.dart';
import 'package:workout_planner/constansts/respones.dart';
import 'package:workout_planner/models/equipment_model.dart';
import 'package:workout_planner/wiget/equipment_card.dart';

class EquipmentPage extends StatefulWidget {
  final String equipmentTitle;
  final String equDescription;
  final List<Equipment> equipmentList;
  const EquipmentPage({
    super.key,
    required this.equipmentTitle,
    required this.equDescription,
    required this.equipmentList,
  });

  @override
  State<EquipmentPage> createState() => _EquipmentPageState();
}

class _EquipmentPageState extends State<EquipmentPage> {
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
              widget.equipmentTitle,
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
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Column(
          children: [
            Text(
              widget.equDescription,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  crossAxisSpacing: kDefaultPadding,
                  mainAxisSpacing: kDefaultPadding,
                  childAspectRatio: 8 / 7),
              itemCount: widget.equipmentList.length,
              itemBuilder: (context, index) {
                Equipment equipment = widget.equipmentList[index];
                return EquipmentCard(
                  EquipmentName: equipment.EquipmentName,
                  EquipmentDescription: equipment.EquipmentDescription,
                  EquipmentImageUrl: equipment.EquipmentImageUrl,
                  noOfMinutes: equipment.noOfMinutes,
                  NumberOfCalory: equipment.NumberOfCalory,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

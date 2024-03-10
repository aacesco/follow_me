import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:follow_me/controllers/dates_controller.dart';
import 'package:get/get.dart';

import '../../constants/navigation_constants.dart';
import '../date_tile.dart';

class InputDates extends StatelessWidget {
  const InputDates({super.key});

  @override
  Widget build(BuildContext context) {
    DatesController datesController = Get.find();

    return Padding(
        padding: const EdgeInsets.only(bottom: 8.0, top: 8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(AppLocalizations.of(context)!.dates),
              Text(AppLocalizations.of(context)!.mandatory),
            ],
          ),
          const SizedBox(height: 5),
          Container(
            decoration: BoxDecoration(
                color: Colors.grey[200],
                border: Border.all(
                  color: Colors.black54, // Border color
                  width: 1.0, // Border width
                ),
                borderRadius: BorderRadius.circular(2)),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.white, // Border color
                          width: 1.0, // Border width
                        ),
                        borderRadius: BorderRadius.circular(2)),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                      Row(
                        children: [
                          if(datesController.dates.isNotEmpty)
                           Obx(
                            () => ListView.builder(
                                itemCount: datesController.dates.length,
                                itemBuilder: (context, index) {
                                  return DateTile(date: datesController.dates[index]);
                                }),
                          ),
                          if(datesController.dates.isEmpty)
                            DateTile()
                        ],
                      ),
                      SizedBox(height: 5),
                      Text("Totale eventi: ${datesController.dates.length}"),
                    ]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0, top: 8.0),
                  child: ElevatedButton(
                      onPressed: () => {
                            Get.toNamed(NavigationConstants.DATES_MANAGER,
                                arguments: {'eventId': ''})
                          },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      child: Text(AppLocalizations.of(context)!.datesButton)),
                )
              ],
            ),
          ),
        ]));
  }
}

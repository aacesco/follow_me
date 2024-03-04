import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:follow_me/controllers/dates_controller.dart';
import 'package:get/get.dart';

import '../../constants/navigation_constants.dart';

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
            color: Colors.grey[200],
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(datesController.buildDateTime()),
                      Text('2 ${AppLocalizations.of(context)!.hours}')
                    ],
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

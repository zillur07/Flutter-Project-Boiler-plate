import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:my_project/src/services/configs/app_colors.dart';
import 'package:my_project/src/services/helpers/k_Text.dart';

class Global {
  Global._();

  static void confirmDialog({required void Function()? onConfirmed}) async {
    return Get.defaultDialog(
      contentPadding: EdgeInsets.zero,
      barrierDismissible: true,
      backgroundColor: Colors.white,
      title: '',
      content: SizedBox(
        height: 200,
        width: 320,
        child: Column(
          children: [
            Icon(
              EvaIcons.alertTriangleOutline,
              color: Colors.red.withOpacity(.6),
              size: 60,
            ),
            SizedBox(
              height: 22,
            ),
            KText(
              text: 'Are you sure you want to do this?',
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: AppColors.goldenOrange,
            ),
            SizedBox(
              height: 22,
            ),
            Row(
              children: [
                Expanded(flex: 1, child: SizedBox()),
                Expanded(
                  flex: 4,
                  child: TextButton(
                    onPressed: () => Get.back(),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red)),
                    child: KText(
                      text: 'Cancel',
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
                Expanded(flex: 1, child: SizedBox()),
                Expanded(
                  flex: 4,
                  child: TextButton(
                    onPressed: onConfirmed,
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(AppColors.transparent)),
                    child: KText(
                      text: 'Confirm',
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
                Expanded(flex: 1, child: SizedBox()),
              ],
            )
          ],
        ),
      ),
    );
  }

  static void aleartDialog(String message) async {
    return Get.defaultDialog(
      contentPadding: EdgeInsets.zero,
      barrierDismissible: true,
      backgroundColor: Colors.white,
      title: '',
      content: SizedBox(
        height: 150,
        width: 320,
        child: Column(
          children: [
            Icon(
              EvaIcons.alertTriangleOutline,
              color: Colors.red.withOpacity(.6),
              size: 60,
            ),
            SizedBox(
              height: 22,
            ),
            KText(
              text: message,
              fontSize: 17,
              color: AppColors.orange,
            ),
            // SizedBox(
            //   height: 22,
            // ),
          ],
        ),
      ),
    );
  }
}

//-----------------------------------------------------------
// ************ Date Time and Year ************
//-----------------------------------------------------------
String getCurrentTime() {
  return DateFormat().add_Hms().format(DateTime.now());
}

String getCurrentYear() {
  return DateFormat().add_y().format(DateTime.now());
}

String getAMPMCurrentTime() {
  return DateFormat('hh:mm:ss a').format(DateTime.now());
}

DateTime getCurrentDateTime() {
  return DateTime.now();
}

String formatDate({required String date, String? format}) {
  return DateFormat(format ?? 'd MMM y').format(DateTime.parse(date));
}

///Format Current Date Time
String formatDateTime({String? date, String? format}) {
  return DateFormat(format ?? 'd MMM y hh:mm:ss a').format(DateTime.now());
}

String getCurrrentDateForWF() {
  return DateFormat('yyyy-MM-dd').format(DateTime.now());
}

int getDays({required String startDate, required String endDate}) {
  return DateTime.parse(endDate).difference(DateTime.parse(startDate)).inDays;
}

int? convertStatusCode(code) {
  return int.tryParse('$code');
}

var formatter = NumberFormat('#,##,000');

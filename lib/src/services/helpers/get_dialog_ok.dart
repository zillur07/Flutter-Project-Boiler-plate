import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/src/services/configs/app_colors.dart';
import 'package:my_project/src/services/helpers/hexcolor.dart';
import 'package:my_project/src/services/helpers/k_Text.dart';

import '../configs/app_theme.dart';

enum Status {
  error,
  success,
}

class GetHelper {
  static void snackBar({required String text, required Status status}) {
    if (!Get.isSnackbarOpen) {
      Get.snackbar(
        status == Status.error ? 'Error' : 'Success',
        text,
        backgroundColor: AppColors.transparent,
        colorText: AppColors.black,
        icon: Icon(
          status == Status.error
              ? EvaIcons.alertCircleOutline
              : EvaIcons.doneAllOutline,
          color: AppColors.black,
        ),
      );
    }
  }

  static void dialog({
    required String? text,
    required void Function()? onPressed,
  }) {
    if (!Get.isDialogOpen!) {
      Get.defaultDialog<void>(
        middleText: text!,
        title: '',
        backgroundColor: Colors.white,
        middleTextStyle: TextStyle(
          color: AppColors.black,
          fontSize: 14,
        ),
        confirm: TextButton.icon(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(
              AppColors.black,
            ),
          ),
          onPressed: onPressed,
          icon: Icon(Icons.info_outline),
          label: Text('OK'),
        ),
      );
    }
  }

  static void showDialog({
    required Widget? widget,
  }) {
    if (!Get.isDialogOpen!) {
      Get.defaultDialog<void>(
        content: widget,
        titlePadding: EdgeInsets.zero,
        backgroundColor: AppColors.grey100,
      );
    }
  }

  static void deleteDialog({
    required String? text,
    required void Function()? onPressed,
  }) {
    if (!Get.isDialogOpen!) {
      Get.defaultDialog<void>(
        middleText: text!,
        title: '',
        backgroundColor: AppColors.white,
        middleTextStyle: TextStyle(
          color: Colors.white54,
          fontSize: 14,
        ),
        confirm: TextButton.icon(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(
              AppColors.orange,
            ),
          ),
          onPressed: onPressed,
          icon: Icon(Icons.done),
          label: Text('Confrim'),
        ),
        cancel: TextButton.icon(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(AppColors.pink),
          ),
          onPressed: () => Get.back<void>(),
          icon: Icon(Icons.close_outlined),
          label: Text('Cancel'),
        ),
      );
    }
  }

  Row titleBar({String? title}) {
    return Row(children: <Widget>[
      Expanded(
          child: Divider(
        color: HexColor('#CFDEE3'),
        thickness: 1,
      )),
      SizedBox(
        width: 5,
      ),
      KText(
        text: title,
        fontSize: 16,
        color: AppColors.transparent,
        fontWeight: FontWeight.bold,
      ),
      // Text("Responding Party"),
      SizedBox(
        width: 5,
      ),
      Expanded(
          child: Divider(
        color: HexColor('#CFDEE3'),
        thickness: 1,
      )),
    ]);
  }
}

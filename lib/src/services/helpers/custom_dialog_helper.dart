import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/src/services/configs/app_colors.dart';
import 'package:my_project/src/services/helpers/hexcolor.dart';
import 'package:my_project/src/services/helpers/render_svg.dart';

import 'get_route.dart';
import 'k_Text.dart';

class CustomDialogHelper {
  //show success Dialog
  static void successDialog({
    required String title,
    required String msg,
    required Color color,
    String? path,
    required void Function()? onPressed,
  }) {
    Get.dialog(
      barrierDismissible: false,
      Dialog(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            decoration: BoxDecoration(
              color: HexColor('#FFFFFF'),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                topRight: Radius.circular(5),
                bottomLeft: Radius.circular(5),
                bottomRight: Radius.circular(5),
              ),
              border: Border.all(color: HexColor('#FFFFFF'), width: 1),
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 12, bottom: 13),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (path != null) RenderSvg(path: path),
                      if (path != null) SizedBox(width: 10),
                      Text(
                        title,
                        style: TextStyle(
                            fontFamily: 'Manrope',
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    children: [
                      KText(
                        text: msg,
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        style: ButtonStyle(
                          minimumSize:
                              MaterialStateProperty.all<Size?>(Size(109, 35)),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(color),
                          visualDensity: VisualDensity(horizontal: 2),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              // side: BorderSide(color: Colors.red),
                            ),
                          ),
                        ),
                        onPressed: onPressed,
                        child: Text(
                          'Ok',
                          style: TextStyle(
                              fontFamily: 'Manrope',
                              fontSize: 18.0,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  static void tableBottomSheet({
    //  BuildContext context,
    String? title,
    String? name,
    String? categoryName,
    String? shoutType,
    String? description,
    String? status,
  }) {
    Get.dialog(Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      child: SizedBox(
        height: shoutType != null ? 400 : 350,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 50,
              child: Center(
                child: Text(
                  title!,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Manrope',
                    color: Colors.white,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5)),
                  color: AppColors.goldenOrange),
            ),
            Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    KText(
                      text: name,
                      fontSize: 16,
                    ),
                    KText(
                      text: categoryName,
                      //data.requestedCategory,
                      color: AppColors.pink,
                    ),
                    Divider(
                      thickness: 1.5,
                    ),
                    if (shoutType != null)
                      KText(
                        text: 'New Shout Type',
                        fontSize: 16,
                      ),
                    if (shoutType != null)
                      KText(
                        text: shoutType,
                        color: AppColors.grey,
                      ),
                    if (shoutType != null)
                      Divider(
                        thickness: 1.5,
                      ),
                    KText(
                      text: 'Description',
                      fontSize: 16,
                    ),
                    KText(
                      text: description,
                      color: AppColors.black54,
                      maxLines: 3,
                    ),
                    Divider(
                      thickness: 1.5,
                    ),
                    KText(
                      text: 'Status',
                      fontSize: 16,
                    ),
                    Container(
                      height: 28,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13),
                        color: status == "Approved"
                            ? Colors.green
                            : status == "Rejected"
                                ? Colors.red
                                : AppColors.grey,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          (status == "Rejected" || status == "Approved")
                              ? Icon(
                                  status == "Rejected"
                                      ? Icons.cancel_outlined
                                      : Icons.check_circle_outline,
                                  color: Colors.white,
                                  size: 20,
                                )
                              : Image.asset(
                                  "assets/icons/Pending_icon_new.png",
                                  height: 25,
                                  color: Colors.white,
                                ),
                          KText(
                            text: status,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 1.5,
                    ),
                  ],
                )),
            ElevatedButton(
              child: Text(
                "Ok",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Manrope',
                  color: Colors.white,
                ),
              ),
              onPressed: back,
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      AppColors.goldenOrange), //#78909C
                  fixedSize: MaterialStateProperty.all<Size>(
                      //Size.fromHeight(34.0),
                      Size.fromWidth(109.0)),
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)))),
            ),
          ],
        ),
      ),
    ));
  }
}

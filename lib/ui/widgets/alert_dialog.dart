import 'package:flutter/material.dart';

class DialogUtils {
  static void showLoding(BuildContext context, String content) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        content: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text(content),
              Spacer(),
              CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }

  static void hideLoding(BuildContext context) {
    Navigator.pop(context);
  }

  static void showMessage(
      String? title,
      String content,
      String? posBtnTxt,
      Function? posBtn,
      Function? negBtn,
      String? negBtnTxt,
      BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: title != null ? Text(title) : null,
        content: Text(content),
        actions: [
          if (posBtnTxt != null)
            TextButton(
                onPressed: () {
                  hideLoding(context);
                  if (posBtn != null) {
                    posBtn();
                  } 
                },
                child: Text(posBtnTxt)),
          if (negBtnTxt != null)
            TextButton(
              child: Text(negBtnTxt),
              onPressed: () {
                hideLoding(context);
                if (negBtn != null) {
                  negBtn();
                } 
              },
            ),
        ],
      ),
    );
  }
}

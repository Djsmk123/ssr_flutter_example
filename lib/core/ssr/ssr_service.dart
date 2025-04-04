import 'package:flutter/material.dart' as w;
import 'package:flutter_application_1/core/model/ssr_model.dart';

class SsrService {
  SsrService();

  w.Widget getScreenWidget({SsrModel? ssrModel}) {
    if (ssrModel == null) {
      return const w.SizedBox();
    }

    switch (ssrModel.type) {
      // Corrected reference
      case WidgetType.text:
        {
          if (ssrModel.widget is TextModel) {
            var widget = ssrModel.widget as TextModel;
            return w.Text(
              widget.text,
              style: w.TextStyle(
                fontSize: widget.style.fontSize,
                color: w.Color(int.parse(widget.style.color)),
              ),
            );
          }
          break; // Added break statement
        }
      case WidgetType.button:
        {
          if (ssrModel.widget is Button) {
            var widget = ssrModel.widget as Button;
            return w.ElevatedButton(
              onPressed: () {
                // Handle button press
              },
              child: w.Text(widget.text),
            );
          }
          break; // Added break statement
        }
    }

    return const w.SizedBox(); // Fallback widget
  }
}

enum WidgetType { text, button }

class SsrModel {
  final WidgetType type;
  final SSRWidget widget;
  factory SsrModel.from(Map<String, dynamic> json) {
    var type = getWidgetTypeFromString(json['type']);
    return SsrModel(type: type, widget: getWidgetFromType(type, json));
  }

  SsrModel({required this.type, required this.widget});
  static WidgetType getWidgetTypeFromString(String type) {
    if (type == "text") {
      return WidgetType.text;
    }
    return WidgetType.button;
  }

  static SSRWidget getWidgetFromType(
    WidgetType type,
    Map<String, dynamic> json,
  ) {
    switch (type) {
      case WidgetType.text:
        return TextModel.fromJson(json);
      case WidgetType.button:
        return Button.fromJson(json);
    }
  }
}

abstract class SSRWidget {}

class TextModel extends SSRWidget {
  final String text;
  final TextStyle style;

  TextModel({required this.text, required this.style});
  factory TextModel.fromJson(Map<String, dynamic> json) {
    return TextModel(
      text: json['text'],
      style: TextStyle.fromJson(json['style']),
    );
  }
  Map<String, dynamic> toJson() {
    return {'text': text, 'style': style};
  }
}

class TextStyle {
  final double fontSize;
  final String color;

  TextStyle({required this.fontSize, required this.color});
  //use from

  factory TextStyle.fromJson(Map<String, dynamic> json) {
    return TextStyle(color: json['color'], fontSize: json['fontSize']);
  }
  Map<String, dynamic> toJson() {
    return {'color': color, 'fontSize': fontSize};
  }
}

class Button extends SSRWidget {
  final String text;
  final String action;

  Button({required this.text, required this.action});
  factory Button.fromJson(Map<String, dynamic> json) {
    return Button(text: json['text'], action: json['action']);
  }
  Map<String, dynamic> toJson() {
    return {'text': text, 'action': action};
  }
}

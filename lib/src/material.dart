import 'package:flutter/material.dart';
import 'package:lych/lych.dart';

abstract class LRecordWidget<T extends Object> extends StatefulWidget {
  final LRepository<T> repo;
  final T record;
  LRecordWidget(this.record) : repo = new LRepository();
}

abstract class LRecordState<T extends Object> extends State<LRecordWidget<T>> {
  bool changed = false;
  LRecordState();
}

abstract class LListWidget<T extends Object> extends StatefulWidget {
  final LRepository<T> repo;

  LListWidget([String url = "http://localhost:8080/api/"]) : repo = LRepository(url);
}

abstract class LListState<T extends Object> extends State<LListWidget<T>> {
  bool changed = false;

  LListState();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
}

const TextStyle _defaultHighlightStyle = TextStyle(fontWeight: FontWeight.bold, backgroundColor: Colors.yellowAccent);

class FTextSpan extends StatelessWidget {
  final String _text;
  final String _highlight;
  final TextStyle _highlightStyle;

  FTextSpan(this._text, this._highlight, [this._highlightStyle = _defaultHighlightStyle]) : super();

  List<InlineSpan> _getFormattedText() {
    List<InlineSpan> result = [];
    String s = _text;
    if (_highlight.length > 0) {
      int index = s.toLowerCase().indexOf(_highlight.toLowerCase());
      while (index > -1) {
        if (index > 0) {
          result.add(TextSpan(text: s.substring(0, index - 1)));
        }
        result.add(TextSpan(text: s.substring(index, index + _highlight.length), style: _highlightStyle));
        s = s.substring(index + _highlight.length);
        index = s.toLowerCase().indexOf(_highlight.toLowerCase());
      }
    }
    if (s.length > 0) {
      result.add(TextSpan(text: s));
    }
    return result;
  }

  @override
  Widget build(Object context) {
    return Text.rich(TextSpan(children: _getFormattedText()));
  }
}

final regExpPattern = r'\[([^\]]+)\]\(([^\s\)]+)\)';
final regExp = RegExp(regExpPattern);

const String BOLD = 'B';
const String ITALIC = 'I';
const String COLORED = 'C';
const String BOLD_AND_COLORED = 'BC';
const String ITALIC_AND_COLORED = 'IC';
const String ITALIC_AND_BOLD = 'IB';

class StylizedText extends StatelessWidget {
  final String text;
  final Color color;
  final Color? stylizedTextColor;
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign textAlign;

  const StylizedText(
      {required this.text,
      this.color = Colors.blue,
      this.stylizedTextColor = Colors.red,
      this.fontSize = 12.0,
      this.fontWeight = FontWeight.normal,
      this.textAlign = TextAlign.start})
      : super();

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: _createTextSpans(text),
      ),
      textAlign: textAlign,
    );
  }

  List<TextSpan> _createTextSpans(String content) {
    List<TextSpan> result = [];
    List<String> splitContentList = _generateElements(content);
    for (String text in splitContentList) {
      result.add(getStylizedText(text));
    }
    return result;
  }

  TextSpan getStylizedText(String text) {
    final match = regExp.firstMatch(text);
    TextStyle textStyle = TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
    );
    if (match?.groupCount == 2) {
      text = match!.group(1)!;
      String style = _getStyleName(match.group(2));
      switch (style) {
        case BOLD:
          textStyle = TextStyle(
            color: color,
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
          );
          break;
        case ITALIC:
          textStyle = TextStyle(
            color: color,
            fontSize: fontSize,
            fontWeight: fontWeight,
            fontStyle: FontStyle.italic,
          );
          break;
        case COLORED:
          textStyle = TextStyle(
            color: _stylizedTextColor(),
            fontSize: fontSize,
            fontWeight: fontWeight,
          );
          break;
        case BOLD_AND_COLORED:
          textStyle = TextStyle(
            color: _stylizedTextColor(),
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
          );
          break;
        case ITALIC_AND_COLORED:
          textStyle = TextStyle(
            color: _stylizedTextColor(),
            fontSize: fontSize,
            fontWeight: fontWeight,
            fontStyle: FontStyle.italic,
          );
          break;
        case ITALIC_AND_BOLD:
          textStyle = TextStyle(
            color: color,
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          );
          break;
      }
    }
    return TextSpan(text: text, style: textStyle);
  }

  Color? _stylizedTextColor() => stylizedTextColor != null ? stylizedTextColor : color;
}

_getStyleName(String? styleName) {
  if (styleName == 'CB') {
    return styleName = BOLD_AND_COLORED;
  } else if (styleName == 'CI') {
    return styleName = ITALIC_AND_COLORED;
  } else if (styleName == 'BI') {
    return styleName = ITALIC_AND_BOLD;
  } else {
    return styleName;
  }
}

List<String> _generateElements(String text) {
  if (text.isEmpty) return [];

  List<String> elements = [];

  final matches = regExp.allMatches(text);

  if (matches.isEmpty) {
    elements.add(
      text,
    );
  } else {
    var index = 0;
    matches.forEach((match) {
      if (match.start != 0) {
        elements.add(
          text.substring(index, match.start),
        );
      }
      elements.add(
        match.group(0) ?? "",
      );
      index = match.end;
    });

    if (index < text.length) {
      elements.add(
        text.substring(index),
      );
    }
  }
  return elements;
}

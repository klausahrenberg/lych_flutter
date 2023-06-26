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
          result.add(TextSpan(text: s.substring(0, index)));
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

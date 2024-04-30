import 'package:flutter/material.dart';
import 'package:lych/lych.dart';
import 'package:reflectable/reflectable.dart';

abstract class LRecordWidget<T extends Object> extends StatefulWidget {
  final LRepository<T> repo;
  T record;
  LRecordWidget(this.record, [String url = "http://localhost:8080/api/"]) : repo = new LRepository(url);
}

abstract class LRecordState<T extends Object> extends State<LRecordWidget<T>> {
  bool changed = false;
  LRecordState() {
    LLog.test(this, "try to load late fields...");
  }
}

abstract class LListWidget<T extends Object> extends StatefulWidget {
  final LRepository<T> repo;
  Set<VariableMirror> fields;

  LListWidget([String url = "http://localhost:8080/api/"])
      : repo = LRepository(url),
        fields = LReflections.getFields(T);
}

abstract class LListState<T extends Object> extends State<LListWidget<T>> {
  //bool changed = false;

  LListState();

  @override
  void initState() {
    super.initState();
    fetch();
  }

  void fetch();

  @override
  void dispose() {
    super.dispose();
  }
}

abstract class LDefaultPane<T extends Object> extends StatefulWidget {
  final LRepository<T> repo;

  LDefaultPane([String url = "http://localhost:8080/api/"]) : repo = LRepository(url);
}

abstract class LDefaultPaneState<T extends Object> extends State<LDefaultPane<T>> {
  @override
  void initState() {
    super.initState();
    _updateState();
  }

  void _updateState() {}
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

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

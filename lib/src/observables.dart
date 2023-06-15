import 'package:lych/lych.dart';

/*
@Reflect
class LObservable<T> {
  T? _value;
  bool changed = false;
  //final _changeListeners = <ILChangeListener<T>>{};
  final _changeListeners = <void Function(LObservable<T> obs, T? oldValue)>{};
  bool notifyAllowed = true;
  Set<LObservable<Object>>? _boundedObservables;
  Function? _boundedConverter;

  LObservable([T? initialValue]) {
    value = initialValue;
  }

  set value(T? value) {
    if (!isSingleBound()) {
      if (_value != value) {
        T? oldValue = _value;
        _value = value;
        _fireChangedEvent(oldValue);
      }
    } else {
      if (_boundedConverter != null) {
        //throw new LValueException(this, "Can't set a bounded observable, if converter is needed.");
      }
      _getSingleBoundedObservable().value = value;
    }
  }

  T? get value {
    if (!isSingleBound()) {
      return _value;
    } else {
      return (_boundedConverter != null ? _boundedConverter!(_getSingleBoundedObservable().value) : _getSingleBoundedObservable().value);
    }
  }

  bool isSingleBound() {
    return ((_boundedObservables != null) && (_boundedObservables?.length == 1));
  }

  LObservable<Object> _getSingleBoundedObservable() {
    return _boundedObservables!.first;
  }

  void _fireChangedEvent(T? oldValue) {
    if (notifyAllowed) {
      _changeListeners.forEach((cl) => cl.call(this, oldValue));
      changed = false;
    }
  }

  void addListener(void Function(LObservable<T> obs, T? oldValue) changeListener) {
    _changeListeners.add(changeListener);
  }

  @override
  String toString() {
    return "$runtimeType{$value}";
  }
}

@Reflect
class LString extends LObservable<String> {
  LString([String? initialValue]) : super(initialValue);

  static LString empty() {
    return LString(null);
  }
}

@Reflect
class LBoolean extends LObservable<bool> {
  LBoolean([bool? initialValue]) : super(initialValue);
}

@Reflect
class LInteger extends LObservable<int> {
  LInteger([int? initialValue]) : super(initialValue);
}

@Reflect
class LDouble extends LObservable<double> {
  LDouble([double? initialValue]) : super(initialValue);
}

@Reflect
class LDatetime extends LObservable<DateTime> {
  LDatetime([DateTime? initialValue]) : super(initialValue);
}
*/
/*@Reflect
class LDate extends LObservable<Date> {
  LDatetime([Date? initialValue]):super(initialValue);
}*/

/*abstract class ILChangeListener<T> {

  void changed(LObservableChangeEvent<T> change);

}

class LObservableChangeEvent<T> {

  final LObservable<T> source;
  final T? oldValue;

  LObservableChangeEvent(this.source, this.oldValue);
}*/
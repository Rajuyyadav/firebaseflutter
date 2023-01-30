// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storeclassmobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MobStore on MobStorebase, Store {
  late final _$aAtom = Atom(name: 'MobStorebase.a', context: context);

  @override
  int get a {
    _$aAtom.reportRead();
    return super.a;
  }

  @override
  set a(int value) {
    _$aAtom.reportWrite(value, super.a, () {
      super.a = value;
    });
  }

  late final _$principalAtom =
      Atom(name: 'MobStorebase.principal', context: context);

  @override
  int get principal {
    _$principalAtom.reportRead();
    return super.principal;
  }

  @override
  set principal(int value) {
    _$principalAtom.reportWrite(value, super.principal, () {
      super.principal = value;
    });
  }

  late final _$interestRateAtom =
      Atom(name: 'MobStorebase.interestRate', context: context);

  @override
  double get interestRate {
    _$interestRateAtom.reportRead();
    return super.interestRate;
  }

  @override
  set interestRate(double value) {
    _$interestRateAtom.reportWrite(value, super.interestRate, () {
      super.interestRate = value;
    });
  }

  late final _$monAtom = Atom(name: 'MobStorebase.mon', context: context);

  @override
  int get mon {
    _$monAtom.reportRead();
    return super.mon;
  }

  @override
  set mon(int value) {
    _$monAtom.reportWrite(value, super.mon, () {
      super.mon = value;
    });
  }

  late final _$yearsAtom = Atom(name: 'MobStorebase.years', context: context);

  @override
  double get years {
    _$yearsAtom.reportRead();
    return super.years;
  }

  @override
  set years(double value) {
    _$yearsAtom.reportWrite(value, super.years, () {
      super.years = value;
    });
  }

  late final _$newvalAtom = Atom(name: 'MobStorebase.newval', context: context);

  @override
  double get newval {
    _$newvalAtom.reportRead();
    return super.newval;
  }

  @override
  set newval(double value) {
    _$newvalAtom.reportWrite(value, super.newval, () {
      super.newval = value;
    });
  }

  late final _$MobStorebaseActionController =
      ActionController(name: 'MobStorebase', context: context);

  @override
  void inc() {
    final _$actionInfo =
        _$MobStorebaseActionController.startAction(name: 'MobStorebase.inc');
    try {
      return super.inc();
    } finally {
      _$MobStorebaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  double totalInterest() {
    final _$actionInfo = _$MobStorebaseActionController.startAction(
        name: 'MobStorebase.totalInterest');
    try {
      return super.totalInterest();
    } finally {
      _$MobStorebaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
a: ${a},
principal: ${principal},
interestRate: ${interestRate},
mon: ${mon},
years: ${years},
newval: ${newval}
    ''';
  }
}

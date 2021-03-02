// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'read_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $ReadController = BindInject(
  (i) => ReadController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ReadController on _ReadControllerBase, Store {
  final _$fontScaleFactorAtom =
      Atom(name: '_ReadControllerBase.fontScaleFactor');

  @override
  double get fontScaleFactor {
    _$fontScaleFactorAtom.reportRead();
    return super.fontScaleFactor;
  }

  @override
  set fontScaleFactor(double value) {
    _$fontScaleFactorAtom.reportWrite(value, super.fontScaleFactor, () {
      super.fontScaleFactor = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_ReadControllerBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$fetchCordelByIdAsyncAction =
      AsyncAction('_ReadControllerBase.fetchCordelById');

  @override
  Future<Ecordel> fetchCordelById(int id) {
    return _$fetchCordelByIdAsyncAction.run(() => super.fetchCordelById(id));
  }

  final _$_ReadControllerBaseActionController =
      ActionController(name: '_ReadControllerBase');

  @override
  void addFontScale() {
    final _$actionInfo = _$_ReadControllerBaseActionController.startAction(
        name: '_ReadControllerBase.addFontScale');
    try {
      return super.addFontScale();
    } finally {
      _$_ReadControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void subFontScale() {
    final _$actionInfo = _$_ReadControllerBaseActionController.startAction(
        name: '_ReadControllerBase.subFontScale');
    try {
      return super.subFontScale();
    } finally {
      _$_ReadControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
fontScaleFactor: ${fontScaleFactor},
isLoading: ${isLoading}
    ''';
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $HomeController = BindInject(
  (i) => HomeController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$isLoadingAtom = Atom(name: '_HomeControllerBase.isLoading');

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

  final _$getSummaryAsyncAction = AsyncAction('_HomeControllerBase.getSummary');

  @override
  Future<List<CordelSummaryViewModel>> getSummary() {
    return _$getSummaryAsyncAction.run(() => super.getSummary());
  }

  final _$refreshSummaryAsyncAction =
      AsyncAction('_HomeControllerBase.refreshSummary');

  @override
  Future<void> refreshSummary() {
    return _$refreshSummaryAsyncAction.run(() => super.refreshSummary());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading}
    ''';
  }
}

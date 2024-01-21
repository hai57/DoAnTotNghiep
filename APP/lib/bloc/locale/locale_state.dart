part of "locale_bloc.dart";

abstract class LocaleState extends Equatable {
  const LocaleState();

  @override
  List<Object> get props => [];
}

class LocalInitialState extends LocaleState {
  final Locale locale = Locale(Store.instance.getString(StoreKeys.localeKey) ?? "ja");
}

class LocalChangedState extends LocaleState {
  final Locale locale;

  const LocalChangedState({required this.locale});

  @override
  List<Object> get props => [locale];
}

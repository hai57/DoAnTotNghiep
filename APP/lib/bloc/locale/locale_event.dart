part of "locale_bloc.dart";

abstract class LocaleEvent extends Equatable {
  final String languageCode;
  const LocaleEvent(this.languageCode);

  @override
  List<Object> get props => [];
}

class LocaleChangedEvent extends LocaleEvent {
  const LocaleChangedEvent(String languageCode) : super(languageCode);
}

import 'package:equatable/equatable.dart';
import 'package:otex_app_test/core/enum/enums.dart';

class ThemeState extends Equatable {
  final bool isDark;
  final RequestStates localeState;

  const ThemeState({
    required this.isDark,
    this.localeState = RequestStates.initial,
  });

  ThemeState copyWith({bool? isDark, RequestStates? localeState}) {
    return ThemeState(
      isDark: isDark ?? this.isDark,
      localeState: localeState ?? this.localeState,
    );
  }

  @override
  List<Object?> get props => [isDark, localeState];
}

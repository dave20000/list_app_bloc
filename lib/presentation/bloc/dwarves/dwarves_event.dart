import 'package:freezed_annotation/freezed_annotation.dart';

part 'dwarves_event.freezed.dart';

@freezed
class DwarvesEvent with _$DwarvesEvent {
  const factory DwarvesEvent.started() = _Started;
  const factory DwarvesEvent.fetch() = _Fetch;
  const factory DwarvesEvent.refresh() = _Refresh;
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'elves_event.freezed.dart';

@freezed
class ElvesEvent with _$ElvesEvent {
  const factory ElvesEvent.started() = _Started;
  const factory ElvesEvent.fetch() = _Fetch;
  const factory ElvesEvent.refresh() = _Refresh;
}

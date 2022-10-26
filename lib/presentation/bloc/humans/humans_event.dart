import 'package:freezed_annotation/freezed_annotation.dart';

part 'humans_event.freezed.dart';

@freezed
class HumansEvent with _$HumansEvent {
  const factory HumansEvent.started() = _Started;
  const factory HumansEvent.fetch() = _Fetch;
  const factory HumansEvent.refresh() = _Refresh;
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'hobbits_event.freezed.dart';

@freezed
class HobbitsEvent with _$HobbitsEvent {
  const factory HobbitsEvent.started() = _Started;
  const factory HobbitsEvent.fetch() = _Fetch;
  const factory HobbitsEvent.refresh() = _Refresh;
}

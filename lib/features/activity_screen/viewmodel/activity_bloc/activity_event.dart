part of 'activity_bloc.dart';

@freezed
class ActivityEvent with _$ActivityEvent {
  const factory ActivityEvent.filter(
      List<ActivityModel> activities, List<String> categories) = FilterActivity;
}

part of 'activity_bloc.dart';

@freezed
class ActivityState with _$ActivityState {
  const factory ActivityState.initial(List<ActivityModel> activities) =
      _InitialState;
  const factory ActivityState.loading() = _LoadingState;
  const factory ActivityState.error(String message) = _ErrorState;
  const factory ActivityState.success(List<ActivityModel> activities) =
      _SuccessState;
  const factory ActivityState.empty() = _EmptyState;
}

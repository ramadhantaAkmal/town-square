import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:town_square/features/activity_screen/model/activity_model.dart';
import 'package:town_square/misc/activity_list.dart';

part 'activity_event.dart';
part 'activity_state.dart';
part 'activity_bloc.freezed.dart';

class ActivityBloc extends Bloc<ActivityEvent, ActivityState> {
  ActivityBloc() : super(_InitialState(activityList)) {
    on<FilterActivity>(onFilterActivity);
  }

  void onFilterActivity(
      FilterActivity event, Emitter<ActivityState> emit) async {
    emit(const _LoadingState());

    if (event.categories.contains("all") || event.categories.isEmpty) {
      emit(_SuccessState(activityList));
      return;
    }

    if (event.categories.contains("calm")) {
      emit(const _ErrorState("Error found"));
      return;
    }

    await Future.delayed(const Duration(seconds: 1));
    var activities = event.activities
        .where((item) => event.categories.contains(item.category))
        .toList();

    if (activities.isNotEmpty) {
      emit(_SuccessState(activities));
    } else {
      emit(const _EmptyState());
    }
  }
}

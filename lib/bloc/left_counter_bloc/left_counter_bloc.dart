import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'left_counter_event.dart';
part 'left_counter_state.dart';

class LeftCounterBloc extends Bloc<LeftCounterEvent, LeftCounterState> {
  LeftCounterBloc() : super(LeftCounterInitial()) {
    on<LoadLeftCounter>((event, emit) {
      emit(const LeftCounterLoaded(leftCounts: 0, leftRoundCounts: 0));
    });

    on<IncrementLeftCounter>((event, emit) {
      if (state is LeftCounterLoaded) {
        final state = this.state as LeftCounterLoaded;
        emit(LeftCounterLoaded(
            leftCounts: state.leftCounts + event.count,
            leftRoundCounts: state.leftRoundCounts));
      }
    });

    on<DecrementLeftCounter>((event, emit) {
      if (state is LeftCounterLoaded) {
        final state = this.state as LeftCounterLoaded;
        if (state.leftCounts > 0) {
          emit(LeftCounterLoaded(
              leftCounts: state.leftCounts - event.count,
              leftRoundCounts: state.leftRoundCounts));
        }
      }
    });
    on<ResetLeftCounter>((event, emit) {
      if (state is LeftCounterLoaded) {
        final state = this.state as LeftCounterLoaded;
        emit(LeftCounterLoaded(
            leftCounts: 0, leftRoundCounts: state.leftRoundCounts));
      }
    });

    on<ChangeLeftRoundCounter>((event, emit) {
      if (state is LeftCounterLoaded) {
        final state = this.state as LeftCounterLoaded;
        if (state.leftRoundCounts >= 2) {
          emit(LeftCounterLoaded(
              leftCounts: state.leftCounts, leftRoundCounts: 0));
        } else {
          emit(LeftCounterLoaded(
              leftCounts: state.leftCounts,
              leftRoundCounts: state.leftRoundCounts + 1));
        }
      }
    });
  }
}

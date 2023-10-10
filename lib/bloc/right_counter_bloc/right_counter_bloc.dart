import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'right_counter_event.dart';
part 'right_counter_state.dart';

class RightCounterBloc extends Bloc<RightCounterEvent, RightCounterState> {
  RightCounterBloc() : super(RightCounterInitial()) {
//right counter
    on<LoadRightCounter>((event, emit) async {
      emit(const RightCounterLoaded(rightCounts: 0, rightRoundCounts: 0));
    });

    on<IncrementRightCounter>((event, emit) {
      if (state is RightCounterLoaded) {
        final state = this.state as RightCounterLoaded;
        emit(RightCounterLoaded(
            rightCounts: state.rightCounts + event.count,
            rightRoundCounts: state.rightRoundCounts));
      }
    });

    on<DecrementRightCounter>((event, emit) {
      if (state is RightCounterLoaded) {
        final state = this.state as RightCounterLoaded;
        if (state.rightCounts > 0) {
          emit(RightCounterLoaded(
              rightCounts: state.rightCounts - event.count,
              rightRoundCounts: state.rightRoundCounts));
        }
      }
    });
    on<ResetRightCounter>((event, emit) {
      if (state is RightCounterLoaded) {
        final state = this.state as RightCounterLoaded;
        emit(RightCounterLoaded(
            rightCounts: 0, rightRoundCounts: state.rightRoundCounts));
      }
    });

    on<ChangeRightRoundCounter>((event, emit) {
      if (state is RightCounterLoaded) {
        final state = this.state as RightCounterLoaded;
        if (state.rightRoundCounts >= 2) {
          emit(RightCounterLoaded(
              rightCounts: state.rightCounts, rightRoundCounts: 0));
        } else {
          emit(RightCounterLoaded(
              rightCounts: state.rightCounts,
              rightRoundCounts: state.rightRoundCounts + 1));
        }
      }
    });
  }
}

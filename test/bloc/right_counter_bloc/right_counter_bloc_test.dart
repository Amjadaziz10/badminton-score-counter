import 'package:badminton_score_counter/bloc/right_counter_bloc/right_counter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';

void main() {
  late RightCounterBloc rightCounterBloc;

  setUp(() {
    rightCounterBloc = RightCounterBloc()..add(LoadRightCounter());
  });
  group('RightCounterBloc', () {
    blocTest(
      'emits [] when nothing is added',
      build: () => RightCounterBloc()..add(LoadRightCounter()),
      expect: () =>
          [const RightCounterLoaded(rightCounts: 0, rightRoundCounts: 0)],
    );

    blocTest(
      'emits when IncrementRightCounter is added',
      build: () => rightCounterBloc,
      act: (bloc) {
        bloc.add(const IncrementRightCounter(1));
      },
      expect: () =>
          [const RightCounterLoaded(rightCounts: 1, rightRoundCounts: 0)],
    );

    blocTest(
      'emits when DecrementRightCounter is added',
      build: () => rightCounterBloc,
      act: (bloc) {
        bloc.add(const IncrementRightCounter(5));
        bloc.add(const DecrementRightCounter(1));
      },
      expect: () => [
        const RightCounterLoaded(rightCounts: 5, rightRoundCounts: 0),
        const RightCounterLoaded(rightCounts: 4, rightRoundCounts: 0)
      ],
    );

    blocTest(
      'emits when ResetRightCounter is added',
      build: () => rightCounterBloc,
      act: (bloc) {
        bloc.add(const IncrementRightCounter(5));
        bloc.add(ResetRightCounter());
      },
      expect: () => [
        const RightCounterLoaded(rightCounts: 5, rightRoundCounts: 0),
        const RightCounterLoaded(rightCounts: 0, rightRoundCounts: 0)
      ],
    );

    blocTest(
      'emits when ResetRightCounter is added',
      build: () => rightCounterBloc,
      act: (bloc) {
        bloc.add(ChangeRightRoundCounter());
        bloc.add(ChangeRightRoundCounter());
        bloc.add(ChangeRightRoundCounter());
      },
      expect: () => [
        const RightCounterLoaded(rightCounts: 0, rightRoundCounts: 1),
        const RightCounterLoaded(rightCounts: 0, rightRoundCounts: 2),
        const RightCounterLoaded(rightCounts: 0, rightRoundCounts: 0)
      ],
    );
  });
}

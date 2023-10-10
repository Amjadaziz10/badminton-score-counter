import 'package:badminton_score_counter/bloc/left_counter_bloc/left_counter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';

void main() {
  late LeftCounterBloc leftCounterBloc;

  setUp(() {
    leftCounterBloc = LeftCounterBloc()..add(LoadLeftCounter());
  });
  group('LeftCounterBloc', () {
    blocTest(
      'emits [] when nothing is added',
      build: () => LeftCounterBloc()..add(LoadLeftCounter()),
      expect: () =>
          [const LeftCounterLoaded(leftCounts: 0, leftRoundCounts: 0)],
    );

    blocTest(
      'emits when IncrementLeftCounter is added',
      build: () => leftCounterBloc,
      act: (bloc) {
        bloc.add(const IncrementLeftCounter(1));
      },
      expect: () =>
          [const LeftCounterLoaded(leftCounts: 1, leftRoundCounts: 0)],
    );

    blocTest(
      'emits when DecrementLeftCounter is added',
      build: () => leftCounterBloc,
      act: (bloc) {
        bloc.add(const IncrementLeftCounter(5));
        bloc.add(const DecrementLeftCounter(1));
      },
      expect: () => [
        const LeftCounterLoaded(leftCounts: 5, leftRoundCounts: 0),
        const LeftCounterLoaded(leftCounts: 4, leftRoundCounts: 0)
      ],
    );

    blocTest(
      'emits when ResetLeftCounter is added',
      build: () => leftCounterBloc,
      act: (bloc) {
        bloc.add(const IncrementLeftCounter(5));
        bloc.add(ResetLeftCounter());
      },
      expect: () => [
        const LeftCounterLoaded(leftCounts: 5, leftRoundCounts: 0),
        const LeftCounterLoaded(leftCounts: 0, leftRoundCounts: 0)
      ],
    );

    blocTest(
      'emits when ResetLeftCounter is added',
      build: () => leftCounterBloc,
      act: (bloc) {
        bloc.add(ChangeLeftRoundCounter());
        bloc.add(ChangeLeftRoundCounter());
        bloc.add(ChangeLeftRoundCounter());
      },
      expect: () => [
        const LeftCounterLoaded(leftCounts: 0, leftRoundCounts: 1),
        const LeftCounterLoaded(leftCounts: 0, leftRoundCounts: 2),
        const LeftCounterLoaded(leftCounts: 0, leftRoundCounts: 0)
      ],
    );
  });
}

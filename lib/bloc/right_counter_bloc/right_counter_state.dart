part of 'right_counter_bloc.dart';

abstract class RightCounterState extends Equatable {
  const RightCounterState();

  @override
  List<Object> get props => [];
}

class RightCounterInitial extends RightCounterState {}

class RightCounterLoaded extends RightCounterState {
  final int rightCounts;
  final int rightRoundCounts;

  const RightCounterLoaded(
      {required this.rightCounts, required this.rightRoundCounts});

  @override
  List<Object> get props => [rightCounts, rightRoundCounts];
}

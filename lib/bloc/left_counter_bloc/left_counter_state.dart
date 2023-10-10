part of 'left_counter_bloc.dart';

abstract class LeftCounterState extends Equatable {
  const LeftCounterState();

  @override
  List<Object> get props => [];
}

class LeftCounterInitial extends LeftCounterState {}

class LeftCounterLoaded extends LeftCounterState {
  final int leftCounts;
  final int leftRoundCounts;

  const LeftCounterLoaded(
      {required this.leftCounts, required this.leftRoundCounts});

  @override
  List<Object> get props => [leftCounts, leftRoundCounts];
}

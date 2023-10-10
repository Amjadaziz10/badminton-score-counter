part of 'right_counter_bloc.dart';

abstract class RightCounterEvent extends Equatable {
  const RightCounterEvent();

  @override
  List<Object> get props => [];
}

//RightCounter
class LoadRightCounter extends RightCounterEvent {}

class IncrementRightCounter extends RightCounterEvent {
  final int count;

  const IncrementRightCounter(this.count);

  @override
  List<Object> get props => [count];
}

class DecrementRightCounter extends RightCounterEvent {
  final int count;

  const DecrementRightCounter(this.count);

  @override
  List<Object> get props => [count];
}

class ResetRightCounter extends RightCounterEvent {
  @override
  List<Object> get props => [];
}

class ChangeRightRoundCounter extends RightCounterEvent {
  @override
  List<Object> get props => [];
}

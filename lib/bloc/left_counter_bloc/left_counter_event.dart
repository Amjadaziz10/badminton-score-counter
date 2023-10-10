part of 'left_counter_bloc.dart';

abstract class LeftCounterEvent extends Equatable {
  const LeftCounterEvent();

  @override
  List<Object> get props => [];
}

//LeftCounter
class LoadLeftCounter extends LeftCounterEvent {}

class IncrementLeftCounter extends LeftCounterEvent {
  final int count;

  const IncrementLeftCounter(this.count);

  @override
  List<Object> get props => [count];
}

class DecrementLeftCounter extends LeftCounterEvent {
  final int count;

  const DecrementLeftCounter(this.count);

  @override
  List<Object> get props => [count];
}

class ResetLeftCounter extends LeftCounterEvent {
  @override
  List<Object> get props => [];
}

class ChangeLeftRoundCounter extends LeftCounterEvent {
  @override
  List<Object> get props => [];
}

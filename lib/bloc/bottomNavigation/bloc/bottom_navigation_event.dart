part of 'bottom_navigation_bloc.dart';

sealed class BottomNavigationEvent extends Equatable {
  const BottomNavigationEvent();

  @override
  List<Object> get props => [];
}

class BottomNavigationPressed extends BottomNavigationEvent {
  final int index;
  const BottomNavigationPressed(this.index);

  @override
  List<Object> get props => [index];
}

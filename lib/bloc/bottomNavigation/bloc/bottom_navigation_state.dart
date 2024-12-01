part of 'bottom_navigation_bloc.dart';

sealed class BottomNavigationState extends Equatable {
  const BottomNavigationState();

  @override
  List<Object> get props => [];
}

final class BottomNavigationInitial extends BottomNavigationState {}

final class BottomNavState extends BottomNavigationState {
  final int index;
  const BottomNavState(this.index);
  @override
  List<Object> get props => [index];
}

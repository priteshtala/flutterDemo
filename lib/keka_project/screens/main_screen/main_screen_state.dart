import 'package:equatable/equatable.dart';

class MainScreenState extends Equatable {
  @override
  List<Object?> get props => [isSelected];

  final int isSelected;

  const MainScreenState({
    this.isSelected = -1,
  });

  MainScreenState copyWith({
    int? isSelected,
  }) {
    return MainScreenState(
      isSelected: isSelected ?? this.isSelected,
    );
  }
}

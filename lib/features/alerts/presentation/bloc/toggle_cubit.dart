import 'package:flutter_bloc/flutter_bloc.dart';

part 'toggle_state.dart';

class ToggleCubit extends Cubit<ToggleState> {
  ToggleCubit() : super(ToggleState(true));

  void toggleBtnValue({required bool val}) => emit(ToggleState(val));
}

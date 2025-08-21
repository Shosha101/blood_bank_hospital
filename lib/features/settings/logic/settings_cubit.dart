
import 'package:blood_bank_hospital/features/settings/data/repo/settings_repo.dart';
import 'package:blood_bank_hospital/features/settings/logic/settings_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final SettingsRepo _settingsRepo;
  SettingsCubit(this._settingsRepo) : super(const SettingsState.initial());

}

class SettingsInitial extends SettingsState {
  const SettingsInitial();
}

class SettingsLogoutFailure extends SettingsState {
  final String message;

  const SettingsLogoutFailure(this.message);
}

class SettingsLogoutLoading extends SettingsState {
  const SettingsLogoutLoading();
}

class SettingsLogoutSuccess extends SettingsState {
  const SettingsLogoutSuccess();
}

sealed class SettingsState {
  const SettingsState();
}

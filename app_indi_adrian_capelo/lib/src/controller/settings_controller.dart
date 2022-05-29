import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../service/settings_service.dart';

// Para guardar preferencias del tema elegido por el usuario
class SettingsController with ChangeNotifier {
  SettingsController(this._settingsService);

  //instacia de las preferencias del usuario
  final SettingsService _settingsService;

  // parámetro para guardar el tema prefereido del usuario
  late ThemeMode _themeMode;

  // Inicializar parámetro
  ThemeMode get themeMode => _themeMode;

  // Cargar la configuración elegida
  Future<void> loadSettings() async {
    _themeMode = await _settingsService.themeMode();
    notifyListeners();
  }

  //Actualización y permanencia de la opción elegida por el usuario
  Future<void> updateThemeMode(ThemeMode? newThemeMode) async {
    if (newThemeMode == null) return;
    if (newThemeMode == _themeMode) return;

    // Actualizar tema
    _themeMode = newThemeMode;
    notifyListeners();

    //Para guardar la elección
    await _settingsService.updateThemeMode(newThemeMode);
  }
}

class SettingTheme {
  //Instancia necesaria para las preferencias del usuario sobre el tema
  static SharedPreferences? _preferences;
  static Future<SharedPreferences> getSharedPreferences() async {
    return await SharedPreferences.getInstance();
  }

  // Devuelve el tema preferido del usuario
  static ThemeMode getThemeMode(SharedPreferences preferences) {
    if (_preferences == null) {
      getSharedPreferences().then((value) => _preferences = value);
    }
    var theme = preferences.getString('theme');
    if (theme == "dark") {
      return ThemeMode.light;
    } else if (theme == "light") {
      return ThemeMode.dark;
    } else {
      return ThemeMode.system;
    }
  }

  // Sobreescribe el tema preferido del usuario si se modifica
  static Future setThemeMode(ThemeMode theme) async =>
      await _preferences!.setString("theme", theme.name);
}

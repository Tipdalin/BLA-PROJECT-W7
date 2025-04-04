import 'package:flutter/material.dart';
import '../../repository/ride_preferences_repository.dart';
import '../../model/ride/ride_pref.dart';

class RidesPreferencesProvider extends ChangeNotifier {
  RidePreference? _currentPreference;
  final List<RidePreference> _pastPreferences = [];

  final RidePreferencesRepository repository;

  RidesPreferencesProvider({required this.repository}) {
    _pastPreferences.addAll(repository.getPastPreferences());
  }

  RidePreference? get currentPreference => _currentPreference;

  void setCurrentPreference(RidePreference pref) {
    if (_currentPreference != pref) {
      _currentPreference = pref;  
      _updatePreference(pref);
      notifyListeners();
    }
  }

  void _updatePreference(RidePreference preference) {
    _pastPreferences.removeWhere((p) => p == preference);
    _pastPreferences.add(preference); 
    repository.addPreference(preference); 
  }

  List<RidePreference> get preferencesHistory =>
      _pastPreferences.reversed.toList();
}

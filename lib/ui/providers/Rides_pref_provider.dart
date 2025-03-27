import 'package:flutter/material.dart';
import 'package:week_3_blabla_project/repository/ride_preferences_repository.dart';
import '../../model/ride/ride_pref.dart';

class RidesPrefProvider extends ChangeNotifier{

  RidePreference? _currentPreference;	
  List<RidePreference> _pastPreferences = [];

  final RidePreferencesRepository repository;

  RidesPrefProvider({required this.repository}){

    _pastPreferences = repository.getPastPreferences();

  }
  RidePreference? get currentPreference => _currentPreference;	

  //set current preference
  void setCurrentPreference(RidePreference preference) {
    _currentPreference = preference;
    notifyListeners();
  }
  //add preference
  void addPreference(RidePreference preference) {
    _currentPreference = preference;
    notifyListeners();
  }

  //History is returned from newest to oldest preference
  List<RidePreference> get preferencesHistory => 
_pastPreferences.reversed.toList();
  
  }



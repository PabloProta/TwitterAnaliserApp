import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:twitter_analiser_app/presentation/model/hate_types.dart';
import 'package:twitter_analiser_app/repository/model/plataform.dart';
import 'package:twitter_analiser_app/repository/model/politico.dart';
import 'package:twitter_analiser_app/repository/model/regiao.dart';
import 'package:twitter_analiser_app/repository/twitter_analiser_repository.dart';

class MainController extends ChangeNotifier {
  String? _candidateSelected;
  String? _regionSelected;
  String? _plataformSelected;
  final List<Politico> _candidatos = [];
  final List<Regiao> _regioes = [];
  final List<Plataform> _plataformas = [];
  final List<HateTypes> _hatesSeleceted = [];
  final _apiRepository = TwitterAnaliserRepository();

  MainController() {
    _apiRepository.saveAllData();
    _apiRepository.getCandidatos().then((value) {
      _candidatos.addAll(value);
      notifyListeners();
    }).catchError((Object obj) {
      switch (obj.runtimeType) {
        case DioError:
          final res = (obj as DioError).response;
          logger.e("Go error: ${res?.statusCode} -> ${res?.statusMessage}");
          break;
        default:
          break;
      }
    });
    _apiRepository.getRegioes().then((value) {
      log(value.toString());
      _regioes.addAll(value);
      notifyListeners();
    }).catchError((Object obj) {
      switch (obj.runtimeType) {
        case DioError:
          final res = (obj as DioError).response;
          logger.e("Go error: ${res?.statusCode} -> ${res?.statusMessage}");
          break;
        default:
          break;
      }
    });
    _apiRepository.getPlataformas().then((value) {
      log(value.toString());
      _plataformas.addAll(value);
      notifyListeners();
    }).catchError((Object obj) {
      switch (obj.runtimeType) {
        case DioError:
          final res = (obj as DioError).response;
          logger.e("Go error: ${res?.statusCode} -> ${res?.statusMessage}");
          break;
        default:
          break;
      }
    });
  }

  void setCandidate(String candidate) {
    _candidateSelected = candidate;
    notifyListeners();
  }

  void setRegion(String region) {
    _regionSelected = region;
    notifyListeners();
  }

  void setPlataform(String plataform) {
    _plataformSelected = plataform;
    notifyListeners();
  }

  void setHate(HateTypes hate, bool isChecked) {
    if (isChecked) {
      _hatesSeleceted.add(hate);
    } else {
      _hatesSeleceted.remove(hate);
    }
    notifyListeners();
  }

  String? getCandidate() {
    return _candidateSelected;
  }

  String? getPlataform() {
    return _plataformSelected;
  }

  String? getRegion() {
    return _regionSelected;
  }

  List<DropdownMenuItem> getCandidatos() {
    return _candidatos
        .map((e) =>
            DropdownMenuItem(value: e.politico, child: Text(e.politico!)))
        .toList();
  }

  List<DropdownMenuItem> getRegioes() {
    return _regioes
        .map((e) =>
            DropdownMenuItem(value: e.cidade, child: Text(e.cidade!)))
        .toList();
  }

    List<DropdownMenuItem> getPlataformas() {
    return _plataformas
        .map((e) =>
            DropdownMenuItem(value: e.source, child: Text(e.source!)))
        .toList();
  }

  bool getHate(HateTypes hate) {
    if (_hatesSeleceted.contains(hate)) {
      return true;
    } else {
      return false;
    }
  }
}

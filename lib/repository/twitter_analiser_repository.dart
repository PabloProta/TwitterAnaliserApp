import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:twitter_analiser_app/data/main_preferences.dart';
import 'package:twitter_analiser_app/repository/model/plataform.dart';
import 'package:twitter_analiser_app/repository/model/politico.dart';
import 'package:twitter_analiser_app/repository/model/regiao.dart';
import 'package:twitter_analiser_app/repository/twitter_analiser_server_client.dart';

final logger = Logger();

class TwitterAnaliserRepository {
  final _client = TwitterAnaliserServerClient(Dio());
  final _prefs = MainPreferences.getInstance();
  final String _candidatosKey = "candidatos";
  final String _regioesKey = "regioes";
  final String _plataformasKey = "plataformas";

  void saveAllData() {
    _saveCandidatosCache();
    _saveRegioesCache();
    _savePlataformsCache();
  }

  Future<List<Politico>> getCandidatos() async {
    log("getCandidatos");
    var preferences = await _prefs;
    var candidatos = preferences.getListString(_candidatosKey);

    List<Politico> politicos = [];

    candidatos?.forEach((value) {
      Map<String, dynamic> decoded = jsonDecode(value);
      politicos.add(Politico.fromJson(decoded));
    });

    if (politicos.isNotEmpty) {
      return politicos;
    } else {
      return _client.getCandidatos();
    }
  }

  

  Future<List<Regiao>> getRegioes() async {
    log("getRegioes");
    var preferences = await _prefs;
    var regioes = preferences.getListString(_regioesKey);

    List<Regiao> regioesList = [];

    regioes?.forEach((value) {
      Map<String, dynamic> decoded = jsonDecode(value);
      regioesList.add(Regiao.fromJson(decoded));
    });

    if(regioesList.isNotEmpty){
      return regioesList;
    }else{
      return _client.getRegioes();
    }
  }

  Future<List<Plataform>> getPlataformas() async {
    log("getPlataformas");
    var prefereces = await _prefs;
    var plataformas = prefereces.getListString(_plataformasKey);
    List<Plataform> plataformasList = [];

    plataformas?.forEach((value) {
      Map<String, dynamic> decoded = jsonDecode(value);
      plataformasList.add(Plataform.fromJson(decoded));
    });
    if(plataformasList.isNotEmpty){
      return plataformasList;
    }else{
      return _client.getPlataforms();
    }
  }


  void _saveCandidatosCache() async {
    log("saveCandidatosCache");
    MainPreferences? preferences = await _prefs;
    _client.getCandidatos().then((value) {
      List<String> candidatosList = [];
      for (var politico in value) {
        candidatosList.add(jsonEncode(politico.toJson()));
      }
      preferences.setListString(_candidatosKey, candidatosList);
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

  void _saveRegioesCache() async {
    log("saveRegioesCache");
    MainPreferences? prefereces = await _prefs;
    _client.getRegioes().then((value) {
      List<String> regioesList = [];
      for (var regiao in value) {
        regioesList.add(jsonEncode(regiao.toJson()));
      }
      prefereces.setListString(_regioesKey, regioesList);
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

  void _savePlataformsCache() async {
    log("savePlataforms");
    MainPreferences? preferences = await _prefs;
    _client.getPlataforms().then((value) {
      List<String> plataformList = [];
      for (var plataform in value) {
        plataformList.add(jsonEncode(plataform.toJson()));
      }
      preferences.setListString(_plataformasKey, plataformList);
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
}

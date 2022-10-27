import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:twitter_analiser_app/repository/model/plataform.dart';
import 'package:twitter_analiser_app/repository/model/politico.dart';
import 'package:twitter_analiser_app/repository/model/regiao.dart';
import 'package:twitter_analiser_app/repository/twitter_analiser_server_client.dart';

final logger = Logger();

class TwitterAnaliserRepository {
  final client = TwitterAnaliserServerClient(Dio());

  Future<List<Politico>> getCandidatos() {
    log("getCandidatos");
    return client.getCandidatos();
  }

  Future<List<Regiao>> getRegioes(){
    log("getRegioes");
    return client.getRegioes();
  }

  Future<List<Plataform>> getPlataformas(){
    log("getPlataformas");
    return client.getPlataforms();
  }
}

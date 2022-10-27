
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:twitter_analiser_app/repository/model/plataform.dart';
import 'package:twitter_analiser_app/repository/model/politico.dart';
import 'package:twitter_analiser_app/repository/model/regiao.dart';
part 'twitter_analiser_server_client.g.dart';

@RestApi(baseUrl: "https://twiteranalyserver.herokuapp.com/")
abstract class TwitterAnaliserServerClient{
    factory TwitterAnaliserServerClient(Dio dio, {String baseUrl}) = _TwitterAnaliserServerClient;

    @GET("/candidatos")
    Future<List<Politico>> getCandidatos();

    @GET("/regioes")
    Future<List<Regiao>> getRegioes();

    @GET("/plataformas")
    Future<List<Plataform>> getPlataforms();
}
import 'package:json_annotation/json_annotation.dart';
part 'plataform.g.dart';

@JsonSerializable()
class Plataform{
  String? source;

  Plataform(this.source);

  factory Plataform.fromJson(Map<String,dynamic> json) => _$PlataformFromJson(json);

  Map<String,dynamic> toJson() => _$PlataformToJson(this);
}
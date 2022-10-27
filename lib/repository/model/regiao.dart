
import 'package:json_annotation/json_annotation.dart';
part 'regiao.g.dart';

@JsonSerializable()
class Regiao{
  String? cidade;

  Regiao(this.cidade);

  factory Regiao.fromJson(Map<String,dynamic> json) => _$RegiaoFromJson(json);

  Map<String,dynamic> toJson() => _$RegiaoToJson(this);

}
import 'package:json_annotation/json_annotation.dart';
part 'politico.g.dart';

@JsonSerializable()
class Politico{
  String? politico;

  Politico(this.politico);

  factory Politico.fromJson(Map<String, dynamic> json) => _$PoliticoFromJson(json);

  Map<String,dynamic> toJson() => _$PoliticoToJson(this);
}
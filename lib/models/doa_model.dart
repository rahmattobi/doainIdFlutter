import 'package:json_annotation/json_annotation.dart';

part 'doa_model.g.dart';

@JsonSerializable()
class DoaModel {
  String? id;
  String? doa;
  String? ayat;
  String? latin;
  String? artinya;

  DoaModel({
    this.id,
    this.doa,
    this.ayat,
    this.latin,
    this.artinya,
  });

  factory DoaModel.fromJson(Map<String, dynamic> json) =>
      _$DoaModelFromJson(json);

  Map<String, dynamic> toJson() => _$DoaModelToJson(this);
}

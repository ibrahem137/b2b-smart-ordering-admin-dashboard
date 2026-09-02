import 'package:freezed_annotation/freezed_annotation.dart';

part 'supplier_model.freezed.dart';
part 'supplier_model.g.dart';

@freezed
abstract class SupplierModel with _$SupplierModel {
  const factory SupplierModel({
    required int id,
    required String name,
    String? phone,
    String? email,
    String? address,
    required String status,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  }) = _SupplierModel;

  factory SupplierModel.fromJson(Map<String, dynamic> json) =>
      _$SupplierModelFromJson(json);

  const SupplierModel._();

  bool get isActive => status.toLowerCase() == 'active';
}

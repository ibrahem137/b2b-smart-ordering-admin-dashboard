import 'package:freezed_annotation/freezed_annotation.dart';

part 'store_model.freezed.dart';
part 'store_model.g.dart';

@freezed
abstract class StoreModel with _$StoreModel {
  const factory StoreModel({
    required int id,

    required String name,

    @JsonKey(name: 'owner_name') required String ownerName,

    required String phone,

    required String email,

    String? address,

    required String status,

    @JsonKey(name: 'image_url') String? imageUrl,

    @JsonKey(name: 'created_at') String? createdAt,

    @JsonKey(name: 'updated_at') String? updatedAt,
  }) = _StoreModel;

  factory StoreModel.fromJson(Map<String, dynamic> json) =>
      _$StoreModelFromJson(json);
}

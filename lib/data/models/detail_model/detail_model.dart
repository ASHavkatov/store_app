import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
part 'detail_model.freezed.dart';
part 'detail_model.g.dart';


@freezed
abstract class DetailModel with _$DetailModel {

 const factory DetailModel({
    required int id,
    required String title,
    required String description,
    required int price,
    required bool isLiked,
    required int reviewsCount,
    required num rating,
    @JsonKey(name: 'productImages') required List<DetailImageModel>productImage,
  }) = _DetailModel;

 factory DetailModel.fromJson(Map<String, dynamic> json)=> _$DetailModelFromJson(json);
}

@freezed
abstract class DetailImageModel with _$DetailImageModel {
  const factory DetailImageModel({required String image, required int id}) = _DetailImageModel;

  factory DetailImageModel.fromJson(Map<String, dynamic> json) => _$DetailImageModelFromJson(json);
}


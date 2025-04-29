// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DetailModel {

 int get id; String get title; String get desc; int get price; bool get isLiked; int get reviewCount; num get rating;@JsonKey(name: 'productImages') List<DetailImageModel> get productImage;
/// Create a copy of DetailModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DetailModelCopyWith<DetailModel> get copyWith => _$DetailModelCopyWithImpl<DetailModel>(this as DetailModel, _$identity);

  /// Serializes this DetailModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DetailModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.desc, desc) || other.desc == desc)&&(identical(other.price, price) || other.price == price)&&(identical(other.isLiked, isLiked) || other.isLiked == isLiked)&&(identical(other.reviewCount, reviewCount) || other.reviewCount == reviewCount)&&(identical(other.rating, rating) || other.rating == rating)&&const DeepCollectionEquality().equals(other.productImage, productImage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,desc,price,isLiked,reviewCount,rating,const DeepCollectionEquality().hash(productImage));

@override
String toString() {
  return 'DetailModel(id: $id, title: $title, desc: $desc, price: $price, isLiked: $isLiked, reviewCount: $reviewCount, rating: $rating, productImage: $productImage)';
}


}

/// @nodoc
abstract mixin class $DetailModelCopyWith<$Res>  {
  factory $DetailModelCopyWith(DetailModel value, $Res Function(DetailModel) _then) = _$DetailModelCopyWithImpl;
@useResult
$Res call({
 int id, String title, String desc, int price, bool isLiked, int reviewCount, num rating,@JsonKey(name: 'productImages') List<DetailImageModel> productImage
});




}
/// @nodoc
class _$DetailModelCopyWithImpl<$Res>
    implements $DetailModelCopyWith<$Res> {
  _$DetailModelCopyWithImpl(this._self, this._then);

  final DetailModel _self;
  final $Res Function(DetailModel) _then;

/// Create a copy of DetailModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? desc = null,Object? price = null,Object? isLiked = null,Object? reviewCount = null,Object? rating = null,Object? productImage = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,desc: null == desc ? _self.desc : desc // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,isLiked: null == isLiked ? _self.isLiked : isLiked // ignore: cast_nullable_to_non_nullable
as bool,reviewCount: null == reviewCount ? _self.reviewCount : reviewCount // ignore: cast_nullable_to_non_nullable
as int,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as num,productImage: null == productImage ? _self.productImage : productImage // ignore: cast_nullable_to_non_nullable
as List<DetailImageModel>,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _DetailModel implements DetailModel {
  const _DetailModel({required this.id, required this.title, required this.desc, required this.price, required this.isLiked, required this.reviewCount, required this.rating, @JsonKey(name: 'productImages') required final  List<DetailImageModel> productImage}): _productImage = productImage;
  factory _DetailModel.fromJson(Map<String, dynamic> json) => _$DetailModelFromJson(json);

@override final  int id;
@override final  String title;
@override final  String desc;
@override final  int price;
@override final  bool isLiked;
@override final  int reviewCount;
@override final  num rating;
 final  List<DetailImageModel> _productImage;
@override@JsonKey(name: 'productImages') List<DetailImageModel> get productImage {
  if (_productImage is EqualUnmodifiableListView) return _productImage;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_productImage);
}


/// Create a copy of DetailModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DetailModelCopyWith<_DetailModel> get copyWith => __$DetailModelCopyWithImpl<_DetailModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DetailModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DetailModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.desc, desc) || other.desc == desc)&&(identical(other.price, price) || other.price == price)&&(identical(other.isLiked, isLiked) || other.isLiked == isLiked)&&(identical(other.reviewCount, reviewCount) || other.reviewCount == reviewCount)&&(identical(other.rating, rating) || other.rating == rating)&&const DeepCollectionEquality().equals(other._productImage, _productImage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,desc,price,isLiked,reviewCount,rating,const DeepCollectionEquality().hash(_productImage));

@override
String toString() {
  return 'DetailModel(id: $id, title: $title, desc: $desc, price: $price, isLiked: $isLiked, reviewCount: $reviewCount, rating: $rating, productImage: $productImage)';
}


}

/// @nodoc
abstract mixin class _$DetailModelCopyWith<$Res> implements $DetailModelCopyWith<$Res> {
  factory _$DetailModelCopyWith(_DetailModel value, $Res Function(_DetailModel) _then) = __$DetailModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String title, String desc, int price, bool isLiked, int reviewCount, num rating,@JsonKey(name: 'productImages') List<DetailImageModel> productImage
});




}
/// @nodoc
class __$DetailModelCopyWithImpl<$Res>
    implements _$DetailModelCopyWith<$Res> {
  __$DetailModelCopyWithImpl(this._self, this._then);

  final _DetailModel _self;
  final $Res Function(_DetailModel) _then;

/// Create a copy of DetailModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? desc = null,Object? price = null,Object? isLiked = null,Object? reviewCount = null,Object? rating = null,Object? productImage = null,}) {
  return _then(_DetailModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,desc: null == desc ? _self.desc : desc // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,isLiked: null == isLiked ? _self.isLiked : isLiked // ignore: cast_nullable_to_non_nullable
as bool,reviewCount: null == reviewCount ? _self.reviewCount : reviewCount // ignore: cast_nullable_to_non_nullable
as int,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as num,productImage: null == productImage ? _self._productImage : productImage // ignore: cast_nullable_to_non_nullable
as List<DetailImageModel>,
  ));
}


}


/// @nodoc
mixin _$DetailImageModel {

 String get image; int get id;
/// Create a copy of DetailImageModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DetailImageModelCopyWith<DetailImageModel> get copyWith => _$DetailImageModelCopyWithImpl<DetailImageModel>(this as DetailImageModel, _$identity);

  /// Serializes this DetailImageModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DetailImageModel&&(identical(other.image, image) || other.image == image)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,image,id);

@override
String toString() {
  return 'DetailImageModel(image: $image, id: $id)';
}


}

/// @nodoc
abstract mixin class $DetailImageModelCopyWith<$Res>  {
  factory $DetailImageModelCopyWith(DetailImageModel value, $Res Function(DetailImageModel) _then) = _$DetailImageModelCopyWithImpl;
@useResult
$Res call({
 String image, int id
});




}
/// @nodoc
class _$DetailImageModelCopyWithImpl<$Res>
    implements $DetailImageModelCopyWith<$Res> {
  _$DetailImageModelCopyWithImpl(this._self, this._then);

  final DetailImageModel _self;
  final $Res Function(DetailImageModel) _then;

/// Create a copy of DetailImageModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? image = null,Object? id = null,}) {
  return _then(_self.copyWith(
image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _DetailImageModel implements DetailImageModel {
  const _DetailImageModel({required this.image, required this.id});
  factory _DetailImageModel.fromJson(Map<String, dynamic> json) => _$DetailImageModelFromJson(json);

@override final  String image;
@override final  int id;

/// Create a copy of DetailImageModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DetailImageModelCopyWith<_DetailImageModel> get copyWith => __$DetailImageModelCopyWithImpl<_DetailImageModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DetailImageModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DetailImageModel&&(identical(other.image, image) || other.image == image)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,image,id);

@override
String toString() {
  return 'DetailImageModel(image: $image, id: $id)';
}


}

/// @nodoc
abstract mixin class _$DetailImageModelCopyWith<$Res> implements $DetailImageModelCopyWith<$Res> {
  factory _$DetailImageModelCopyWith(_DetailImageModel value, $Res Function(_DetailImageModel) _then) = __$DetailImageModelCopyWithImpl;
@override @useResult
$Res call({
 String image, int id
});




}
/// @nodoc
class __$DetailImageModelCopyWithImpl<$Res>
    implements _$DetailImageModelCopyWith<$Res> {
  __$DetailImageModelCopyWithImpl(this._self, this._then);

  final _DetailImageModel _self;
  final $Res Function(_DetailImageModel) _then;

/// Create a copy of DetailImageModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? image = null,Object? id = null,}) {
  return _then(_DetailImageModel(
image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on

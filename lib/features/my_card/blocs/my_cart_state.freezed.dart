// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_cart_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MyCartState {

 MyCartModel get model; MyCartStatus get status;
/// Create a copy of MyCartState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MyCartStateCopyWith<MyCartState> get copyWith => _$MyCartStateCopyWithImpl<MyCartState>(this as MyCartState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyCartState&&(identical(other.model, model) || other.model == model)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,model,status);

@override
String toString() {
  return 'MyCartState(model: $model, status: $status)';
}


}

/// @nodoc
abstract mixin class $MyCartStateCopyWith<$Res>  {
  factory $MyCartStateCopyWith(MyCartState value, $Res Function(MyCartState) _then) = _$MyCartStateCopyWithImpl;
@useResult
$Res call({
 MyCartModel model, MyCartStatus status
});




}
/// @nodoc
class _$MyCartStateCopyWithImpl<$Res>
    implements $MyCartStateCopyWith<$Res> {
  _$MyCartStateCopyWithImpl(this._self, this._then);

  final MyCartState _self;
  final $Res Function(MyCartState) _then;

/// Create a copy of MyCartState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? model = null,Object? status = null,}) {
  return _then(_self.copyWith(
model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as MyCartModel,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as MyCartStatus,
  ));
}

}


/// @nodoc


class _MyCartState implements MyCartState {
  const _MyCartState({required this.model, required this.status});
  

@override final  MyCartModel model;
@override final  MyCartStatus status;

/// Create a copy of MyCartState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MyCartStateCopyWith<_MyCartState> get copyWith => __$MyCartStateCopyWithImpl<_MyCartState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MyCartState&&(identical(other.model, model) || other.model == model)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,model,status);

@override
String toString() {
  return 'MyCartState(model: $model, status: $status)';
}


}

/// @nodoc
abstract mixin class _$MyCartStateCopyWith<$Res> implements $MyCartStateCopyWith<$Res> {
  factory _$MyCartStateCopyWith(_MyCartState value, $Res Function(_MyCartState) _then) = __$MyCartStateCopyWithImpl;
@override @useResult
$Res call({
 MyCartModel model, MyCartStatus status
});




}
/// @nodoc
class __$MyCartStateCopyWithImpl<$Res>
    implements _$MyCartStateCopyWith<$Res> {
  __$MyCartStateCopyWithImpl(this._self, this._then);

  final _MyCartState _self;
  final $Res Function(_MyCartState) _then;

/// Create a copy of MyCartState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? model = null,Object? status = null,}) {
  return _then(_MyCartState(
model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as MyCartModel,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as MyCartStatus,
  ));
}


}

// dart format on

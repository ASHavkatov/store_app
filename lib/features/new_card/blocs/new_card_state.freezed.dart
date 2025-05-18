// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'new_card_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NewCardState {

 NewCardStatus get status; NewCardModel? get model;
/// Create a copy of NewCardState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NewCardStateCopyWith<NewCardState> get copyWith => _$NewCardStateCopyWithImpl<NewCardState>(this as NewCardState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NewCardState&&(identical(other.status, status) || other.status == status)&&(identical(other.model, model) || other.model == model));
}


@override
int get hashCode => Object.hash(runtimeType,status,model);

@override
String toString() {
  return 'NewCardState(status: $status, model: $model)';
}


}

/// @nodoc
abstract mixin class $NewCardStateCopyWith<$Res>  {
  factory $NewCardStateCopyWith(NewCardState value, $Res Function(NewCardState) _then) = _$NewCardStateCopyWithImpl;
@useResult
$Res call({
 NewCardStatus status, NewCardModel? model
});




}
/// @nodoc
class _$NewCardStateCopyWithImpl<$Res>
    implements $NewCardStateCopyWith<$Res> {
  _$NewCardStateCopyWithImpl(this._self, this._then);

  final NewCardState _self;
  final $Res Function(NewCardState) _then;

/// Create a copy of NewCardState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? model = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as NewCardStatus,model: freezed == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as NewCardModel?,
  ));
}

}


/// @nodoc


class _NewCardState implements NewCardState {
  const _NewCardState({required this.status, required this.model});
  

@override final  NewCardStatus status;
@override final  NewCardModel? model;

/// Create a copy of NewCardState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NewCardStateCopyWith<_NewCardState> get copyWith => __$NewCardStateCopyWithImpl<_NewCardState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NewCardState&&(identical(other.status, status) || other.status == status)&&(identical(other.model, model) || other.model == model));
}


@override
int get hashCode => Object.hash(runtimeType,status,model);

@override
String toString() {
  return 'NewCardState(status: $status, model: $model)';
}


}

/// @nodoc
abstract mixin class _$NewCardStateCopyWith<$Res> implements $NewCardStateCopyWith<$Res> {
  factory _$NewCardStateCopyWith(_NewCardState value, $Res Function(_NewCardState) _then) = __$NewCardStateCopyWithImpl;
@override @useResult
$Res call({
 NewCardStatus status, NewCardModel? model
});




}
/// @nodoc
class __$NewCardStateCopyWithImpl<$Res>
    implements _$NewCardStateCopyWith<$Res> {
  __$NewCardStateCopyWithImpl(this._self, this._then);

  final _NewCardState _self;
  final $Res Function(_NewCardState) _then;

/// Create a copy of NewCardState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? model = freezed,}) {
  return _then(_NewCardState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as NewCardStatus,model: freezed == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as NewCardModel?,
  ));
}


}

// dart format on

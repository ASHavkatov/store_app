// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'card_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CardState {

 List<CardModel>? get model; CardStatus get status;
/// Create a copy of CardState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CardStateCopyWith<CardState> get copyWith => _$CardStateCopyWithImpl<CardState>(this as CardState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CardState&&const DeepCollectionEquality().equals(other.model, model)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(model),status);

@override
String toString() {
  return 'CardState(model: $model, status: $status)';
}


}

/// @nodoc
abstract mixin class $CardStateCopyWith<$Res>  {
  factory $CardStateCopyWith(CardState value, $Res Function(CardState) _then) = _$CardStateCopyWithImpl;
@useResult
$Res call({
 List<CardModel>? model, CardStatus status
});




}
/// @nodoc
class _$CardStateCopyWithImpl<$Res>
    implements $CardStateCopyWith<$Res> {
  _$CardStateCopyWithImpl(this._self, this._then);

  final CardState _self;
  final $Res Function(CardState) _then;

/// Create a copy of CardState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? model = freezed,Object? status = null,}) {
  return _then(_self.copyWith(
model: freezed == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as List<CardModel>?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CardStatus,
  ));
}

}


/// @nodoc


class _CardState implements CardState {
  const _CardState({required final  List<CardModel>? model, required this.status}): _model = model;
  

 final  List<CardModel>? _model;
@override List<CardModel>? get model {
  final value = _model;
  if (value == null) return null;
  if (_model is EqualUnmodifiableListView) return _model;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  CardStatus status;

/// Create a copy of CardState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CardStateCopyWith<_CardState> get copyWith => __$CardStateCopyWithImpl<_CardState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CardState&&const DeepCollectionEquality().equals(other._model, _model)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_model),status);

@override
String toString() {
  return 'CardState(model: $model, status: $status)';
}


}

/// @nodoc
abstract mixin class _$CardStateCopyWith<$Res> implements $CardStateCopyWith<$Res> {
  factory _$CardStateCopyWith(_CardState value, $Res Function(_CardState) _then) = __$CardStateCopyWithImpl;
@override @useResult
$Res call({
 List<CardModel>? model, CardStatus status
});




}
/// @nodoc
class __$CardStateCopyWithImpl<$Res>
    implements _$CardStateCopyWith<$Res> {
  __$CardStateCopyWithImpl(this._self, this._then);

  final _CardState _self;
  final $Res Function(_CardState) _then;

/// Create a copy of CardState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? model = freezed,Object? status = null,}) {
  return _then(_CardState(
model: freezed == model ? _self._model : model // ignore: cast_nullable_to_non_nullable
as List<CardModel>?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CardStatus,
  ));
}


}

// dart format on

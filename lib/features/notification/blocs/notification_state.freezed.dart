// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NotificationState {

 NotificationStatus? get status; List<NotificationModel> get model;
/// Create a copy of NotificationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationStateCopyWith<NotificationState> get copyWith => _$NotificationStateCopyWithImpl<NotificationState>(this as NotificationState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.model, model));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(model));

@override
String toString() {
  return 'NotificationState(status: $status, model: $model)';
}


}

/// @nodoc
abstract mixin class $NotificationStateCopyWith<$Res>  {
  factory $NotificationStateCopyWith(NotificationState value, $Res Function(NotificationState) _then) = _$NotificationStateCopyWithImpl;
@useResult
$Res call({
 NotificationStatus? status, List<NotificationModel> model
});




}
/// @nodoc
class _$NotificationStateCopyWithImpl<$Res>
    implements $NotificationStateCopyWith<$Res> {
  _$NotificationStateCopyWithImpl(this._self, this._then);

  final NotificationState _self;
  final $Res Function(NotificationState) _then;

/// Create a copy of NotificationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = freezed,Object? model = null,}) {
  return _then(_self.copyWith(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as NotificationStatus?,model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as List<NotificationModel>,
  ));
}

}


/// @nodoc


class _NotificationState implements NotificationState {
  const _NotificationState({required this.status, required final  List<NotificationModel> model}): _model = model;
  

@override final  NotificationStatus? status;
 final  List<NotificationModel> _model;
@override List<NotificationModel> get model {
  if (_model is EqualUnmodifiableListView) return _model;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_model);
}


/// Create a copy of NotificationState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotificationStateCopyWith<_NotificationState> get copyWith => __$NotificationStateCopyWithImpl<_NotificationState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotificationState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._model, _model));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_model));

@override
String toString() {
  return 'NotificationState(status: $status, model: $model)';
}


}

/// @nodoc
abstract mixin class _$NotificationStateCopyWith<$Res> implements $NotificationStateCopyWith<$Res> {
  factory _$NotificationStateCopyWith(_NotificationState value, $Res Function(_NotificationState) _then) = __$NotificationStateCopyWithImpl;
@override @useResult
$Res call({
 NotificationStatus? status, List<NotificationModel> model
});




}
/// @nodoc
class __$NotificationStateCopyWithImpl<$Res>
    implements _$NotificationStateCopyWith<$Res> {
  __$NotificationStateCopyWithImpl(this._self, this._then);

  final _NotificationState _self;
  final $Res Function(_NotificationState) _then;

/// Create a copy of NotificationState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = freezed,Object? model = null,}) {
  return _then(_NotificationState(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as NotificationStatus?,model: null == model ? _self._model : model // ignore: cast_nullable_to_non_nullable
as List<NotificationModel>,
  ));
}


}

// dart format on

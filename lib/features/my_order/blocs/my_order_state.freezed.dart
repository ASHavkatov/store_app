// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_order_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MyOrderState {

 MyOrderStatus get status; List<MyOrderModel> get model;
/// Create a copy of MyOrderState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MyOrderStateCopyWith<MyOrderState> get copyWith => _$MyOrderStateCopyWithImpl<MyOrderState>(this as MyOrderState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyOrderState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.model, model));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(model));

@override
String toString() {
  return 'MyOrderState(status: $status, model: $model)';
}


}

/// @nodoc
abstract mixin class $MyOrderStateCopyWith<$Res>  {
  factory $MyOrderStateCopyWith(MyOrderState value, $Res Function(MyOrderState) _then) = _$MyOrderStateCopyWithImpl;
@useResult
$Res call({
 MyOrderStatus status, List<MyOrderModel> model
});




}
/// @nodoc
class _$MyOrderStateCopyWithImpl<$Res>
    implements $MyOrderStateCopyWith<$Res> {
  _$MyOrderStateCopyWithImpl(this._self, this._then);

  final MyOrderState _self;
  final $Res Function(MyOrderState) _then;

/// Create a copy of MyOrderState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? model = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as MyOrderStatus,model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as List<MyOrderModel>,
  ));
}

}


/// @nodoc


class _MyOrderState implements MyOrderState {
  const _MyOrderState({required this.status, required final  List<MyOrderModel> model}): _model = model;
  

@override final  MyOrderStatus status;
 final  List<MyOrderModel> _model;
@override List<MyOrderModel> get model {
  if (_model is EqualUnmodifiableListView) return _model;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_model);
}


/// Create a copy of MyOrderState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MyOrderStateCopyWith<_MyOrderState> get copyWith => __$MyOrderStateCopyWithImpl<_MyOrderState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MyOrderState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._model, _model));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_model));

@override
String toString() {
  return 'MyOrderState(status: $status, model: $model)';
}


}

/// @nodoc
abstract mixin class _$MyOrderStateCopyWith<$Res> implements $MyOrderStateCopyWith<$Res> {
  factory _$MyOrderStateCopyWith(_MyOrderState value, $Res Function(_MyOrderState) _then) = __$MyOrderStateCopyWithImpl;
@override @useResult
$Res call({
 MyOrderStatus status, List<MyOrderModel> model
});




}
/// @nodoc
class __$MyOrderStateCopyWithImpl<$Res>
    implements _$MyOrderStateCopyWith<$Res> {
  __$MyOrderStateCopyWithImpl(this._self, this._then);

  final _MyOrderState _self;
  final $Res Function(_MyOrderState) _then;

/// Create a copy of MyOrderState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? model = null,}) {
  return _then(_MyOrderState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as MyOrderStatus,model: null == model ? _self._model : model // ignore: cast_nullable_to_non_nullable
as List<MyOrderModel>,
  ));
}


}

// dart format on

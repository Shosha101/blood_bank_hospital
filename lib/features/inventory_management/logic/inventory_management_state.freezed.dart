// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inventory_management_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$InventoryManagementState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InventoryManagementState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'InventoryManagementState()';
}


}

/// @nodoc
class $InventoryManagementStateCopyWith<$Res>  {
$InventoryManagementStateCopyWith(InventoryManagementState _, $Res Function(InventoryManagementState) __);
}


/// Adds pattern-matching-related methods to [InventoryManagementState].
extension InventoryManagementStatePatterns on InventoryManagementState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( InventoryManagementStateLoading value)?  hospitalsLoading,TResult Function( InventoryManagementStateError value)?  hospitalsError,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case InventoryManagementStateLoading() when hospitalsLoading != null:
return hospitalsLoading(_that);case InventoryManagementStateError() when hospitalsError != null:
return hospitalsError(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( InventoryManagementStateLoading value)  hospitalsLoading,required TResult Function( InventoryManagementStateError value)  hospitalsError,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case InventoryManagementStateLoading():
return hospitalsLoading(_that);case InventoryManagementStateError():
return hospitalsError(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( InventoryManagementStateLoading value)?  hospitalsLoading,TResult? Function( InventoryManagementStateError value)?  hospitalsError,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case InventoryManagementStateLoading() when hospitalsLoading != null:
return hospitalsLoading(_that);case InventoryManagementStateError() when hospitalsError != null:
return hospitalsError(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  hospitalsLoading,TResult Function( ErrorHandler errorHandler)?  hospitalsError,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case InventoryManagementStateLoading() when hospitalsLoading != null:
return hospitalsLoading();case InventoryManagementStateError() when hospitalsError != null:
return hospitalsError(_that.errorHandler);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  hospitalsLoading,required TResult Function( ErrorHandler errorHandler)  hospitalsError,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case InventoryManagementStateLoading():
return hospitalsLoading();case InventoryManagementStateError():
return hospitalsError(_that.errorHandler);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  hospitalsLoading,TResult? Function( ErrorHandler errorHandler)?  hospitalsError,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case InventoryManagementStateLoading() when hospitalsLoading != null:
return hospitalsLoading();case InventoryManagementStateError() when hospitalsError != null:
return hospitalsError(_that.errorHandler);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements InventoryManagementState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'InventoryManagementState.initial()';
}


}




/// @nodoc


class InventoryManagementStateLoading implements InventoryManagementState {
  const InventoryManagementStateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InventoryManagementStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'InventoryManagementState.hospitalsLoading()';
}


}




/// @nodoc


class InventoryManagementStateError implements InventoryManagementState {
  const InventoryManagementStateError(this.errorHandler);
  

 final  ErrorHandler errorHandler;

/// Create a copy of InventoryManagementState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InventoryManagementStateErrorCopyWith<InventoryManagementStateError> get copyWith => _$InventoryManagementStateErrorCopyWithImpl<InventoryManagementStateError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InventoryManagementStateError&&(identical(other.errorHandler, errorHandler) || other.errorHandler == errorHandler));
}


@override
int get hashCode => Object.hash(runtimeType,errorHandler);

@override
String toString() {
  return 'InventoryManagementState.hospitalsError(errorHandler: $errorHandler)';
}


}

/// @nodoc
abstract mixin class $InventoryManagementStateErrorCopyWith<$Res> implements $InventoryManagementStateCopyWith<$Res> {
  factory $InventoryManagementStateErrorCopyWith(InventoryManagementStateError value, $Res Function(InventoryManagementStateError) _then) = _$InventoryManagementStateErrorCopyWithImpl;
@useResult
$Res call({
 ErrorHandler errorHandler
});




}
/// @nodoc
class _$InventoryManagementStateErrorCopyWithImpl<$Res>
    implements $InventoryManagementStateErrorCopyWith<$Res> {
  _$InventoryManagementStateErrorCopyWithImpl(this._self, this._then);

  final InventoryManagementStateError _self;
  final $Res Function(InventoryManagementStateError) _then;

/// Create a copy of InventoryManagementState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorHandler = null,}) {
  return _then(InventoryManagementStateError(
null == errorHandler ? _self.errorHandler : errorHandler // ignore: cast_nullable_to_non_nullable
as ErrorHandler,
  ));
}


}

// dart format on

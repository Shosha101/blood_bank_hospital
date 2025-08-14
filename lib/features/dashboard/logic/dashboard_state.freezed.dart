// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DashboardState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashboardState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DashboardState()';
}


}

/// @nodoc
class $DashboardStateCopyWith<$Res>  {
$DashboardStateCopyWith(DashboardState _, $Res Function(DashboardState) __);
}


/// Adds pattern-matching-related methods to [DashboardState].
extension DashboardStatePatterns on DashboardState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( DashboardStateLoading value)?  hospitalsLoading,TResult Function( DashboardStateError value)?  hospitalsError,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case DashboardStateLoading() when hospitalsLoading != null:
return hospitalsLoading(_that);case DashboardStateError() when hospitalsError != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( DashboardStateLoading value)  hospitalsLoading,required TResult Function( DashboardStateError value)  hospitalsError,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case DashboardStateLoading():
return hospitalsLoading(_that);case DashboardStateError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( DashboardStateLoading value)?  hospitalsLoading,TResult? Function( DashboardStateError value)?  hospitalsError,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case DashboardStateLoading() when hospitalsLoading != null:
return hospitalsLoading(_that);case DashboardStateError() when hospitalsError != null:
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
return initial();case DashboardStateLoading() when hospitalsLoading != null:
return hospitalsLoading();case DashboardStateError() when hospitalsError != null:
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
return initial();case DashboardStateLoading():
return hospitalsLoading();case DashboardStateError():
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
return initial();case DashboardStateLoading() when hospitalsLoading != null:
return hospitalsLoading();case DashboardStateError() when hospitalsError != null:
return hospitalsError(_that.errorHandler);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements DashboardState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DashboardState.initial()';
}


}




/// @nodoc


class DashboardStateLoading implements DashboardState {
  const DashboardStateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashboardStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DashboardState.hospitalsLoading()';
}


}




/// @nodoc


class DashboardStateError implements DashboardState {
  const DashboardStateError(this.errorHandler);
  

 final  ErrorHandler errorHandler;

/// Create a copy of DashboardState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DashboardStateErrorCopyWith<DashboardStateError> get copyWith => _$DashboardStateErrorCopyWithImpl<DashboardStateError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashboardStateError&&(identical(other.errorHandler, errorHandler) || other.errorHandler == errorHandler));
}


@override
int get hashCode => Object.hash(runtimeType,errorHandler);

@override
String toString() {
  return 'DashboardState.hospitalsError(errorHandler: $errorHandler)';
}


}

/// @nodoc
abstract mixin class $DashboardStateErrorCopyWith<$Res> implements $DashboardStateCopyWith<$Res> {
  factory $DashboardStateErrorCopyWith(DashboardStateError value, $Res Function(DashboardStateError) _then) = _$DashboardStateErrorCopyWithImpl;
@useResult
$Res call({
 ErrorHandler errorHandler
});




}
/// @nodoc
class _$DashboardStateErrorCopyWithImpl<$Res>
    implements $DashboardStateErrorCopyWith<$Res> {
  _$DashboardStateErrorCopyWithImpl(this._self, this._then);

  final DashboardStateError _self;
  final $Res Function(DashboardStateError) _then;

/// Create a copy of DashboardState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorHandler = null,}) {
  return _then(DashboardStateError(
null == errorHandler ? _self.errorHandler : errorHandler // ignore: cast_nullable_to_non_nullable
as ErrorHandler,
  ));
}


}

// dart format on

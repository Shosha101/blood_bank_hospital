// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'past_requests_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PastRequestsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PastRequestsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PastRequestsState()';
}


}

/// @nodoc
class $PastRequestsStateCopyWith<$Res>  {
$PastRequestsStateCopyWith(PastRequestsState _, $Res Function(PastRequestsState) __);
}


/// Adds pattern-matching-related methods to [PastRequestsState].
extension PastRequestsStatePatterns on PastRequestsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( PastRequestsStateLoading value)?  hospitalsLoading,TResult Function( PastRequestsStateError value)?  hospitalsError,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case PastRequestsStateLoading() when hospitalsLoading != null:
return hospitalsLoading(_that);case PastRequestsStateError() when hospitalsError != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( PastRequestsStateLoading value)  hospitalsLoading,required TResult Function( PastRequestsStateError value)  hospitalsError,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case PastRequestsStateLoading():
return hospitalsLoading(_that);case PastRequestsStateError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( PastRequestsStateLoading value)?  hospitalsLoading,TResult? Function( PastRequestsStateError value)?  hospitalsError,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case PastRequestsStateLoading() when hospitalsLoading != null:
return hospitalsLoading(_that);case PastRequestsStateError() when hospitalsError != null:
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
return initial();case PastRequestsStateLoading() when hospitalsLoading != null:
return hospitalsLoading();case PastRequestsStateError() when hospitalsError != null:
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
return initial();case PastRequestsStateLoading():
return hospitalsLoading();case PastRequestsStateError():
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
return initial();case PastRequestsStateLoading() when hospitalsLoading != null:
return hospitalsLoading();case PastRequestsStateError() when hospitalsError != null:
return hospitalsError(_that.errorHandler);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements PastRequestsState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PastRequestsState.initial()';
}


}




/// @nodoc


class PastRequestsStateLoading implements PastRequestsState {
  const PastRequestsStateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PastRequestsStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PastRequestsState.hospitalsLoading()';
}


}




/// @nodoc


class PastRequestsStateError implements PastRequestsState {
  const PastRequestsStateError(this.errorHandler);
  

 final  ErrorHandler errorHandler;

/// Create a copy of PastRequestsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PastRequestsStateErrorCopyWith<PastRequestsStateError> get copyWith => _$PastRequestsStateErrorCopyWithImpl<PastRequestsStateError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PastRequestsStateError&&(identical(other.errorHandler, errorHandler) || other.errorHandler == errorHandler));
}


@override
int get hashCode => Object.hash(runtimeType,errorHandler);

@override
String toString() {
  return 'PastRequestsState.hospitalsError(errorHandler: $errorHandler)';
}


}

/// @nodoc
abstract mixin class $PastRequestsStateErrorCopyWith<$Res> implements $PastRequestsStateCopyWith<$Res> {
  factory $PastRequestsStateErrorCopyWith(PastRequestsStateError value, $Res Function(PastRequestsStateError) _then) = _$PastRequestsStateErrorCopyWithImpl;
@useResult
$Res call({
 ErrorHandler errorHandler
});




}
/// @nodoc
class _$PastRequestsStateErrorCopyWithImpl<$Res>
    implements $PastRequestsStateErrorCopyWith<$Res> {
  _$PastRequestsStateErrorCopyWithImpl(this._self, this._then);

  final PastRequestsStateError _self;
  final $Res Function(PastRequestsStateError) _then;

/// Create a copy of PastRequestsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorHandler = null,}) {
  return _then(PastRequestsStateError(
null == errorHandler ? _self.errorHandler : errorHandler // ignore: cast_nullable_to_non_nullable
as ErrorHandler,
  ));
}


}

// dart format on

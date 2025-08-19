// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hospital_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HospitalState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HospitalState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HospitalState()';
}


}

/// @nodoc
class $HospitalStateCopyWith<$Res>  {
$HospitalStateCopyWith(HospitalState _, $Res Function(HospitalState) __);
}


/// Adds pattern-matching-related methods to [HospitalState].
extension HospitalStatePatterns on HospitalState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( HospitalStateLoading value)?  loading,TResult Function( HospitalStateSuccess value)?  success,TResult Function( HospitalStateError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case HospitalStateLoading() when loading != null:
return loading(_that);case HospitalStateSuccess() when success != null:
return success(_that);case HospitalStateError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( HospitalStateLoading value)  loading,required TResult Function( HospitalStateSuccess value)  success,required TResult Function( HospitalStateError value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case HospitalStateLoading():
return loading(_that);case HospitalStateSuccess():
return success(_that);case HospitalStateError():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( HospitalStateLoading value)?  loading,TResult? Function( HospitalStateSuccess value)?  success,TResult? Function( HospitalStateError value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case HospitalStateLoading() when loading != null:
return loading(_that);case HospitalStateSuccess() when success != null:
return success(_that);case HospitalStateError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( HospitalModel hospital)?  success,TResult Function( ErrorHandler errorHandler)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case HospitalStateLoading() when loading != null:
return loading();case HospitalStateSuccess() when success != null:
return success(_that.hospital);case HospitalStateError() when error != null:
return error(_that.errorHandler);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( HospitalModel hospital)  success,required TResult Function( ErrorHandler errorHandler)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case HospitalStateLoading():
return loading();case HospitalStateSuccess():
return success(_that.hospital);case HospitalStateError():
return error(_that.errorHandler);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( HospitalModel hospital)?  success,TResult? Function( ErrorHandler errorHandler)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case HospitalStateLoading() when loading != null:
return loading();case HospitalStateSuccess() when success != null:
return success(_that.hospital);case HospitalStateError() when error != null:
return error(_that.errorHandler);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements HospitalState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HospitalState.initial()';
}


}




/// @nodoc


class HospitalStateLoading implements HospitalState {
  const HospitalStateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HospitalStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HospitalState.loading()';
}


}




/// @nodoc


class HospitalStateSuccess implements HospitalState {
  const HospitalStateSuccess(this.hospital);
  

 final  HospitalModel hospital;

/// Create a copy of HospitalState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HospitalStateSuccessCopyWith<HospitalStateSuccess> get copyWith => _$HospitalStateSuccessCopyWithImpl<HospitalStateSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HospitalStateSuccess&&(identical(other.hospital, hospital) || other.hospital == hospital));
}


@override
int get hashCode => Object.hash(runtimeType,hospital);

@override
String toString() {
  return 'HospitalState.success(hospital: $hospital)';
}


}

/// @nodoc
abstract mixin class $HospitalStateSuccessCopyWith<$Res> implements $HospitalStateCopyWith<$Res> {
  factory $HospitalStateSuccessCopyWith(HospitalStateSuccess value, $Res Function(HospitalStateSuccess) _then) = _$HospitalStateSuccessCopyWithImpl;
@useResult
$Res call({
 HospitalModel hospital
});




}
/// @nodoc
class _$HospitalStateSuccessCopyWithImpl<$Res>
    implements $HospitalStateSuccessCopyWith<$Res> {
  _$HospitalStateSuccessCopyWithImpl(this._self, this._then);

  final HospitalStateSuccess _self;
  final $Res Function(HospitalStateSuccess) _then;

/// Create a copy of HospitalState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? hospital = null,}) {
  return _then(HospitalStateSuccess(
null == hospital ? _self.hospital : hospital // ignore: cast_nullable_to_non_nullable
as HospitalModel,
  ));
}


}

/// @nodoc


class HospitalStateError implements HospitalState {
  const HospitalStateError(this.errorHandler);
  

 final  ErrorHandler errorHandler;

/// Create a copy of HospitalState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HospitalStateErrorCopyWith<HospitalStateError> get copyWith => _$HospitalStateErrorCopyWithImpl<HospitalStateError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HospitalStateError&&(identical(other.errorHandler, errorHandler) || other.errorHandler == errorHandler));
}


@override
int get hashCode => Object.hash(runtimeType,errorHandler);

@override
String toString() {
  return 'HospitalState.error(errorHandler: $errorHandler)';
}


}

/// @nodoc
abstract mixin class $HospitalStateErrorCopyWith<$Res> implements $HospitalStateCopyWith<$Res> {
  factory $HospitalStateErrorCopyWith(HospitalStateError value, $Res Function(HospitalStateError) _then) = _$HospitalStateErrorCopyWithImpl;
@useResult
$Res call({
 ErrorHandler errorHandler
});




}
/// @nodoc
class _$HospitalStateErrorCopyWithImpl<$Res>
    implements $HospitalStateErrorCopyWith<$Res> {
  _$HospitalStateErrorCopyWithImpl(this._self, this._then);

  final HospitalStateError _self;
  final $Res Function(HospitalStateError) _then;

/// Create a copy of HospitalState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorHandler = null,}) {
  return _then(HospitalStateError(
null == errorHandler ? _self.errorHandler : errorHandler // ignore: cast_nullable_to_non_nullable
as ErrorHandler,
  ));
}


}

// dart format on

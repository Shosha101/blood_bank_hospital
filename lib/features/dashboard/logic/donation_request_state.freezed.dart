// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'donation_request_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DonationRequestState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DonationRequestState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DonationRequestState()';
}


}

/// @nodoc
class $DonationRequestStateCopyWith<$Res>  {
$DonationRequestStateCopyWith(DonationRequestState _, $Res Function(DonationRequestState) __);
}


/// Adds pattern-matching-related methods to [DonationRequestState].
extension DonationRequestStatePatterns on DonationRequestState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( DonationRequestStateLoading value)?  loading,TResult Function( DonationRequestStateSuccess value)?  success,TResult Function( DonationRequestStateError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case DonationRequestStateLoading() when loading != null:
return loading(_that);case DonationRequestStateSuccess() when success != null:
return success(_that);case DonationRequestStateError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( DonationRequestStateLoading value)  loading,required TResult Function( DonationRequestStateSuccess value)  success,required TResult Function( DonationRequestStateError value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case DonationRequestStateLoading():
return loading(_that);case DonationRequestStateSuccess():
return success(_that);case DonationRequestStateError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( DonationRequestStateLoading value)?  loading,TResult? Function( DonationRequestStateSuccess value)?  success,TResult? Function( DonationRequestStateError value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case DonationRequestStateLoading() when loading != null:
return loading(_that);case DonationRequestStateSuccess() when success != null:
return success(_that);case DonationRequestStateError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function()?  success,TResult Function( ErrorHandler errorHandler)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case DonationRequestStateLoading() when loading != null:
return loading();case DonationRequestStateSuccess() when success != null:
return success();case DonationRequestStateError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function()  success,required TResult Function( ErrorHandler errorHandler)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case DonationRequestStateLoading():
return loading();case DonationRequestStateSuccess():
return success();case DonationRequestStateError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function()?  success,TResult? Function( ErrorHandler errorHandler)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case DonationRequestStateLoading() when loading != null:
return loading();case DonationRequestStateSuccess() when success != null:
return success();case DonationRequestStateError() when error != null:
return error(_that.errorHandler);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements DonationRequestState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DonationRequestState.initial()';
}


}




/// @nodoc


class DonationRequestStateLoading implements DonationRequestState {
  const DonationRequestStateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DonationRequestStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DonationRequestState.loading()';
}


}




/// @nodoc


class DonationRequestStateSuccess implements DonationRequestState {
  const DonationRequestStateSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DonationRequestStateSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DonationRequestState.success()';
}


}




/// @nodoc


class DonationRequestStateError implements DonationRequestState {
  const DonationRequestStateError(this.errorHandler);
  

 final  ErrorHandler errorHandler;

/// Create a copy of DonationRequestState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DonationRequestStateErrorCopyWith<DonationRequestStateError> get copyWith => _$DonationRequestStateErrorCopyWithImpl<DonationRequestStateError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DonationRequestStateError&&(identical(other.errorHandler, errorHandler) || other.errorHandler == errorHandler));
}


@override
int get hashCode => Object.hash(runtimeType,errorHandler);

@override
String toString() {
  return 'DonationRequestState.error(errorHandler: $errorHandler)';
}


}

/// @nodoc
abstract mixin class $DonationRequestStateErrorCopyWith<$Res> implements $DonationRequestStateCopyWith<$Res> {
  factory $DonationRequestStateErrorCopyWith(DonationRequestStateError value, $Res Function(DonationRequestStateError) _then) = _$DonationRequestStateErrorCopyWithImpl;
@useResult
$Res call({
 ErrorHandler errorHandler
});




}
/// @nodoc
class _$DonationRequestStateErrorCopyWithImpl<$Res>
    implements $DonationRequestStateErrorCopyWith<$Res> {
  _$DonationRequestStateErrorCopyWithImpl(this._self, this._then);

  final DonationRequestStateError _self;
  final $Res Function(DonationRequestStateError) _then;

/// Create a copy of DonationRequestState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorHandler = null,}) {
  return _then(DonationRequestStateError(
null == errorHandler ? _self.errorHandler : errorHandler // ignore: cast_nullable_to_non_nullable
as ErrorHandler,
  ));
}


}

// dart format on

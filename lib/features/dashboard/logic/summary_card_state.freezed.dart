// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'summary_card_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SummaryCardState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SummaryCardState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SummaryCardState()';
}


}

/// @nodoc
class $SummaryCardStateCopyWith<$Res>  {
$SummaryCardStateCopyWith(SummaryCardState _, $Res Function(SummaryCardState) __);
}


/// Adds pattern-matching-related methods to [SummaryCardState].
extension SummaryCardStatePatterns on SummaryCardState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( SummaryCardStateLoading value)?  loading,TResult Function( SummaryCardStateSuccess value)?  success,TResult Function( SummaryCardStateError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case SummaryCardStateLoading() when loading != null:
return loading(_that);case SummaryCardStateSuccess() when success != null:
return success(_that);case SummaryCardStateError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( SummaryCardStateLoading value)  loading,required TResult Function( SummaryCardStateSuccess value)  success,required TResult Function( SummaryCardStateError value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case SummaryCardStateLoading():
return loading(_that);case SummaryCardStateSuccess():
return success(_that);case SummaryCardStateError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( SummaryCardStateLoading value)?  loading,TResult? Function( SummaryCardStateSuccess value)?  success,TResult? Function( SummaryCardStateError value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case SummaryCardStateLoading() when loading != null:
return loading(_that);case SummaryCardStateSuccess() when success != null:
return success(_that);case SummaryCardStateError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( int openRequestsCount,  int completedRequestsCount)?  success,TResult Function( ErrorHandler errorHandler)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case SummaryCardStateLoading() when loading != null:
return loading();case SummaryCardStateSuccess() when success != null:
return success(_that.openRequestsCount,_that.completedRequestsCount);case SummaryCardStateError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( int openRequestsCount,  int completedRequestsCount)  success,required TResult Function( ErrorHandler errorHandler)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case SummaryCardStateLoading():
return loading();case SummaryCardStateSuccess():
return success(_that.openRequestsCount,_that.completedRequestsCount);case SummaryCardStateError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( int openRequestsCount,  int completedRequestsCount)?  success,TResult? Function( ErrorHandler errorHandler)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case SummaryCardStateLoading() when loading != null:
return loading();case SummaryCardStateSuccess() when success != null:
return success(_that.openRequestsCount,_that.completedRequestsCount);case SummaryCardStateError() when error != null:
return error(_that.errorHandler);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements SummaryCardState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SummaryCardState.initial()';
}


}




/// @nodoc


class SummaryCardStateLoading implements SummaryCardState {
  const SummaryCardStateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SummaryCardStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SummaryCardState.loading()';
}


}




/// @nodoc


class SummaryCardStateSuccess implements SummaryCardState {
  const SummaryCardStateSuccess({required this.openRequestsCount, required this.completedRequestsCount});
  

 final  int openRequestsCount;
 final  int completedRequestsCount;

/// Create a copy of SummaryCardState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SummaryCardStateSuccessCopyWith<SummaryCardStateSuccess> get copyWith => _$SummaryCardStateSuccessCopyWithImpl<SummaryCardStateSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SummaryCardStateSuccess&&(identical(other.openRequestsCount, openRequestsCount) || other.openRequestsCount == openRequestsCount)&&(identical(other.completedRequestsCount, completedRequestsCount) || other.completedRequestsCount == completedRequestsCount));
}


@override
int get hashCode => Object.hash(runtimeType,openRequestsCount,completedRequestsCount);

@override
String toString() {
  return 'SummaryCardState.success(openRequestsCount: $openRequestsCount, completedRequestsCount: $completedRequestsCount)';
}


}

/// @nodoc
abstract mixin class $SummaryCardStateSuccessCopyWith<$Res> implements $SummaryCardStateCopyWith<$Res> {
  factory $SummaryCardStateSuccessCopyWith(SummaryCardStateSuccess value, $Res Function(SummaryCardStateSuccess) _then) = _$SummaryCardStateSuccessCopyWithImpl;
@useResult
$Res call({
 int openRequestsCount, int completedRequestsCount
});




}
/// @nodoc
class _$SummaryCardStateSuccessCopyWithImpl<$Res>
    implements $SummaryCardStateSuccessCopyWith<$Res> {
  _$SummaryCardStateSuccessCopyWithImpl(this._self, this._then);

  final SummaryCardStateSuccess _self;
  final $Res Function(SummaryCardStateSuccess) _then;

/// Create a copy of SummaryCardState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? openRequestsCount = null,Object? completedRequestsCount = null,}) {
  return _then(SummaryCardStateSuccess(
openRequestsCount: null == openRequestsCount ? _self.openRequestsCount : openRequestsCount // ignore: cast_nullable_to_non_nullable
as int,completedRequestsCount: null == completedRequestsCount ? _self.completedRequestsCount : completedRequestsCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class SummaryCardStateError implements SummaryCardState {
  const SummaryCardStateError(this.errorHandler);
  

 final  ErrorHandler errorHandler;

/// Create a copy of SummaryCardState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SummaryCardStateErrorCopyWith<SummaryCardStateError> get copyWith => _$SummaryCardStateErrorCopyWithImpl<SummaryCardStateError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SummaryCardStateError&&(identical(other.errorHandler, errorHandler) || other.errorHandler == errorHandler));
}


@override
int get hashCode => Object.hash(runtimeType,errorHandler);

@override
String toString() {
  return 'SummaryCardState.error(errorHandler: $errorHandler)';
}


}

/// @nodoc
abstract mixin class $SummaryCardStateErrorCopyWith<$Res> implements $SummaryCardStateCopyWith<$Res> {
  factory $SummaryCardStateErrorCopyWith(SummaryCardStateError value, $Res Function(SummaryCardStateError) _then) = _$SummaryCardStateErrorCopyWithImpl;
@useResult
$Res call({
 ErrorHandler errorHandler
});




}
/// @nodoc
class _$SummaryCardStateErrorCopyWithImpl<$Res>
    implements $SummaryCardStateErrorCopyWith<$Res> {
  _$SummaryCardStateErrorCopyWithImpl(this._self, this._then);

  final SummaryCardStateError _self;
  final $Res Function(SummaryCardStateError) _then;

/// Create a copy of SummaryCardState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorHandler = null,}) {
  return _then(SummaryCardStateError(
null == errorHandler ? _self.errorHandler : errorHandler // ignore: cast_nullable_to_non_nullable
as ErrorHandler,
  ));
}


}

// dart format on

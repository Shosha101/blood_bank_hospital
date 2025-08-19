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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( PastRequestsStateLoading value)?  loading,TResult Function( PastRequestsStateSuccess value)?  success,TResult Function( PastRequestsStateError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case PastRequestsStateLoading() when loading != null:
return loading(_that);case PastRequestsStateSuccess() when success != null:
return success(_that);case PastRequestsStateError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( PastRequestsStateLoading value)  loading,required TResult Function( PastRequestsStateSuccess value)  success,required TResult Function( PastRequestsStateError value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case PastRequestsStateLoading():
return loading(_that);case PastRequestsStateSuccess():
return success(_that);case PastRequestsStateError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( PastRequestsStateLoading value)?  loading,TResult? Function( PastRequestsStateSuccess value)?  success,TResult? Function( PastRequestsStateError value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case PastRequestsStateLoading() when loading != null:
return loading(_that);case PastRequestsStateSuccess() when success != null:
return success(_that);case PastRequestsStateError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<PastsRequestsModel> pastRequests)?  success,TResult Function( ErrorHandler errorHandler)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case PastRequestsStateLoading() when loading != null:
return loading();case PastRequestsStateSuccess() when success != null:
return success(_that.pastRequests);case PastRequestsStateError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<PastsRequestsModel> pastRequests)  success,required TResult Function( ErrorHandler errorHandler)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case PastRequestsStateLoading():
return loading();case PastRequestsStateSuccess():
return success(_that.pastRequests);case PastRequestsStateError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<PastsRequestsModel> pastRequests)?  success,TResult? Function( ErrorHandler errorHandler)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case PastRequestsStateLoading() when loading != null:
return loading();case PastRequestsStateSuccess() when success != null:
return success(_that.pastRequests);case PastRequestsStateError() when error != null:
return error(_that.errorHandler);case _:
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
  return 'PastRequestsState.loading()';
}


}




/// @nodoc


class PastRequestsStateSuccess implements PastRequestsState {
  const PastRequestsStateSuccess(final  List<PastsRequestsModel> pastRequests): _pastRequests = pastRequests;
  

 final  List<PastsRequestsModel> _pastRequests;
 List<PastsRequestsModel> get pastRequests {
  if (_pastRequests is EqualUnmodifiableListView) return _pastRequests;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_pastRequests);
}


/// Create a copy of PastRequestsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PastRequestsStateSuccessCopyWith<PastRequestsStateSuccess> get copyWith => _$PastRequestsStateSuccessCopyWithImpl<PastRequestsStateSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PastRequestsStateSuccess&&const DeepCollectionEquality().equals(other._pastRequests, _pastRequests));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_pastRequests));

@override
String toString() {
  return 'PastRequestsState.success(pastRequests: $pastRequests)';
}


}

/// @nodoc
abstract mixin class $PastRequestsStateSuccessCopyWith<$Res> implements $PastRequestsStateCopyWith<$Res> {
  factory $PastRequestsStateSuccessCopyWith(PastRequestsStateSuccess value, $Res Function(PastRequestsStateSuccess) _then) = _$PastRequestsStateSuccessCopyWithImpl;
@useResult
$Res call({
 List<PastsRequestsModel> pastRequests
});




}
/// @nodoc
class _$PastRequestsStateSuccessCopyWithImpl<$Res>
    implements $PastRequestsStateSuccessCopyWith<$Res> {
  _$PastRequestsStateSuccessCopyWithImpl(this._self, this._then);

  final PastRequestsStateSuccess _self;
  final $Res Function(PastRequestsStateSuccess) _then;

/// Create a copy of PastRequestsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? pastRequests = null,}) {
  return _then(PastRequestsStateSuccess(
null == pastRequests ? _self._pastRequests : pastRequests // ignore: cast_nullable_to_non_nullable
as List<PastsRequestsModel>,
  ));
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
  return 'PastRequestsState.error(errorHandler: $errorHandler)';
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

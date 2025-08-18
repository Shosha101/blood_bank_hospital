// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'active_requests_table_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ActiveRequestsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActiveRequestsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ActiveRequestsState()';
}


}

/// @nodoc
class $ActiveRequestsStateCopyWith<$Res>  {
$ActiveRequestsStateCopyWith(ActiveRequestsState _, $Res Function(ActiveRequestsState) __);
}


/// Adds pattern-matching-related methods to [ActiveRequestsState].
extension ActiveRequestsStatePatterns on ActiveRequestsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( ActiveRequestsStateLoading value)?  loading,TResult Function( ActiveRequestsStateSuccess value)?  success,TResult Function( ActiveRequestsStateError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case ActiveRequestsStateLoading() when loading != null:
return loading(_that);case ActiveRequestsStateSuccess() when success != null:
return success(_that);case ActiveRequestsStateError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( ActiveRequestsStateLoading value)  loading,required TResult Function( ActiveRequestsStateSuccess value)  success,required TResult Function( ActiveRequestsStateError value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case ActiveRequestsStateLoading():
return loading(_that);case ActiveRequestsStateSuccess():
return success(_that);case ActiveRequestsStateError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( ActiveRequestsStateLoading value)?  loading,TResult? Function( ActiveRequestsStateSuccess value)?  success,TResult? Function( ActiveRequestsStateError value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case ActiveRequestsStateLoading() when loading != null:
return loading(_that);case ActiveRequestsStateSuccess() when success != null:
return success(_that);case ActiveRequestsStateError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<ActiveRequestsModel> requests)?  success,TResult Function( ErrorHandler errorHandler)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case ActiveRequestsStateLoading() when loading != null:
return loading();case ActiveRequestsStateSuccess() when success != null:
return success(_that.requests);case ActiveRequestsStateError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<ActiveRequestsModel> requests)  success,required TResult Function( ErrorHandler errorHandler)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case ActiveRequestsStateLoading():
return loading();case ActiveRequestsStateSuccess():
return success(_that.requests);case ActiveRequestsStateError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<ActiveRequestsModel> requests)?  success,TResult? Function( ErrorHandler errorHandler)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case ActiveRequestsStateLoading() when loading != null:
return loading();case ActiveRequestsStateSuccess() when success != null:
return success(_that.requests);case ActiveRequestsStateError() when error != null:
return error(_that.errorHandler);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements ActiveRequestsState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ActiveRequestsState.initial()';
}


}




/// @nodoc


class ActiveRequestsStateLoading implements ActiveRequestsState {
  const ActiveRequestsStateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActiveRequestsStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ActiveRequestsState.loading()';
}


}




/// @nodoc


class ActiveRequestsStateSuccess implements ActiveRequestsState {
  const ActiveRequestsStateSuccess(final  List<ActiveRequestsModel> requests): _requests = requests;
  

 final  List<ActiveRequestsModel> _requests;
 List<ActiveRequestsModel> get requests {
  if (_requests is EqualUnmodifiableListView) return _requests;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_requests);
}


/// Create a copy of ActiveRequestsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ActiveRequestsStateSuccessCopyWith<ActiveRequestsStateSuccess> get copyWith => _$ActiveRequestsStateSuccessCopyWithImpl<ActiveRequestsStateSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActiveRequestsStateSuccess&&const DeepCollectionEquality().equals(other._requests, _requests));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_requests));

@override
String toString() {
  return 'ActiveRequestsState.success(requests: $requests)';
}


}

/// @nodoc
abstract mixin class $ActiveRequestsStateSuccessCopyWith<$Res> implements $ActiveRequestsStateCopyWith<$Res> {
  factory $ActiveRequestsStateSuccessCopyWith(ActiveRequestsStateSuccess value, $Res Function(ActiveRequestsStateSuccess) _then) = _$ActiveRequestsStateSuccessCopyWithImpl;
@useResult
$Res call({
 List<ActiveRequestsModel> requests
});




}
/// @nodoc
class _$ActiveRequestsStateSuccessCopyWithImpl<$Res>
    implements $ActiveRequestsStateSuccessCopyWith<$Res> {
  _$ActiveRequestsStateSuccessCopyWithImpl(this._self, this._then);

  final ActiveRequestsStateSuccess _self;
  final $Res Function(ActiveRequestsStateSuccess) _then;

/// Create a copy of ActiveRequestsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? requests = null,}) {
  return _then(ActiveRequestsStateSuccess(
null == requests ? _self._requests : requests // ignore: cast_nullable_to_non_nullable
as List<ActiveRequestsModel>,
  ));
}


}

/// @nodoc


class ActiveRequestsStateError implements ActiveRequestsState {
  const ActiveRequestsStateError(this.errorHandler);
  

 final  ErrorHandler errorHandler;

/// Create a copy of ActiveRequestsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ActiveRequestsStateErrorCopyWith<ActiveRequestsStateError> get copyWith => _$ActiveRequestsStateErrorCopyWithImpl<ActiveRequestsStateError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActiveRequestsStateError&&(identical(other.errorHandler, errorHandler) || other.errorHandler == errorHandler));
}


@override
int get hashCode => Object.hash(runtimeType,errorHandler);

@override
String toString() {
  return 'ActiveRequestsState.error(errorHandler: $errorHandler)';
}


}

/// @nodoc
abstract mixin class $ActiveRequestsStateErrorCopyWith<$Res> implements $ActiveRequestsStateCopyWith<$Res> {
  factory $ActiveRequestsStateErrorCopyWith(ActiveRequestsStateError value, $Res Function(ActiveRequestsStateError) _then) = _$ActiveRequestsStateErrorCopyWithImpl;
@useResult
$Res call({
 ErrorHandler errorHandler
});




}
/// @nodoc
class _$ActiveRequestsStateErrorCopyWithImpl<$Res>
    implements $ActiveRequestsStateErrorCopyWith<$Res> {
  _$ActiveRequestsStateErrorCopyWithImpl(this._self, this._then);

  final ActiveRequestsStateError _self;
  final $Res Function(ActiveRequestsStateError) _then;

/// Create a copy of ActiveRequestsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorHandler = null,}) {
  return _then(ActiveRequestsStateError(
null == errorHandler ? _self.errorHandler : errorHandler // ignore: cast_nullable_to_non_nullable
as ErrorHandler,
  ));
}


}

// dart format on

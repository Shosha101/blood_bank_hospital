// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'blood_type_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BloodTypeState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BloodTypeState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BloodTypeState()';
}


}

/// @nodoc
class $BloodTypeStateCopyWith<$Res>  {
$BloodTypeStateCopyWith(BloodTypeState _, $Res Function(BloodTypeState) __);
}


/// Adds pattern-matching-related methods to [BloodTypeState].
extension BloodTypeStatePatterns on BloodTypeState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( BloodTypeStateLoading value)?  loading,TResult Function( BloodTypeStateSuccess value)?  success,TResult Function( BloodTypeStateError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case BloodTypeStateLoading() when loading != null:
return loading(_that);case BloodTypeStateSuccess() when success != null:
return success(_that);case BloodTypeStateError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( BloodTypeStateLoading value)  loading,required TResult Function( BloodTypeStateSuccess value)  success,required TResult Function( BloodTypeStateError value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case BloodTypeStateLoading():
return loading(_that);case BloodTypeStateSuccess():
return success(_that);case BloodTypeStateError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( BloodTypeStateLoading value)?  loading,TResult? Function( BloodTypeStateSuccess value)?  success,TResult? Function( BloodTypeStateError value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case BloodTypeStateLoading() when loading != null:
return loading(_that);case BloodTypeStateSuccess() when success != null:
return success(_that);case BloodTypeStateError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<BloodTypeModel> bloodTypes)?  success,TResult Function( ErrorHandler errorHandler)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case BloodTypeStateLoading() when loading != null:
return loading();case BloodTypeStateSuccess() when success != null:
return success(_that.bloodTypes);case BloodTypeStateError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<BloodTypeModel> bloodTypes)  success,required TResult Function( ErrorHandler errorHandler)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case BloodTypeStateLoading():
return loading();case BloodTypeStateSuccess():
return success(_that.bloodTypes);case BloodTypeStateError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<BloodTypeModel> bloodTypes)?  success,TResult? Function( ErrorHandler errorHandler)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case BloodTypeStateLoading() when loading != null:
return loading();case BloodTypeStateSuccess() when success != null:
return success(_that.bloodTypes);case BloodTypeStateError() when error != null:
return error(_that.errorHandler);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements BloodTypeState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BloodTypeState.initial()';
}


}




/// @nodoc


class BloodTypeStateLoading implements BloodTypeState {
  const BloodTypeStateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BloodTypeStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BloodTypeState.loading()';
}


}




/// @nodoc


class BloodTypeStateSuccess implements BloodTypeState {
  const BloodTypeStateSuccess(final  List<BloodTypeModel> bloodTypes): _bloodTypes = bloodTypes;
  

 final  List<BloodTypeModel> _bloodTypes;
 List<BloodTypeModel> get bloodTypes {
  if (_bloodTypes is EqualUnmodifiableListView) return _bloodTypes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_bloodTypes);
}


/// Create a copy of BloodTypeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BloodTypeStateSuccessCopyWith<BloodTypeStateSuccess> get copyWith => _$BloodTypeStateSuccessCopyWithImpl<BloodTypeStateSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BloodTypeStateSuccess&&const DeepCollectionEquality().equals(other._bloodTypes, _bloodTypes));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_bloodTypes));

@override
String toString() {
  return 'BloodTypeState.success(bloodTypes: $bloodTypes)';
}


}

/// @nodoc
abstract mixin class $BloodTypeStateSuccessCopyWith<$Res> implements $BloodTypeStateCopyWith<$Res> {
  factory $BloodTypeStateSuccessCopyWith(BloodTypeStateSuccess value, $Res Function(BloodTypeStateSuccess) _then) = _$BloodTypeStateSuccessCopyWithImpl;
@useResult
$Res call({
 List<BloodTypeModel> bloodTypes
});




}
/// @nodoc
class _$BloodTypeStateSuccessCopyWithImpl<$Res>
    implements $BloodTypeStateSuccessCopyWith<$Res> {
  _$BloodTypeStateSuccessCopyWithImpl(this._self, this._then);

  final BloodTypeStateSuccess _self;
  final $Res Function(BloodTypeStateSuccess) _then;

/// Create a copy of BloodTypeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? bloodTypes = null,}) {
  return _then(BloodTypeStateSuccess(
null == bloodTypes ? _self._bloodTypes : bloodTypes // ignore: cast_nullable_to_non_nullable
as List<BloodTypeModel>,
  ));
}


}

/// @nodoc


class BloodTypeStateError implements BloodTypeState {
  const BloodTypeStateError(this.errorHandler);
  

 final  ErrorHandler errorHandler;

/// Create a copy of BloodTypeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BloodTypeStateErrorCopyWith<BloodTypeStateError> get copyWith => _$BloodTypeStateErrorCopyWithImpl<BloodTypeStateError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BloodTypeStateError&&(identical(other.errorHandler, errorHandler) || other.errorHandler == errorHandler));
}


@override
int get hashCode => Object.hash(runtimeType,errorHandler);

@override
String toString() {
  return 'BloodTypeState.error(errorHandler: $errorHandler)';
}


}

/// @nodoc
abstract mixin class $BloodTypeStateErrorCopyWith<$Res> implements $BloodTypeStateCopyWith<$Res> {
  factory $BloodTypeStateErrorCopyWith(BloodTypeStateError value, $Res Function(BloodTypeStateError) _then) = _$BloodTypeStateErrorCopyWithImpl;
@useResult
$Res call({
 ErrorHandler errorHandler
});




}
/// @nodoc
class _$BloodTypeStateErrorCopyWithImpl<$Res>
    implements $BloodTypeStateErrorCopyWith<$Res> {
  _$BloodTypeStateErrorCopyWithImpl(this._self, this._then);

  final BloodTypeStateError _self;
  final $Res Function(BloodTypeStateError) _then;

/// Create a copy of BloodTypeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorHandler = null,}) {
  return _then(BloodTypeStateError(
null == errorHandler ? _self.errorHandler : errorHandler // ignore: cast_nullable_to_non_nullable
as ErrorHandler,
  ));
}


}

// dart format on

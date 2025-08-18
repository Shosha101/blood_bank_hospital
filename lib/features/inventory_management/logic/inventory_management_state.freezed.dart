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
mixin _$InventoryState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InventoryState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'InventoryState()';
}


}

/// @nodoc
class $InventoryStateCopyWith<$Res>  {
$InventoryStateCopyWith(InventoryState _, $Res Function(InventoryState) __);
}


/// Adds pattern-matching-related methods to [InventoryState].
extension InventoryStatePatterns on InventoryState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( InventoryStateLoading value)?  loading,TResult Function( InventoryStateSuccess value)?  success,TResult Function( InventoryStateError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case InventoryStateLoading() when loading != null:
return loading(_that);case InventoryStateSuccess() when success != null:
return success(_that);case InventoryStateError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( InventoryStateLoading value)  loading,required TResult Function( InventoryStateSuccess value)  success,required TResult Function( InventoryStateError value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case InventoryStateLoading():
return loading(_that);case InventoryStateSuccess():
return success(_that);case InventoryStateError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( InventoryStateLoading value)?  loading,TResult? Function( InventoryStateSuccess value)?  success,TResult? Function( InventoryStateError value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case InventoryStateLoading() when loading != null:
return loading(_that);case InventoryStateSuccess() when success != null:
return success(_that);case InventoryStateError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<InventoryModel> inventory)?  success,TResult Function( ErrorHandler errorHandler)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case InventoryStateLoading() when loading != null:
return loading();case InventoryStateSuccess() when success != null:
return success(_that.inventory);case InventoryStateError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<InventoryModel> inventory)  success,required TResult Function( ErrorHandler errorHandler)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case InventoryStateLoading():
return loading();case InventoryStateSuccess():
return success(_that.inventory);case InventoryStateError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<InventoryModel> inventory)?  success,TResult? Function( ErrorHandler errorHandler)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case InventoryStateLoading() when loading != null:
return loading();case InventoryStateSuccess() when success != null:
return success(_that.inventory);case InventoryStateError() when error != null:
return error(_that.errorHandler);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements InventoryState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'InventoryState.initial()';
}


}




/// @nodoc


class InventoryStateLoading implements InventoryState {
  const InventoryStateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InventoryStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'InventoryState.loading()';
}


}




/// @nodoc


class InventoryStateSuccess implements InventoryState {
  const InventoryStateSuccess(final  List<InventoryModel> inventory): _inventory = inventory;
  

 final  List<InventoryModel> _inventory;
 List<InventoryModel> get inventory {
  if (_inventory is EqualUnmodifiableListView) return _inventory;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_inventory);
}


/// Create a copy of InventoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InventoryStateSuccessCopyWith<InventoryStateSuccess> get copyWith => _$InventoryStateSuccessCopyWithImpl<InventoryStateSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InventoryStateSuccess&&const DeepCollectionEquality().equals(other._inventory, _inventory));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_inventory));

@override
String toString() {
  return 'InventoryState.success(inventory: $inventory)';
}


}

/// @nodoc
abstract mixin class $InventoryStateSuccessCopyWith<$Res> implements $InventoryStateCopyWith<$Res> {
  factory $InventoryStateSuccessCopyWith(InventoryStateSuccess value, $Res Function(InventoryStateSuccess) _then) = _$InventoryStateSuccessCopyWithImpl;
@useResult
$Res call({
 List<InventoryModel> inventory
});




}
/// @nodoc
class _$InventoryStateSuccessCopyWithImpl<$Res>
    implements $InventoryStateSuccessCopyWith<$Res> {
  _$InventoryStateSuccessCopyWithImpl(this._self, this._then);

  final InventoryStateSuccess _self;
  final $Res Function(InventoryStateSuccess) _then;

/// Create a copy of InventoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? inventory = null,}) {
  return _then(InventoryStateSuccess(
null == inventory ? _self._inventory : inventory // ignore: cast_nullable_to_non_nullable
as List<InventoryModel>,
  ));
}


}

/// @nodoc


class InventoryStateError implements InventoryState {
  const InventoryStateError(this.errorHandler);
  

 final  ErrorHandler errorHandler;

/// Create a copy of InventoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InventoryStateErrorCopyWith<InventoryStateError> get copyWith => _$InventoryStateErrorCopyWithImpl<InventoryStateError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InventoryStateError&&(identical(other.errorHandler, errorHandler) || other.errorHandler == errorHandler));
}


@override
int get hashCode => Object.hash(runtimeType,errorHandler);

@override
String toString() {
  return 'InventoryState.error(errorHandler: $errorHandler)';
}


}

/// @nodoc
abstract mixin class $InventoryStateErrorCopyWith<$Res> implements $InventoryStateCopyWith<$Res> {
  factory $InventoryStateErrorCopyWith(InventoryStateError value, $Res Function(InventoryStateError) _then) = _$InventoryStateErrorCopyWithImpl;
@useResult
$Res call({
 ErrorHandler errorHandler
});




}
/// @nodoc
class _$InventoryStateErrorCopyWithImpl<$Res>
    implements $InventoryStateErrorCopyWith<$Res> {
  _$InventoryStateErrorCopyWithImpl(this._self, this._then);

  final InventoryStateError _self;
  final $Res Function(InventoryStateError) _then;

/// Create a copy of InventoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorHandler = null,}) {
  return _then(InventoryStateError(
null == errorHandler ? _self.errorHandler : errorHandler // ignore: cast_nullable_to_non_nullable
as ErrorHandler,
  ));
}


}

// dart format on

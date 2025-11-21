// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scanned_device.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ScannedDevice {

 String get name; String get address;
/// Create a copy of ScannedDevice
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScannedDeviceCopyWith<ScannedDevice> get copyWith => _$ScannedDeviceCopyWithImpl<ScannedDevice>(this as ScannedDevice, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScannedDevice&&(identical(other.name, name) || other.name == name)&&(identical(other.address, address) || other.address == address));
}


@override
int get hashCode => Object.hash(runtimeType,name,address);

@override
String toString() {
  return 'ScannedDevice(name: $name, address: $address)';
}


}

/// @nodoc
abstract mixin class $ScannedDeviceCopyWith<$Res>  {
  factory $ScannedDeviceCopyWith(ScannedDevice value, $Res Function(ScannedDevice) _then) = _$ScannedDeviceCopyWithImpl;
@useResult
$Res call({
 String name, String address
});




}
/// @nodoc
class _$ScannedDeviceCopyWithImpl<$Res>
    implements $ScannedDeviceCopyWith<$Res> {
  _$ScannedDeviceCopyWithImpl(this._self, this._then);

  final ScannedDevice _self;
  final $Res Function(ScannedDevice) _then;

/// Create a copy of ScannedDevice
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? address = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ScannedDevice].
extension ScannedDevicePatterns on ScannedDevice {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ScannedDevice value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ScannedDevice() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ScannedDevice value)  $default,){
final _that = this;
switch (_that) {
case _ScannedDevice():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ScannedDevice value)?  $default,){
final _that = this;
switch (_that) {
case _ScannedDevice() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String address)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ScannedDevice() when $default != null:
return $default(_that.name,_that.address);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String address)  $default,) {final _that = this;
switch (_that) {
case _ScannedDevice():
return $default(_that.name,_that.address);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String address)?  $default,) {final _that = this;
switch (_that) {
case _ScannedDevice() when $default != null:
return $default(_that.name,_that.address);case _:
  return null;

}
}

}

/// @nodoc


class _ScannedDevice implements ScannedDevice {
  const _ScannedDevice({required this.name, required this.address});
  

@override final  String name;
@override final  String address;

/// Create a copy of ScannedDevice
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScannedDeviceCopyWith<_ScannedDevice> get copyWith => __$ScannedDeviceCopyWithImpl<_ScannedDevice>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ScannedDevice&&(identical(other.name, name) || other.name == name)&&(identical(other.address, address) || other.address == address));
}


@override
int get hashCode => Object.hash(runtimeType,name,address);

@override
String toString() {
  return 'ScannedDevice(name: $name, address: $address)';
}


}

/// @nodoc
abstract mixin class _$ScannedDeviceCopyWith<$Res> implements $ScannedDeviceCopyWith<$Res> {
  factory _$ScannedDeviceCopyWith(_ScannedDevice value, $Res Function(_ScannedDevice) _then) = __$ScannedDeviceCopyWithImpl;
@override @useResult
$Res call({
 String name, String address
});




}
/// @nodoc
class __$ScannedDeviceCopyWithImpl<$Res>
    implements _$ScannedDeviceCopyWith<$Res> {
  __$ScannedDeviceCopyWithImpl(this._self, this._then);

  final _ScannedDevice _self;
  final $Res Function(_ScannedDevice) _then;

/// Create a copy of ScannedDevice
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? address = null,}) {
  return _then(_ScannedDevice(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

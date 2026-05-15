// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MovieResponse {

 List<Movie> get results;
/// Create a copy of MovieResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MovieResponseCopyWith<MovieResponse> get copyWith => _$MovieResponseCopyWithImpl<MovieResponse>(this as MovieResponse, _$identity);

  /// Serializes this MovieResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MovieResponse&&const DeepCollectionEquality().equals(other.results, results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(results));

@override
String toString() {
  return 'MovieResponse(results: $results)';
}


}

/// @nodoc
abstract mixin class $MovieResponseCopyWith<$Res>  {
  factory $MovieResponseCopyWith(MovieResponse value, $Res Function(MovieResponse) _then) = _$MovieResponseCopyWithImpl;
@useResult
$Res call({
 List<Movie> results
});




}
/// @nodoc
class _$MovieResponseCopyWithImpl<$Res>
    implements $MovieResponseCopyWith<$Res> {
  _$MovieResponseCopyWithImpl(this._self, this._then);

  final MovieResponse _self;
  final $Res Function(MovieResponse) _then;

/// Create a copy of MovieResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? results = null,}) {
  return _then(_self.copyWith(
results: null == results ? _self.results : results // ignore: cast_nullable_to_non_nullable
as List<Movie>,
  ));
}

}


/// Adds pattern-matching-related methods to [MovieResponse].
extension MovieResponsePatterns on MovieResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MovieResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MovieResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MovieResponse value)  $default,){
final _that = this;
switch (_that) {
case _MovieResponse():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MovieResponse value)?  $default,){
final _that = this;
switch (_that) {
case _MovieResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Movie> results)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MovieResponse() when $default != null:
return $default(_that.results);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Movie> results)  $default,) {final _that = this;
switch (_that) {
case _MovieResponse():
return $default(_that.results);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Movie> results)?  $default,) {final _that = this;
switch (_that) {
case _MovieResponse() when $default != null:
return $default(_that.results);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MovieResponse implements MovieResponse {
  const _MovieResponse({required final  List<Movie> results}): _results = results;
  factory _MovieResponse.fromJson(Map<String, dynamic> json) => _$MovieResponseFromJson(json);

 final  List<Movie> _results;
@override List<Movie> get results {
  if (_results is EqualUnmodifiableListView) return _results;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_results);
}


/// Create a copy of MovieResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MovieResponseCopyWith<_MovieResponse> get copyWith => __$MovieResponseCopyWithImpl<_MovieResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MovieResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MovieResponse&&const DeepCollectionEquality().equals(other._results, _results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_results));

@override
String toString() {
  return 'MovieResponse(results: $results)';
}


}

/// @nodoc
abstract mixin class _$MovieResponseCopyWith<$Res> implements $MovieResponseCopyWith<$Res> {
  factory _$MovieResponseCopyWith(_MovieResponse value, $Res Function(_MovieResponse) _then) = __$MovieResponseCopyWithImpl;
@override @useResult
$Res call({
 List<Movie> results
});




}
/// @nodoc
class __$MovieResponseCopyWithImpl<$Res>
    implements _$MovieResponseCopyWith<$Res> {
  __$MovieResponseCopyWithImpl(this._self, this._then);

  final _MovieResponse _self;
  final $Res Function(_MovieResponse) _then;

/// Create a copy of MovieResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? results = null,}) {
  return _then(_MovieResponse(
results: null == results ? _self._results : results // ignore: cast_nullable_to_non_nullable
as List<Movie>,
  ));
}


}

// dart format on

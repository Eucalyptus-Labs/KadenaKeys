// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'example_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ExampleListResponse _$ExampleListResponseFromJson(Map<String, dynamic> json) {
  return _ExampleListResponse.fromJson(json);
}

/// @nodoc
mixin _$ExampleListResponse {
  List<ExampleModel> get example => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExampleListResponseCopyWith<ExampleListResponse> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExampleListResponseCopyWith<$Res> {
  factory $ExampleListResponseCopyWith(ExampleListResponse value, $Res Function(ExampleListResponse) then) =
      _$ExampleListResponseCopyWithImpl<$Res, ExampleListResponse>;
  @useResult
  $Res call({List<ExampleModel> example});
}

/// @nodoc
class _$ExampleListResponseCopyWithImpl<$Res, $Val extends ExampleListResponse>
    implements $ExampleListResponseCopyWith<$Res> {
  _$ExampleListResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? example = null,
  }) {
    return _then(_value.copyWith(
      example: null == example
          ? _value.example
          : example // ignore: cast_nullable_to_non_nullable
              as List<ExampleModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ExampleListResponseCopyWith<$Res> implements $ExampleListResponseCopyWith<$Res> {
  factory _$$_ExampleListResponseCopyWith(_$_ExampleListResponse value, $Res Function(_$_ExampleListResponse) then) =
      __$$_ExampleListResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ExampleModel> example});
}

/// @nodoc
class __$$_ExampleListResponseCopyWithImpl<$Res> extends _$ExampleListResponseCopyWithImpl<$Res, _$_ExampleListResponse>
    implements _$$_ExampleListResponseCopyWith<$Res> {
  __$$_ExampleListResponseCopyWithImpl(_$_ExampleListResponse _value, $Res Function(_$_ExampleListResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? example = null,
  }) {
    return _then(_$_ExampleListResponse(
      example: null == example
          ? _value._example
          : example // ignore: cast_nullable_to_non_nullable
              as List<ExampleModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ExampleListResponse implements _ExampleListResponse {
  _$_ExampleListResponse({required final List<ExampleModel> example}) : _example = example;

  factory _$_ExampleListResponse.fromJson(Map<String, dynamic> json) => _$$_ExampleListResponseFromJson(json);

  final List<ExampleModel> _example;
  @override
  List<ExampleModel> get example {
    if (_example is EqualUnmodifiableListView) return _example;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_example);
  }

  @override
  String toString() {
    return 'ExampleListResponse(example: $example)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ExampleListResponse &&
            const DeepCollectionEquality().equals(other._example, _example));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, const DeepCollectionEquality().hash(_example));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ExampleListResponseCopyWith<_$_ExampleListResponse> get copyWith =>
      __$$_ExampleListResponseCopyWithImpl<_$_ExampleListResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ExampleListResponseToJson(
      this,
    );
  }
}

abstract class _ExampleListResponse implements ExampleListResponse {
  factory _ExampleListResponse({required final List<ExampleModel> example}) = _$_ExampleListResponse;

  factory _ExampleListResponse.fromJson(Map<String, dynamic> json) = _$_ExampleListResponse.fromJson;

  @override
  List<ExampleModel> get example;
  @override
  @JsonKey(ignore: true)
  _$$_ExampleListResponseCopyWith<_$_ExampleListResponse> get copyWith => throw _privateConstructorUsedError;
}

ExampleModel _$ExampleModelFromJson(Map<String, dynamic> json) {
  return _ExampleModel.fromJson(json);
}

/// @nodoc
mixin _$ExampleModel {
  String get x => throw _privateConstructorUsedError;
  String get y => throw _privateConstructorUsedError;
  String? get link => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExampleModelCopyWith<ExampleModel> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExampleModelCopyWith<$Res> {
  factory $ExampleModelCopyWith(ExampleModel value, $Res Function(ExampleModel) then) =
      _$ExampleModelCopyWithImpl<$Res, ExampleModel>;
  @useResult
  $Res call({String x, String y, String? link});
}

/// @nodoc
class _$ExampleModelCopyWithImpl<$Res, $Val extends ExampleModel> implements $ExampleModelCopyWith<$Res> {
  _$ExampleModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? x = null,
    Object? y = null,
    Object? link = freezed,
  }) {
    return _then(_value.copyWith(
      x: null == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as String,
      y: null == y
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as String,
      link: freezed == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ExampleModelCopyWith<$Res> implements $ExampleModelCopyWith<$Res> {
  factory _$$_ExampleModelCopyWith(_$_ExampleModel value, $Res Function(_$_ExampleModel) then) =
      __$$_ExampleModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String x, String y, String? link});
}

/// @nodoc
class __$$_ExampleModelCopyWithImpl<$Res> extends _$ExampleModelCopyWithImpl<$Res, _$_ExampleModel>
    implements _$$_ExampleModelCopyWith<$Res> {
  __$$_ExampleModelCopyWithImpl(_$_ExampleModel _value, $Res Function(_$_ExampleModel) _then) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? x = null,
    Object? y = null,
    Object? link = freezed,
  }) {
    return _then(_$_ExampleModel(
      x: null == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as String,
      y: null == y
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as String,
      link: freezed == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ExampleModel implements _ExampleModel {
  _$_ExampleModel({required this.x, required this.y, this.link});

  factory _$_ExampleModel.fromJson(Map<String, dynamic> json) => _$$_ExampleModelFromJson(json);

  @override
  final String x;
  @override
  final String y;
  @override
  final String? link;

  @override
  String toString() {
    return 'ExampleModel(x: $x, y: $y, link: $link)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ExampleModel &&
            (identical(other.x, x) || other.x == x) &&
            (identical(other.y, y) || other.y == y) &&
            (identical(other.link, link) || other.link == link));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, x, y, link);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ExampleModelCopyWith<_$_ExampleModel> get copyWith =>
      __$$_ExampleModelCopyWithImpl<_$_ExampleModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ExampleModelToJson(
      this,
    );
  }
}

abstract class _ExampleModel implements ExampleModel {
  factory _ExampleModel({required final String x, required final String y, final String? link}) = _$_ExampleModel;

  factory _ExampleModel.fromJson(Map<String, dynamic> json) = _$_ExampleModel.fromJson;

  @override
  String get x;
  @override
  String get y;
  @override
  String? get link;
  @override
  @JsonKey(ignore: true)
  _$$_ExampleModelCopyWith<_$_ExampleModel> get copyWith => throw _privateConstructorUsedError;
}

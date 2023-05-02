// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wallets.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$WalletData {
  KadenaWallet get wallet => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get derivationMethod => throw _privateConstructorUsedError;
  String get derivationPath => throw _privateConstructorUsedError;
  IKeyDeriver get deriver => throw _privateConstructorUsedError;
  Widget? get infoWidget => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WalletDataCopyWith<WalletData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletDataCopyWith<$Res> {
  factory $WalletDataCopyWith(
          WalletData value, $Res Function(WalletData) then) =
      _$WalletDataCopyWithImpl<$Res, WalletData>;
  @useResult
  $Res call(
      {KadenaWallet wallet,
      String name,
      String derivationMethod,
      String derivationPath,
      IKeyDeriver deriver,
      Widget? infoWidget});
}

/// @nodoc
class _$WalletDataCopyWithImpl<$Res, $Val extends WalletData>
    implements $WalletDataCopyWith<$Res> {
  _$WalletDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wallet = null,
    Object? name = null,
    Object? derivationMethod = null,
    Object? derivationPath = null,
    Object? deriver = null,
    Object? infoWidget = freezed,
  }) {
    return _then(_value.copyWith(
      wallet: null == wallet
          ? _value.wallet
          : wallet // ignore: cast_nullable_to_non_nullable
              as KadenaWallet,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      derivationMethod: null == derivationMethod
          ? _value.derivationMethod
          : derivationMethod // ignore: cast_nullable_to_non_nullable
              as String,
      derivationPath: null == derivationPath
          ? _value.derivationPath
          : derivationPath // ignore: cast_nullable_to_non_nullable
              as String,
      deriver: null == deriver
          ? _value.deriver
          : deriver // ignore: cast_nullable_to_non_nullable
              as IKeyDeriver,
      infoWidget: freezed == infoWidget
          ? _value.infoWidget
          : infoWidget // ignore: cast_nullable_to_non_nullable
              as Widget?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WalletDataCopyWith<$Res>
    implements $WalletDataCopyWith<$Res> {
  factory _$$_WalletDataCopyWith(
          _$_WalletData value, $Res Function(_$_WalletData) then) =
      __$$_WalletDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {KadenaWallet wallet,
      String name,
      String derivationMethod,
      String derivationPath,
      IKeyDeriver deriver,
      Widget? infoWidget});
}

/// @nodoc
class __$$_WalletDataCopyWithImpl<$Res>
    extends _$WalletDataCopyWithImpl<$Res, _$_WalletData>
    implements _$$_WalletDataCopyWith<$Res> {
  __$$_WalletDataCopyWithImpl(
      _$_WalletData _value, $Res Function(_$_WalletData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wallet = null,
    Object? name = null,
    Object? derivationMethod = null,
    Object? derivationPath = null,
    Object? deriver = null,
    Object? infoWidget = freezed,
  }) {
    return _then(_$_WalletData(
      wallet: null == wallet
          ? _value.wallet
          : wallet // ignore: cast_nullable_to_non_nullable
              as KadenaWallet,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      derivationMethod: null == derivationMethod
          ? _value.derivationMethod
          : derivationMethod // ignore: cast_nullable_to_non_nullable
              as String,
      derivationPath: null == derivationPath
          ? _value.derivationPath
          : derivationPath // ignore: cast_nullable_to_non_nullable
              as String,
      deriver: null == deriver
          ? _value.deriver
          : deriver // ignore: cast_nullable_to_non_nullable
              as IKeyDeriver,
      infoWidget: freezed == infoWidget
          ? _value.infoWidget
          : infoWidget // ignore: cast_nullable_to_non_nullable
              as Widget?,
    ));
  }
}

/// @nodoc

class _$_WalletData implements _WalletData {
  _$_WalletData(
      {required this.wallet,
      required this.name,
      required this.derivationMethod,
      required this.derivationPath,
      required this.deriver,
      this.infoWidget});

  @override
  final KadenaWallet wallet;
  @override
  final String name;
  @override
  final String derivationMethod;
  @override
  final String derivationPath;
  @override
  final IKeyDeriver deriver;
  @override
  final Widget? infoWidget;

  @override
  String toString() {
    return 'WalletData(wallet: $wallet, name: $name, derivationMethod: $derivationMethod, derivationPath: $derivationPath, deriver: $deriver, infoWidget: $infoWidget)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WalletData &&
            (identical(other.wallet, wallet) || other.wallet == wallet) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.derivationMethod, derivationMethod) ||
                other.derivationMethod == derivationMethod) &&
            (identical(other.derivationPath, derivationPath) ||
                other.derivationPath == derivationPath) &&
            (identical(other.deriver, deriver) || other.deriver == deriver) &&
            (identical(other.infoWidget, infoWidget) ||
                other.infoWidget == infoWidget));
  }

  @override
  int get hashCode => Object.hash(runtimeType, wallet, name, derivationMethod,
      derivationPath, deriver, infoWidget);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WalletDataCopyWith<_$_WalletData> get copyWith =>
      __$$_WalletDataCopyWithImpl<_$_WalletData>(this, _$identity);
}

abstract class _WalletData implements WalletData {
  factory _WalletData(
      {required final KadenaWallet wallet,
      required final String name,
      required final String derivationMethod,
      required final String derivationPath,
      required final IKeyDeriver deriver,
      final Widget? infoWidget}) = _$_WalletData;

  @override
  KadenaWallet get wallet;
  @override
  String get name;
  @override
  String get derivationMethod;
  @override
  String get derivationPath;
  @override
  IKeyDeriver get deriver;
  @override
  Widget? get infoWidget;
  @override
  @JsonKey(ignore: true)
  _$$_WalletDataCopyWith<_$_WalletData> get copyWith =>
      throw _privateConstructorUsedError;
}

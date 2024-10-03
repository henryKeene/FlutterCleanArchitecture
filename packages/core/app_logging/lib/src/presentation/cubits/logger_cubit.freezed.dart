// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'logger_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LoggerState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() failure,
    required TResult Function() loading,
    required TResult Function(List<LogEvent> logs, bool isFiltered) logsExist,
    required TResult Function() noLogsExist,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? failure,
    TResult? Function()? loading,
    TResult? Function(List<LogEvent> logs, bool isFiltered)? logsExist,
    TResult? Function()? noLogsExist,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? failure,
    TResult Function()? loading,
    TResult Function(List<LogEvent> logs, bool isFiltered)? logsExist,
    TResult Function()? noLogsExist,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Failure value) failure,
    required TResult Function(_Loading value) loading,
    required TResult Function(_LogsExist value) logsExist,
    required TResult Function(_NoLogsExist value) noLogsExist,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Failure value)? failure,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_LogsExist value)? logsExist,
    TResult? Function(_NoLogsExist value)? noLogsExist,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Failure value)? failure,
    TResult Function(_Loading value)? loading,
    TResult Function(_LogsExist value)? logsExist,
    TResult Function(_NoLogsExist value)? noLogsExist,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoggerStateCopyWith<$Res> {
  factory $LoggerStateCopyWith(
          LoggerState value, $Res Function(LoggerState) then) =
      _$LoggerStateCopyWithImpl<$Res, LoggerState>;
}

/// @nodoc
class _$LoggerStateCopyWithImpl<$Res, $Val extends LoggerState>
    implements $LoggerStateCopyWith<$Res> {
  _$LoggerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoggerState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$FailureImplCopyWith<$Res> {
  factory _$$FailureImplCopyWith(
          _$FailureImpl value, $Res Function(_$FailureImpl) then) =
      __$$FailureImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FailureImplCopyWithImpl<$Res>
    extends _$LoggerStateCopyWithImpl<$Res, _$FailureImpl>
    implements _$$FailureImplCopyWith<$Res> {
  __$$FailureImplCopyWithImpl(
      _$FailureImpl _value, $Res Function(_$FailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoggerState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FailureImpl implements _Failure {
  const _$FailureImpl();

  @override
  String toString() {
    return 'LoggerState.failure()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FailureImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() failure,
    required TResult Function() loading,
    required TResult Function(List<LogEvent> logs, bool isFiltered) logsExist,
    required TResult Function() noLogsExist,
  }) {
    return failure();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? failure,
    TResult? Function()? loading,
    TResult? Function(List<LogEvent> logs, bool isFiltered)? logsExist,
    TResult? Function()? noLogsExist,
  }) {
    return failure?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? failure,
    TResult Function()? loading,
    TResult Function(List<LogEvent> logs, bool isFiltered)? logsExist,
    TResult Function()? noLogsExist,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Failure value) failure,
    required TResult Function(_Loading value) loading,
    required TResult Function(_LogsExist value) logsExist,
    required TResult Function(_NoLogsExist value) noLogsExist,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Failure value)? failure,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_LogsExist value)? logsExist,
    TResult? Function(_NoLogsExist value)? noLogsExist,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Failure value)? failure,
    TResult Function(_Loading value)? loading,
    TResult Function(_LogsExist value)? logsExist,
    TResult Function(_NoLogsExist value)? noLogsExist,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _Failure implements LoggerState {
  const factory _Failure() = _$FailureImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$LoggerStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoggerState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'LoggerState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() failure,
    required TResult Function() loading,
    required TResult Function(List<LogEvent> logs, bool isFiltered) logsExist,
    required TResult Function() noLogsExist,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? failure,
    TResult? Function()? loading,
    TResult? Function(List<LogEvent> logs, bool isFiltered)? logsExist,
    TResult? Function()? noLogsExist,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? failure,
    TResult Function()? loading,
    TResult Function(List<LogEvent> logs, bool isFiltered)? logsExist,
    TResult Function()? noLogsExist,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Failure value) failure,
    required TResult Function(_Loading value) loading,
    required TResult Function(_LogsExist value) logsExist,
    required TResult Function(_NoLogsExist value) noLogsExist,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Failure value)? failure,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_LogsExist value)? logsExist,
    TResult? Function(_NoLogsExist value)? noLogsExist,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Failure value)? failure,
    TResult Function(_Loading value)? loading,
    TResult Function(_LogsExist value)? logsExist,
    TResult Function(_NoLogsExist value)? noLogsExist,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements LoggerState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$LogsExistImplCopyWith<$Res> {
  factory _$$LogsExistImplCopyWith(
          _$LogsExistImpl value, $Res Function(_$LogsExistImpl) then) =
      __$$LogsExistImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<LogEvent> logs, bool isFiltered});
}

/// @nodoc
class __$$LogsExistImplCopyWithImpl<$Res>
    extends _$LoggerStateCopyWithImpl<$Res, _$LogsExistImpl>
    implements _$$LogsExistImplCopyWith<$Res> {
  __$$LogsExistImplCopyWithImpl(
      _$LogsExistImpl _value, $Res Function(_$LogsExistImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoggerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? logs = null,
    Object? isFiltered = null,
  }) {
    return _then(_$LogsExistImpl(
      null == logs
          ? _value._logs
          : logs // ignore: cast_nullable_to_non_nullable
              as List<LogEvent>,
      isFiltered: null == isFiltered
          ? _value.isFiltered
          : isFiltered // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$LogsExistImpl implements _LogsExist {
  const _$LogsExistImpl(final List<LogEvent> logs, {required this.isFiltered})
      : _logs = logs;

  final List<LogEvent> _logs;
  @override
  List<LogEvent> get logs {
    if (_logs is EqualUnmodifiableListView) return _logs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_logs);
  }

  @override
  final bool isFiltered;

  @override
  String toString() {
    return 'LoggerState.logsExist(logs: $logs, isFiltered: $isFiltered)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LogsExistImpl &&
            const DeepCollectionEquality().equals(other._logs, _logs) &&
            (identical(other.isFiltered, isFiltered) ||
                other.isFiltered == isFiltered));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_logs), isFiltered);

  /// Create a copy of LoggerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LogsExistImplCopyWith<_$LogsExistImpl> get copyWith =>
      __$$LogsExistImplCopyWithImpl<_$LogsExistImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() failure,
    required TResult Function() loading,
    required TResult Function(List<LogEvent> logs, bool isFiltered) logsExist,
    required TResult Function() noLogsExist,
  }) {
    return logsExist(logs, isFiltered);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? failure,
    TResult? Function()? loading,
    TResult? Function(List<LogEvent> logs, bool isFiltered)? logsExist,
    TResult? Function()? noLogsExist,
  }) {
    return logsExist?.call(logs, isFiltered);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? failure,
    TResult Function()? loading,
    TResult Function(List<LogEvent> logs, bool isFiltered)? logsExist,
    TResult Function()? noLogsExist,
    required TResult orElse(),
  }) {
    if (logsExist != null) {
      return logsExist(logs, isFiltered);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Failure value) failure,
    required TResult Function(_Loading value) loading,
    required TResult Function(_LogsExist value) logsExist,
    required TResult Function(_NoLogsExist value) noLogsExist,
  }) {
    return logsExist(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Failure value)? failure,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_LogsExist value)? logsExist,
    TResult? Function(_NoLogsExist value)? noLogsExist,
  }) {
    return logsExist?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Failure value)? failure,
    TResult Function(_Loading value)? loading,
    TResult Function(_LogsExist value)? logsExist,
    TResult Function(_NoLogsExist value)? noLogsExist,
    required TResult orElse(),
  }) {
    if (logsExist != null) {
      return logsExist(this);
    }
    return orElse();
  }
}

abstract class _LogsExist implements LoggerState {
  const factory _LogsExist(final List<LogEvent> logs,
      {required final bool isFiltered}) = _$LogsExistImpl;

  List<LogEvent> get logs;
  bool get isFiltered;

  /// Create a copy of LoggerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LogsExistImplCopyWith<_$LogsExistImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NoLogsExistImplCopyWith<$Res> {
  factory _$$NoLogsExistImplCopyWith(
          _$NoLogsExistImpl value, $Res Function(_$NoLogsExistImpl) then) =
      __$$NoLogsExistImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NoLogsExistImplCopyWithImpl<$Res>
    extends _$LoggerStateCopyWithImpl<$Res, _$NoLogsExistImpl>
    implements _$$NoLogsExistImplCopyWith<$Res> {
  __$$NoLogsExistImplCopyWithImpl(
      _$NoLogsExistImpl _value, $Res Function(_$NoLogsExistImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoggerState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$NoLogsExistImpl implements _NoLogsExist {
  const _$NoLogsExistImpl();

  @override
  String toString() {
    return 'LoggerState.noLogsExist()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NoLogsExistImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() failure,
    required TResult Function() loading,
    required TResult Function(List<LogEvent> logs, bool isFiltered) logsExist,
    required TResult Function() noLogsExist,
  }) {
    return noLogsExist();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? failure,
    TResult? Function()? loading,
    TResult? Function(List<LogEvent> logs, bool isFiltered)? logsExist,
    TResult? Function()? noLogsExist,
  }) {
    return noLogsExist?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? failure,
    TResult Function()? loading,
    TResult Function(List<LogEvent> logs, bool isFiltered)? logsExist,
    TResult Function()? noLogsExist,
    required TResult orElse(),
  }) {
    if (noLogsExist != null) {
      return noLogsExist();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Failure value) failure,
    required TResult Function(_Loading value) loading,
    required TResult Function(_LogsExist value) logsExist,
    required TResult Function(_NoLogsExist value) noLogsExist,
  }) {
    return noLogsExist(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Failure value)? failure,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_LogsExist value)? logsExist,
    TResult? Function(_NoLogsExist value)? noLogsExist,
  }) {
    return noLogsExist?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Failure value)? failure,
    TResult Function(_Loading value)? loading,
    TResult Function(_LogsExist value)? logsExist,
    TResult Function(_NoLogsExist value)? noLogsExist,
    required TResult orElse(),
  }) {
    if (noLogsExist != null) {
      return noLogsExist(this);
    }
    return orElse();
  }
}

abstract class _NoLogsExist implements LoggerState {
  const factory _NoLogsExist() = _$NoLogsExistImpl;
}

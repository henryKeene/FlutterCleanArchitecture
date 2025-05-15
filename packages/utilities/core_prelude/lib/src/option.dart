sealed class Option<T> {
  const Option({this.value});
  final T? value;

  /// Returns true if the value is not null
  bool get isSome => value != null;

  /// Returns true if the value is null
  bool get isNone => value == null;

  /// Applies a function to the value if it is not null
  Option<R> map<R>(R Function(T) f) =>
      isSome ? Some(f(value as T)) : const None();

  /// Applies a function to the value if it is not null,
  /// otherwise runs a function and returns the result of ifNone
  R fold<R>(R Function(T) ifSome, R Function() ifNone) =>
      isSome ? ifSome(value as T) : ifNone();

  Option<R> flatMap<R>(Option<R> Function(T) f) =>
      isSome ? f(value as T) : const None();

  R getOrElse<R>(R Function() ifNone) => isSome ? value as R : ifNone();
}

class Some<T> extends Option<T> {
  const Some(this.value) : super(value: value);

  @override
  final T value;
}

class None<T> extends Option<T> {
  const None() : super();
}

Option<T> none<T>() => const None();
Option<T> some<T>(T value) => Some(value);

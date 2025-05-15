import 'package:core_prelude/core_prelude.dart';
import 'package:test/test.dart';

class TestResult {
  Result<int, String> divide(int a, int b) {
    if (b == 0) {
      return failure('Cannot divide by zero');
    }
    return success(a ~/ b);
  }

  int divide2(int a, int b) {
    try {
      return a ~/ b;
    } catch (e) {
      return 0;
    }
  }

  Option<int> divide3(int a, int b) {
    if (b == 0) {
      return none();
    }
    return some(a ~/ b);
  }

  int? divide4(int a, int b) {
    if (b == 0) {
      return null;
    }
    return a ~/ b;
  }
}

void main() {
  test('Result', () {
    final testResult = TestResult();

    final Result<int, String> successOrFailure = testResult.divide(12, 3);
    final Option<int> optionOnDivide = testResult.divide3(12, 3);

    successOrFailure.fold(
      (success) => optionOnDivide.map<Result<int, String>>(
        (result) => testResult.divide(result, success),
      ),
      (failure) => print('Failure!! error is none'),
    );
  });

  test('map vs flatMap examples', () {
    final testResult = TestResult();

    // Example 1: Using map to transform Option<int> to Option<Result<int, String>>
    final Option<int> optionValue = testResult.divide3(12, 3);
    final Option<Result<int, String>> mappedResult =
        optionValue.map((value) => testResult.divide(value, 2));
    expect(mappedResult.isSome, true);

    // Example 2: Using flatMap to chain Option operations
    final Option<int> firstDivide = testResult.divide3(12, 3);
    final Option<int> secondDivide =
        firstDivide.flatMap((value) => testResult.divide3(value, 2));
    expect(secondDivide.isSome, true);
    expect(secondDivide.getOrElse(() => 0), 2); // 12/3 = 4, then 4/2 = 2

    //showing why you cant use map in the option above
    final Option<int> firstDivideIncorrect = testResult.divide3(12, 3);
    final Option<int> secondDivideIncorrect = firstDivideIncorrect.map(
      (value) => testResult.divide3(value, 2).getOrElse(
            () =>
                0, // Becase map expects a function that returns an int then we have to unwrap the result
          ),
    );
    expect(secondDivideIncorrect.isSome, true);
    expect(
        secondDivideIncorrect.getOrElse(() => 0), 2); // 12/3 = 4, then 4/2 = 2

    // Example 3: Using map to transform Result
    final Result<int, String> resultValue2 = testResult.divide(12, 3);
    final Result<String, String> mappedResult2 =
        resultValue2.map((value) => "Result is: $value");
    expect(mappedResult2.isSuccess(), true);
    expect(mappedResult2.getOrNull(), "Result is: 4");
  });
}

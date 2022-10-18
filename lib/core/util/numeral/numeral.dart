// Project imports:
import 'parser.dart';

/// Default fraction digits value.
const int defaultFractionDigits = 1;

/// Numeral formatter
///
/// This class is used to format numbers into strings.
///
/// Example usage:
/// ```dart
/// const numeral =  Numeral(1314);
/// print(numeral.format()); // => "1.314K"
/// ```
class Numeral {
  /// Create [Numeral] class.
  ///
  /// The Factory create a [Numeral] class instance.
  ///
  /// [numeral] is num [Type].
  ///
  /// return [Numeral] instance.
  const Numeral(this.numeral);

  /// Original numeral.
  final num numeral;

  /// Format [number] to beautiful [String].
  ///
  /// E.g:
  /// ```dart
  /// Numeral(1000).value(); // -> 1K
  /// ```
  ///
  /// return a [String] type.
  String format({int fractionDigits = defaultFractionDigits}) {
    final NumeralParsedValue parsed = numeralParser(numeral);

    return _removeEndsZero(parsed.value.toStringAsFixed(fractionDigits)) +
        parsed.suffix;
  }

  /// Remove value ends with zero.
  ///
  /// Remove formated value ends with zero,
  /// replace to zero string.
  ///
  /// [value] type is [String].
  ///
  /// return a [String] type.
  String _removeEndsZero(String value) {
    if (!value.contains('.')) {
      return value;
    }

    if (value.endsWith('.')) {
      return value.substring(0, value.length - 1);
    } else if (value.endsWith('0')) {
      return _removeEndsZero(value.substring(0, value.length - 1));
    }

    return value;
  }

  /// Get formated value.
  ///
  /// Get the [value] function value.
  ///
  /// return a [String] type.
  @override
  String toString() => format();
}

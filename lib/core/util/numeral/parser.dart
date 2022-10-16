/// Numeral parsed value.
class NumeralParsedValue {
  /// String suffix.
  final String suffix;

  /// number parsed value.
  final num value;

  /// Create the [NumeralParsedValue]
  ///
  /// [value] Is the parsed value.
  /// [suffix] The last string after the connection.
  NumeralParsedValue._(this.value, this.suffix);

  /// [NumeralParsedValue] Factory.
  ///
  /// [value] Is the parsed value.
  /// [suffix] The last string after the connection.
  factory NumeralParsedValue({
    required String suffix,
    required num value,
  }) {
    return NumeralParsedValue._(value, suffix);
  }

  /// To display string.
  @override
  String toString() {
    return '$runtimeType(String suffix = "$suffix", num value = $value);';
  }
}

/// Numeral value parser.
///
/// [value] Is need parse value.
///
/// return a [NumeralParsedValue].
NumeralParsedValue numeralParser(num value) {
  final num abs = value.abs();

  // If number > 1 trillion.
  if (abs >= 1000000000000) {
    return NumeralParsedValue(value: value / 1000000000000, suffix: 'T');

    // If number > 1 billion.
  } else if (abs >= 1000000000) {
    return NumeralParsedValue(value: value / 1000000000, suffix: 'B');

    // If number > 1 million.
  } else if (abs >= 1000000) {
    return NumeralParsedValue(value: value / 1000000, suffix: 'M');

    // If number > 1 thousand.
  } else if (abs >= 1000) {
    return NumeralParsedValue(value: value / 1000, suffix: 'K');
  }

  return NumeralParsedValue(value: value, suffix: '');
}

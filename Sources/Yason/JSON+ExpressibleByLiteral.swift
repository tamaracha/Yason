// MARK: Initialize with literals
extension JSON: ExpressibleByBooleanLiteral {
  /// Initialize JSON with a boolean literal
  public init(booleanLiteral: Bool) {
    self = .bool(booleanLiteral)
  }
}

extension JSON: ExpressibleByIntegerLiteral {
  /// Initialize JSON with an integer literal
  public init(integerLiteral: Int) {
    self = .int(integerLiteral)
  }
}

extension JSON: ExpressibleByFloatLiteral {
  /// Initialize JSON with a floating point literal
  public init(floatLiteral: Double) {
    self = .number(floatLiteral)
  }
}

extension JSON: ExpressibleByStringLiteral {
  /// Initialize JSON with a string literal
  public init(stringLiteral: String) {
    self = .string(stringLiteral)
  }
}

extension JSON: ExpressibleByNilLiteral {
  /// Initialize a NULL JSON value with a nil literal
  public init(nilLiteral: ()) {
    self = .null
  }
}

extension JSON: ExpressibleByArrayLiteral {
  /// Initialize JSON with an array literal
  public init(arrayLiteral: JSON...) {
    precondition(
      arrayLiteral.allSatisfy({$0.valueType == arrayLiteral.first?.valueType}),
      "Array elements must have a common value type"
    )
    self = .array(arrayLiteral)
  }
}

extension JSON: ExpressibleByDictionaryLiteral {
  /// Initialize JSON with an object literal
  public init(dictionaryLiteral: (String, JSON)...) {
    self = .object(.init(uniqueKeysWithValues: dictionaryLiteral))
  }
}

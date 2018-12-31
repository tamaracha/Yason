import Foundation

/// A type that represents a JSON value
public enum JSON {
  /// A JSON bool
  case bool(Bool)
  /// A JSON integer number
  case int(Int)
  /// A JSON decimal number
  case number(Double)
  /// A JSON object
  case string(String)
  /// A JSON array
  case array([JSON])
  /// A JSON object
  case object([String: JSON])
  /// A JSON NULL value
  case null
  enum ValueType {
    case bool, int, float, string, array, object, null
  }
  var valueType: ValueType {
    switch self {
    case .bool: return .bool
    case .int: return .int
    case .number: return .float
    case .string: return .string
    case .array: return .array
    case .object: return .object
    case .null: return .null
    }
  }
  /// Initialize a JSON null value
  public init() {self = .null}
  /// Try to initialize by down-casting a value
  public init(value: Any?) {
    guard let value = value else {
      self = .null
      return
    }
    switch value {
    case let newValue as JSON: self = newValue
    case let newValue as Bool: self = .bool(newValue)
    case let newValue as Int: self = .int(newValue)
    case let newValue as Double: self = .number(newValue)
    case let newValue as String: self = .string(newValue)
    case let newValue as [Any]: self.init(array: newValue)
    case let newValue as [String: Any]: self.init(object: newValue)
    default: self = .null
    }
  }
  /// Initialize a JSON array with an array of Any
  public init(array: [Any]) {
    let arr = array.map {JSON(value: $0)}
    if let firstItem = arr.first {
      precondition(arr.allSatisfy({$0.valueType == firstItem.valueType}), "array elements must be of the same type")
    }
    self = .array(arr)
  }
  public init(object: [String: Any?]) {
    let dict = object.mapValues {JSON(value: $0)}
    self = .object(dict)
  }
}

extension JSON: Equatable, Hashable {}

// MARK: Encoding and decoding
extension JSON: Codable {
  /// Encode the JSON value to a given encoder
  public func encode(to encoder: Encoder) throws {
    var container = encoder.singleValueContainer()
    switch self {
    case .bool(let value):
      try container.encode(value)
    case .int(let value):
      try container.encode(value)
    case .number(let value):
      try container.encode(value)
    case .string(let value):
      try container.encode(value)
    case .null:
      try container.encodeNil()
    case .array(let value):
      try container.encode(value)
    case .object(let value):
      try container.encode(value)
    }
  }
  /// Initialize from a given decoder
  public init(from decoder: Decoder) throws {
    let container = try decoder.singleValueContainer()
    if let value = try? container.decode(Bool.self) {
      self = .bool(value)
    } else if let value = try? container.decode(Int.self) {
      self = .int(value)
    } else if let value = try? container.decode(Double.self) {
      self = .number(value)
    } else if let value = try? container.decode(String.self) {
      self = .string(value)
    } else if let value = try? container.decode([JSON].self) {
      self = .array(value)
    } else if let value = try? container.decode([String: JSON].self) {
      self = .object(value)
    } else {
      self = .null
    }
  }
  /// The serialized JSON value as byte buffer
  public var serialized: Data? {
    let encoder = JSONEncoder()
    return try? encoder.encode(self)
  }
  /// Deserialize a JSON value from a byte buffer
  public init(serialized: Data) throws {
    let decoder = JSONDecoder()
    self = try decoder.decode(JSON.self, from: serialized)
  }
}

// MARK: Describing JSON
extension JSON: LosslessStringConvertible {
  /// The serialized JSON value as string
  public var description: String {
    guard let data = self.serialized else {return ""}
    guard let str = String(data: data, encoding: .utf8) else {return ""}
    return str
  }
  /// Deserialize a JSON value from a JSON string
  public init?(_ description: String) {
    guard let data = description.data(using: .utf8) else {return nil}
    try? self.init(serialized: data)
  }
}

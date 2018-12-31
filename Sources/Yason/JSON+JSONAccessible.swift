// MARK: Access data
extension JSON: JSONAccessible {
  public var bool: Bool? {
    get {
      guard case .bool(let value) = self else {return nil}
      return value
    }
    set {
      if let value = newValue {
        self = .bool(value)
      } else {
        self = .null
      }
    }
  }
  public var boolValue: Bool {
    get {
      guard case .bool(let value) = self else {return false}
      return value
    }
    set {
      self = .bool(newValue)
    }
  }
  public var int: Int? {
    get {
      guard case .int(let value) = self else {return nil}
      return value
    }
    set {
      if let value = newValue {
        self = .int(value)
      } else {
        self = .null
      }
    }
  }
  public var intValue: Int {
    get {
      guard case .int(let value) = self else {return 0}
      return value
    }
    set {
      self = .int(newValue)
    }
  }
  public var number: Double? {
    get {
      guard case .number(let value) = self else {return nil}
      return value
    }
    set {
      if let value = newValue {
        self = .number(value)
      } else {
        self = .null
      }
    }
  }
  public var numberValue: Double {
    get {
      guard case .number(let value) = self else {return 0}
      return value
    }
    set {
      self = .number(newValue)
    }
  }
  public var string: String? {
    get {
      guard case .string(let value) = self else {return nil}
      return value
    }
    set {
      if let value = newValue {
        self = .string(value)
      } else {
        self = .null
      }
    }
  }
  public var stringValue: String {
    get {
      guard case .string(let value) = self else {return ""}
      return value
    }
    set {
      self = .string(newValue)
    }
  }
  public var array: [JSON]? {
    get {
      guard case .array(let value) = self else {return nil}
      return value
    }
    set {
    if let value = newValue {
    self = .array(value)
    } else {
    self = .null
    }
    }
  }
  public var arrayValue: [JSON] {
    get {
      guard case .array(let value) = self else {return []}
      return value
    }
    set {
      self = .array(newValue)
    }
  }
  public var object: [String: JSON]? {
    get {
      guard case .object(let value) = self else {return nil}
      return value
    }
    set {
      if let value = newValue {
        self = .object(value)
      } else {
        self = .null
      }
    }
  }
  public var objectValue: [String: JSON] {
    get {
      guard case .object(let value) = self else {return [:]}
      return value
    }
    set {
      self = .object(newValue)
    }
  }
  public var isNull: Bool {
    guard case .null = self else {return false}
    return true
  }
  public subscript(_ index: Int) -> JSON {
    get {return arrayValue[index]}
    set {
      guard case .array(var value) = self else {return}
      value[index] = newValue
      self = .array(value)
    }
  }
  public subscript(_ key: String) -> JSON? {
    get {return objectValue[key]}
    set {
      guard case .object(var value) = self else {return}
      value[key] = newValue
      self = .object(value)
    }
  }
}

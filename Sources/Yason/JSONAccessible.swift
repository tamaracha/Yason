/// Access data in JSON values
public protocol JSONAccessible {
  /// Access the JSON value as optional bool
  var bool: Bool? {get set}
  /// Access the JSON value as bool
  var boolValue: Bool {get set}
  /// Access the JSON value as optional integer
  var int: Int? {get set}
  /// Access the JSON value as integer
  var intValue: Int {get set}
  /// Access the JSON value as optional double
  var number: Double? {get set}
  /// Access the JSON value as double
  var numberValue: Double {get set}
  /// Access the JSON value as optional string
  var string: String? {get set}
  /// Access the JSON value as string
  var stringValue: String {get set}
  /// Access the JSON value as optional array
  var array: [Self]? {get set}
  /// Access the JSON value as array
  var arrayValue: [Self] {get set}
  /// Access the JSON value as optional dictionary
  var object: [String: Self]? {get set}
  /// Access the JSON value as dictionary
  var objectValue: [String: Self] {get set}
  /// Check if the JSON is a null value
  var isNull: Bool {get}
  /// Access an entry by key, if the JSON value represents an object
  subscript(_ key: String) -> Self? {get set}
  /// Access an element by index, if the JSON value represents an array
  subscript(_ index: Int) -> Self {get set}
}

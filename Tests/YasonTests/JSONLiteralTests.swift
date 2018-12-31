import XCTest
@testable import Yason

class JSONLiteralTests: XCTestCase {
  func testNilLiteral() {
    let json: JSON = nil
    XCTAssertEqual(json, .null)
  }
  func testBoolLiteral() {
    let value1: JSON = true
    let value2: JSON = false
    XCTAssertEqual(value1.bool, true)
    XCTAssertEqual(value2.bool, false)
  }
  func testIntLiteral() {
    let value1: JSON = 5
    let value2: JSON = -5
    XCTAssertEqual(value1.int, 5)
    XCTAssertEqual(value2.int, -5)
  }
  func testFloatLiteral() {
    let value1: JSON = 4.5
    let value2: JSON = -4.5
    XCTAssertEqual(value1.number, 4.5)
    XCTAssertEqual(value2.number, -4.5)
  }
  func testStringLiteral() {
    let value1: JSON = "xyz"
    let value2: JSON = ""
    XCTAssertEqual(value1.string, "xyz")
    XCTAssertEqual(value2.string, "")
  }
  func testArrayLiteral() {
    let json: JSON = [1, 2, 3]
    let json2: JSON = [true, false, true]
    XCTAssertEqual(json.array, [.int(1), .int(2), .int(3)])
    XCTAssertEqual(json2.array, [.bool(true), .bool(false), .bool(true)])
  }
  func testNestedArrayLiteral() {
    let json: JSON = [[1, 2], [3, 4]]
    XCTAssertEqual(json.array, [.array([.int(1), .int(2)]), .array([.int(3), .int(4)])])
  }
  func testObjectLiteral() {
    let json: JSON = [
      "x": 1,
      "y": true,
      "z": nil
    ]
    XCTAssertEqual(
      json.object,
      [
        "x": .int(1),
        "y": .bool(true),
        "z": .null
        ]
    )
  }
  func testNestedObjectLiteral() {
    let json: JSON = [
      "a": [1, 2, 3],
      "o": ["x": true, "y": 0]
    ]
    XCTAssertEqual(
      json.object,
      [
        "a": .array([.int(1), .int(2), .int(3)]),
        "o": .object(["x": .bool(true), "y": .int(0)])
      ]
    )
  }
}

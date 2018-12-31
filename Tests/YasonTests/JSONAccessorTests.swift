import XCTest
@testable import Yason

class JSONAccessorTests: XCTestCase {
  func testGetOptionalBool() {
    let json = JSON.bool(true)
    XCTAssertEqual(json.bool, true)
    XCTAssertNotNil(json.bool)
  }
  func testGetNonOptionalBool() {
    XCTAssertTrue(JSON.bool(true).boolValue)
  }
  func testSetBool() {
    var json = JSON.bool(false)
    json.bool = true
    XCTAssertEqual(json.bool, true)
    json.bool = nil
    XCTAssert(json.isNull)
  }
  func testGetOptionalInt() {
    let json = JSON.int(42)
    XCTAssertEqual(json.int, 42)
    XCTAssertNotNil(json.int)
  }
  func testGetNonOptionalInt() {
    XCTAssertEqual(JSON.int(42).intValue, 42)
  }
  func testSetInt() {
    var json = JSON.int(42)
    json.int = 666
    XCTAssertEqual(json.int, 666)
    json.int = nil
    XCTAssert(json.isNull)
  }
  func testGetOptionalDouble() {
    let json = JSON.number(2.4)
    XCTAssertEqual(json.number, 2.4)
    XCTAssertNotNil(json.number)
  }
  func testGetNonOptionalDouble() {
    XCTAssertEqual(JSON.number(2.4).numberValue, 2.4)
  }
  func testSetNumber() {
    var json = JSON.number(42)
    json.number = 666
    XCTAssertEqual(json.number, 666)
    json.number = nil
    XCTAssert(json.isNull)
  }
  func testGetOptionalString() {
    let json = JSON.string("abc")
    XCTAssertEqual(json.string, "abc")
  }
  func testGetNonOptionalString() {
    XCTAssertEqual(JSON.string("xyz").stringValue, "xyz")
  }
  func testSetString() {
    var json = JSON.string("abc")
    json.string = "xyz"
    XCTAssertEqual(json.string, "xyz")
    json.string = nil
    XCTAssert(json.isNull)
  }
  func testGetWrongOptionalValue() {
    XCTAssert(JSON.null.isNull)
    XCTAssertNil(JSON.null.bool)
    XCTAssertNil(JSON.null.int)
    XCTAssertNil(JSON.null.number)
    XCTAssertNil(JSON.null.string)
    XCTAssertNil(JSON.null.array)
    XCTAssertNil(JSON.null.object)
  }
  func testGetWrongNonOptionalValue() {
    XCTAssertEqual(JSON.null.boolValue, false)
    XCTAssertEqual(JSON.null.intValue, 0)
    XCTAssertEqual(JSON.null.numberValue, 0)
    XCTAssertEqual(JSON.null.stringValue, "")
    XCTAssertEqual(JSON.null.arrayValue, [])
    XCTAssertEqual(JSON.null.objectValue, [:])
  }
  func testGetArraySubscript() {
    let json: JSON = [7, 13, 42, 666]
    XCTAssertEqual(json[1], 13)
  }
  func testSetArraySubscript() {
    var json: JSON = [7, 13, 42]
    XCTAssertEqual(json[2], 42)
    json[2] = 666
    XCTAssertEqual(json[2], 666)
  }
  func testGetObjectSubscript() {
    let json: JSON = ["x": 7, "y": 13, "z": 42]
    XCTAssertEqual(json["z"], 42)
    XCTAssertNil(json["a"])
  }
  func testSetObjectSubscript() {
    var json: JSON = ["x": 7, "y": 13, "z": 42]
    XCTAssertEqual(json["z"], 42)
    json["z"] = 666
    XCTAssertEqual(json["z"], 666)
  }
}

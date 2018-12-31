import XCTest
@testable import Yason

class JSONCodableTests: XCTestCase {
  struct Point: Hashable, Codable {
    // swiftlint:disable:next identifier_name
    let (x, y): (Int, Int)
  }
  func testEncodable() {
    let json: JSON = ["x": 0, "y": 0]
    let point = Point(x: 0, y: 0)
    let encoder = JSONEncoder()
    do {
      let jsonData = try encoder.encode(json)
      let newPoint = try JSONDecoder().decode(Point.self, from: jsonData)
      XCTAssertEqual(point, newPoint)
    } catch {
      print(error)
    }
  }
  func testDecodable() {
    let json: JSON = ["x": 0, "y": 0]
    let point = Point(x: 0, y: 0)
    let encoder = JSONEncoder()
    do {
      let pointData = try encoder.encode(point)
      let deserialized = try JSON(serialized: pointData)
      XCTAssertEqual(json, deserialized)
    } catch {
      print(error)
    }
  }
  func testLosslessStringConvertible() {
    let json: JSON = ["x": 0, "y": 0]
    let description = json.description
    XCTAssertEqual(json, JSON(description))
  }
}

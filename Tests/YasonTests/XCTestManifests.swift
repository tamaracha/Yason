import XCTest

// swiftlint:disable identifier_name trailing_comma
extension JSONAccessorTests {
    static let __allTests = [
        ("testGetArraySubscript", testGetArraySubscript),
        ("testGetNonOptionalBool", testGetNonOptionalBool),
        ("testGetNonOptionalDouble", testGetNonOptionalDouble),
        ("testGetNonOptionalInt", testGetNonOptionalInt),
        ("testGetNonOptionalString", testGetNonOptionalString),
        ("testGetObjectSubscript", testGetObjectSubscript),
        ("testGetOptionalBool", testGetOptionalBool),
        ("testGetOptionalDouble", testGetOptionalDouble),
        ("testGetOptionalInt", testGetOptionalInt),
        ("testGetOptionalString", testGetOptionalString),
        ("testGetWrongNonOptionalValue", testGetWrongNonOptionalValue),
        ("testGetWrongOptionalValue", testGetWrongOptionalValue),
        ("testSetArraySubscript", testSetArraySubscript),
        ("testSetBool", testSetBool),
        ("testSetInt", testSetInt),
        ("testSetNumber", testSetNumber),
        ("testSetObjectSubscript", testSetObjectSubscript),
        ("testSetString", testSetString),
    ]
}

extension JSONCodableTests {
    static let __allTests = [
        ("testDecodable", testDecodable),
        ("testEncodable", testEncodable),
        ("testLosslessStringConvertible", testLosslessStringConvertible),
    ]
}

extension JSONLiteralTests {
    static let __allTests = [
        ("testArrayLiteral", testArrayLiteral),
        ("testBoolLiteral", testBoolLiteral),
        ("testFloatLiteral", testFloatLiteral),
        ("testIntLiteral", testIntLiteral),
        ("testNestedArrayLiteral", testNestedArrayLiteral),
        ("testNestedObjectLiteral", testNestedObjectLiteral),
        ("testNilLiteral", testNilLiteral),
        ("testObjectLiteral", testObjectLiteral),
        ("testStringLiteral", testStringLiteral),
    ]
}

#if !os(macOS)
public func __allTests() -> [XCTestCaseEntry] {
    return [
        testCase(JSONAccessorTests.__allTests),
        testCase(JSONCodableTests.__allTests),
        testCase(JSONLiteralTests.__allTests),
    ]
}
#endif

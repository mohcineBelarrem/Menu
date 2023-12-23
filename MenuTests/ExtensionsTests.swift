//
//  ExtensionsTests.swift
//  MenuTests
//
//  Created by Mohcine BELARREM on 23/12/2023.
//

import XCTest
@testable import Menu

final class ExtensionsTests: XCTestCase {

    func test_To_WithDollars_1() {
        let double: Double = 120484.23
        XCTAssertEqual(double.withDollars, "$120484.23")
    }
    
    func test_To_WithDollars_2() {
        let double: Double = 120484
        XCTAssertEqual(double.withDollars, "$120484.00")
    }
    
    func test_To_WithDollars_3() {
        let double: Double = 120484.2
        XCTAssertEqual(double.withDollars, "$120484.20")
    }

    func test_To_WithDollars_4() {
        let double: Double = 120484.23122121212
        XCTAssertEqual(double.withDollars, "$120484.23")
    }
}

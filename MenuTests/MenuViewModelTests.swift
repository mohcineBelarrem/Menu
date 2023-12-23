//
//  MenuTests.swift
//  MenuTests
//
//  Created by Mohcine on 22/12/2023.
//

import XCTest
@testable import Menu

final class MenuViewModelTests: XCTestCase {

    func test_Model_Loads_Data_Well() {
        let viewModel = MenuViewModel()
        XCTAssertEqual(viewModel.availableMenuCatergories.count, 3)
    }

    func test_Number_Of_Items_Per_Category_Is_Good() {
        let viewModel = MenuViewModel()
        XCTAssertEqual(viewModel.items(for: .food).count, 12)
        XCTAssertEqual(viewModel.items(for: .drink).count, 8)
        XCTAssertEqual(viewModel.items(for: .dessert).count, 4)
    }
    
    func testSorting_1() {
        let viewModel = MenuViewModel()
        viewModel.applySortingType(.byPopularity)
        XCTAssertEqual(viewModel.items(for: .food).first?.name, "Harira")
    }
    
    func testSorting_2() {
        let viewModel = MenuViewModel()
        viewModel.applySortingType(.byPrice)
        XCTAssertEqual(viewModel.items(for: .food).last?.name, "Lamb")
    }
    
    func testSorting_3() {
        let viewModel = MenuViewModel()
        viewModel.applySortingType(.alphabetical)
        XCTAssertEqual(viewModel.items(for: .dessert).first?.name, "Briwate")
    }
    
    func testToggleCategory() {
        let viewModel = MenuViewModel()
        viewModel.toggleCategory(.food)
        viewModel.toggleCategory(.dessert)
        viewModel.toggleCategory(.drink)
        XCTAssertTrue(viewModel.availableMenuCatergories.isEmpty)
    }
    
    func testToggleCategory_2() {
        let viewModel = MenuViewModel()
        viewModel.toggleCategory(.food)
        XCTAssertEqual(viewModel.availableMenuCatergories.count, 2)
    }
    
}

//
//  HomeViewViewModel_Tests.swift
//  ListViewSwiftUI_Tests
//
//  Created by Zülfü Akgüneş on 5.02.2024.
//

import XCTest
@testable import ListViewSwiftUI

final class HomeViewViewModel_Tests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_homeviewmodel_postsArrayEmpty() {
        //Given
        
        //When
        let vm = HomeViewModel()
        
        //Then
        XCTAssertTrue(vm.posts.isEmpty)
        XCTAssertEqual(vm.posts.count, 0)
    }
    


}

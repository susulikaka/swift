//
//  SwiftLearnTests.swift
//  SwiftLearnTests
//
//  Created by SupingLi on 16/9/10.
//  Copyright © 2016年 SupingLi. All rights reserved.
//

import XCTest
@testable import SwiftLearn

class SwiftLearnTests: XCTestCase {
    
    
    // MARK: text
    func testMealInit() {
        
        let item = Meal(name: "haha", photo: nil, rating: 5)
        XCTAssertNotNil(item)
        
        let noName = Meal(name: "", photo: nil, rating: 0)
        XCTAssertNil(noName,"empty name is invalid")
        
        let badRating = Meal(name: "bad Rating", photo: nil, rating: -1)
        XCTAssertNil(badRating,"empty name is invalid")
        

    }
    
    
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}

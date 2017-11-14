//
//  SwiftMethodInvokeTest.swift
//  DrafterTests
//
//  Created by LZephyr on 2017/11/13.
//

import XCTest

class SwiftMethodInvokeTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func run(_ input: String) -> [MethodInvokeNode] {
        let tokens = SourceLexer(input: input).allTokens
        guard let result = SwiftInvokeGenParser().parser.run(tokens) else {
            XCTAssert(false)
            return []
        }
        return result
    }
    
    func testInvoke() {
        let invokes = run("self.value.method().add(a: 21, and: a + b)")
        
        XCTAssert(invokes.count == 1)
        XCTAssert(invokes[0].params.count == 2)
    }
}
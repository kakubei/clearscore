//
//  ClearScoreTests.swift
//  ClearScoreTests
//
//  Created by Alex Dearden on 29/05/2019.
//  Copyright © 2019 Alex Dearden. All rights reserved.
//

import XCTest
import Moya
@testable import ClearScore

class ClearScoreTests: XCTestCase {
    
    var requestManager: RequestManaging?
    var scoreDecoder: ScoreDecoding = ScoreDecoder()

    override func setUp() {
        
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testJSONDecodeFromSample() {
        let stubbingProvider = MoyaProvider<CreditScoreAPI>(stubClosure: MoyaProvider.immediatelyStub)
        stubbingProvider.request(.getScore) { result in
            switch result {
            case let .success(response):
                XCTAssertNotNil(response.data)
                let jsonRoot = try! self.scoreDecoder.jsonDecoder.decode(CreditScoreRoot.self, from: response.data)                
                XCTAssertNotNil(jsonRoot)
                
                let creditScore = jsonRoot.creditReportInfo
                XCTAssertNotNil(creditScore)

            case let .failure(error):
                debugPrint("Error getting credit report:", error.localizedDescription)
                XCTFail("Unable to decode CreditScore")
            }
        }
    }

}

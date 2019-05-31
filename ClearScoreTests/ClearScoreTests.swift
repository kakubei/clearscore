//
//  ClearScoreTests.swift
//  ClearScoreTests
//
//  Created by Alex Dearden on 29/05/2019.
//  Copyright © 2019 Alex Dearden. All rights reserved.
//

import XCTest
import Moya
import RxTest
import RxSwift
@testable import ClearScore

class ClearScoreTests: XCTestCase {
    
    var requestManager: RequestManaging?
    var scoreDecoder: ScoreDecoding = ScoreDecoder()
    let viewModel: ScoreViewModeling = MockScoreViewModel()
    
    let disposeBag = DisposeBag()

    func testJSONDecodeFromSample() {
        let stubbingProvider = MoyaProvider<CreditScoreAPI>(stubClosure: MoyaProvider.immediatelyStub)
        stubbingProvider.request(.getScore) { result in
            switch result {
            case let .success(response):
                XCTAssertNotNil(response.data)
                let creditScore = try! self.scoreDecoder.decode(response)
                
                XCTAssertNotNil(creditScore)

            case let .failure(error):
                debugPrint("Error getting credit report:", error.localizedDescription)
                XCTFail("Unable to decode CreditScore")
            }
        }
    }

    func testScoreObservable() {
        let testScheduler = TestScheduler(initialClock: 0)
        let scoreObserver = testScheduler.createObserver(String.self)
        viewModel.creditScore.subscribe(scoreObserver).disposed(by: disposeBag)
        
        testScheduler.start()
        viewModel.fetchScores()
        
        let score = scoreObserver.events.first?.value.element
        XCTAssertNotNil(score)
        XCTAssertEqual(score!, "325")
    }
    
    func testMaxScoreObservable() {
        let testScheduler = TestScheduler(initialClock: 0)
        let maxScoreObserver = testScheduler.createObserver(String.self)
        viewModel.maxScore.subscribe(maxScoreObserver).disposed(by: disposeBag)
        
        testScheduler.start()
        viewModel.fetchScores()
        
        let maxScore = maxScoreObserver.events.first?.value.element
        XCTAssertNotNil(maxScore)
        XCTAssertEqual(maxScore!, "700")
    }
    
    func testPercentageObservable() {
        let testScheduler = TestScheduler(initialClock: 0)
        let percentageObserver = testScheduler.createObserver(Int.self)
        viewModel.scorePercentage.subscribe(percentageObserver).disposed(by: disposeBag)
        
        testScheduler.start()
        viewModel.fetchScores()
        
        let percentage = percentageObserver.events.first?.value.element
        XCTAssertNotNil(percentage)
        XCTAssertEqual(percentage!, 50)
    }
    
    func testApiErrorObservable() {
        let testScheduler = TestScheduler(initialClock: 0)
        let errorObserver = testScheduler.createObserver(Error.self)
        viewModel.apiError.subscribe(errorObserver).disposed(by: disposeBag)
        
        testScheduler.start()
        viewModel.fetchScores()
        
        let error = errorObserver.events.first?.value.element
        XCTAssertNotNil(error)
        let apiError = error as? APIError
        XCTAssertNotNil(apiError)
        XCTAssertEqual(apiError!, APIError.apiError)
    }
}

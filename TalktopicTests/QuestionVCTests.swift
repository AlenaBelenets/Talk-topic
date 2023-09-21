//
//  TalktopicTests.swift
//  TalktopicTests
//
//  Created by Alena Belenets on 14.04.2023.
//

import XCTest
@testable import Talk_topic

final class QuestionVCTests: XCTestCase {

    var sut: QuestionViewController!
    var items: [String] = []

    override func setUp()  {
        super.setUp()
        sut = QuestionViewController()

    }

    override func tearDown()  {
        sut = nil
        super.tearDown()
    }

//    func testPrepareShouldBeReturnResultViewControllerForSegue() {
//        что дано
//        sut.setVolume(to: -1)
//  when
//        let volume = sut.volume
//        then
//        XCTAssert(volume == 0, "Lowest volume should be equal zero"
//        первое это условие которое должно соблюстись, второе это сообщение об ошибке
//    }
//    func testSingleButtonAnswerPressedButtonNotNil() {
//        let button = UIButton()
//        sut.singleButtonAnswerPressed(button)
//        XCTAssertNil(button)
//
//    }

//    func testRangedButtonAnswerPressedAndAppendedAnswer() {
//        sut.rangedButtonAnswerPressed()
//
//        let buttonIndex = button
//
//        XCTAssertNotNil(buttonIndex)
//
//    }

    func testPerformanceExample()  {
        measure {

        }
    }



}

//
//  MainWindowBuilderTest.swift
//  Area51
//
//  Created by Alex Garrefa on 21/02/2019.
//


import XCTest
@testable import Area51

class MainWindowBuilderTest: XCTestCase {
    var sut: MainWindowBuilder!

    override func setUp() {
        sut = MainWindowBuilder()
    }

    override func tearDown() {
        sut = nil
    }

    func testCreateAppWindow() {
        _ = sut.createAppWindow()
        XCTAssertNotNil(sut.window)
    }

    func testSetAppRootViewController() {
        _ = sut
            .createAppWindow()
            .setAppRootViewController(SomeViewController())

        AssertType(
            of: sut.window?.rootViewController,
            is: SomeViewController.self)
    }

    func testMakeKeyAndVisible() {
        _ = sut
            .createAppWindow()
            .setAppRootViewController(SomeViewController())
            .makeKeyAndVisible()

        XCTAssertTrue(sut.window?.isKeyWindow ?? false)
    }
}

private class SomeViewController: UIViewController {}

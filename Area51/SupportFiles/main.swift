//
//  main.swift
//  Area51
//
//  Created by Alex Garrefa on 21/02/2019.
//


import UIKit

let isRunningTests = NSClassFromString("XCTestCase") != nil

let appDelegateClass = isRunningTests ? TestAppDelegate.self : AppDelegate.self

_ = UIApplicationMain(
    CommandLine.argc,
    CommandLine.unsafeArgv,
    nil,
    NSStringFromClass(appDelegateClass))

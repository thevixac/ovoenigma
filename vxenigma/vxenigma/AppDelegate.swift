//
//  AppDelegate.swift
//  vxenigma
//
//  Created by vic on 09/05/2018.
//  Copyright © 2018 vixac. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var receiver: MessageReceiver?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        //Here we showcase that the VxEnigmaMachine can successfuly encrypt a message and another VxEnigmaMachine can successfully decrypt it back into the original message.
        
        //receiver = GibberishMessageReciever(url: URL(string: "http://www.randomtext.me/download/txt/gibberish/p-1/10-20")!)
        
        receiver = OfflineMessageReciever()
        receiver?.requestMessage { message, error in
            if let error = error {
                print("Error receiving message: \(error)")
            }
            guard let message = message else {
                print("Failed to receive message.")
                return
            }
            let enigma = VxEnigmaMachine()
            let inputMessage = VxEnigmaMachine.clean(message: message)
            print("Message to encrypt is \(inputMessage).")
            let encrypted = enigma.encrypt(message: inputMessage)
            print("Encrypted message is '\(encrypted)'.")
            let secondEnigma = VxEnigmaMachine()
            let decrypted = secondEnigma.encrypt(message: encrypted)
            print("Decrypted message is \(decrypted).")
            
            if inputMessage == decrypted {
                print("Message encryped and decrypted successfully!")
            }
            else {
                print("Message transmission failure!")
            }
        }
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}


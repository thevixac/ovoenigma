//
//  MessageReciever.swift
//  OvoEnigma
//
//  Created by vic on 19/09/2016.
//  Copyright © 2016 vic. All rights reserved.
//

import Foundation

/**
 Simplest Message Reciever. No error handling, no connection checking,
 no stream of messages. Simply takes a URL and tries to return a string version of the response if it can. Sufficient for the purposes of this demo.
 */
struct MessageReciever {
    var messageCb: ((String) -> Void)
    var url: URL
    
    init(url: URL, cb: @escaping ((String) -> Void)) {
        self.url = url
        self.messageCb = cb
    }
    
    func requestMessage() {
        let task = URLSession.shared.dataTask(with: self.url) {(data, response, error) in
            guard let d = data, error == nil else {
                print("Message reciever failed to get message from \(self.url.absoluteString)")
                return
            }
            guard let message = String(data: d, encoding: String.Encoding.utf8) else {
                print("Message reciever failed to parse data into a message.")
                return
            }
            self.messageCb(message)
        }
        task.resume()
    }
}

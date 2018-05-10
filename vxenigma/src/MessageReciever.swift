//
//  MessageReciever.swift
//  VxEnigma
//
//  Created by vic on 19/09/2016.
//  Copyright © 2016 vic. All rights reserved.
//

import Foundation


enum MessageReceiverError: Error {
    case parsingError
}

protocol MessageReceiver {
    func requestMessage(callback: @escaping ((String?, Error?) -> Void))
}

struct OfflineMessageReciever: MessageReceiver {
    func requestMessage(callback: @escaping ((String?, Error?) -> Void))
    {
        let seedWords: [String] =  ["here", "are", "some", "words", "to", "send", "randomly"]
        var output: String = ""
        let range = UInt32(seedWords.count)
        
        for _ in 1...5 {
            output += (seedWords[Int(arc4random_uniform(range))])
        }
        callback(output, nil)
    }
}
/**
 Simplest of Message Recievers. No error handling, no connection checking,
 no stream of messages. Simply takes a URL and tries to return a string version of the response if it can. Sufficient for the purposes of this demo.
 */
struct GibberishMessageReciever: MessageReceiver {
    let url: URL
    init(url: URL) {
        self.url = url
    }
    func requestMessage(callback: @escaping ((String?, Error?) -> Void)) {
        let url = self.url
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let d = data, error == nil else {
                print("Message reciever failed to get message from \(url.absoluteString)")
                callback(nil, error)
                return
            }
            guard let message = String(data: d, encoding: String.Encoding.utf8) else {
                print("Message reciever failed to parse data into a message.")
                callback(nil, MessageReceiverError.parsingError)
                return
            }
            callback(message, nil)
        }
        task.resume()
    }
}

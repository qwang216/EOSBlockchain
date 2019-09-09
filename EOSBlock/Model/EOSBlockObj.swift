//
//  EOSBlockObjc.swift
//  EOSBlock
//
//  Created by Jason wang on 9/8/19.
//  Copyright © 2019 Jason Wang. All rights reserved.
//

import Foundation

typealias JSON = [String: Any]

enum SerializationError: Error {
    case missing(String)
}

struct EOSBlockObj {
    let producer: String
    let producerSignature: String
    let totalTransaction: Int
    var json: JSON

    init(producer: String, signature: String, totalTxn: Int, json: JSON) {
        self.producer = producer
        self.producerSignature = signature
        self.totalTransaction = totalTxn
        self.json = json
    }

    init(json: JSON) throws {
        guard let producer = json["producer"] as? String else {
            throw SerializationError.missing("producer")
        }
        guard let signature = json["producer_signature"] as? String else {
            throw SerializationError.missing("Producer Signature")
        }
        guard let transactions = json["transactions"] as? [[String: Any]] else {
            throw SerializationError.missing("Transactions")
        }

        self.init(producer: producer, signature: signature, totalTxn: transactions.count, json: json)
    }
}

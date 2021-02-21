//
//  ItemDetail.swift
//  saltside
//
//  Created by Siddhesh Redkar on 21/02/21.
//  Copyright © 2021 Siddhesh Redkar. All rights reserved.
//

import Foundation

// MARK: - ItemDetail
struct ItemDetail: Codable {
    let image: String?
    let description, title: String?

    enum CodingKeys: String, CodingKey {
        case image
        case description = "description"
        case title
    }
}

typealias ItemDetailList = [ItemDetail]

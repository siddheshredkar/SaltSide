//
//  ItemDetailViewModel.swift
//  saltside
//
//  Created by Siddhesh Redkar on 21/02/21.
//  Copyright © 2021 Siddhesh Redkar. All rights reserved.
//

import Foundation
import UIKit

struct ItemDetailViewModel {
    
    let title: String
    let detailTextString: String
    let imageUrl:String
    
    // Dependency Injection (DI)
    init(item: ItemDetail) {
        
        if let title = item.title{
            let trimmedtitle = title.trimmingCharacters(in: .whitespaces)
            self.title = trimmedtitle
         }else{
             self.title =  ""
         }
        
        self.imageUrl = item.image ?? ""
        
        if let discription = item.description{
           let trimmeddiscription = discription.trimmingCharacters(in: .whitespaces)
           self.detailTextString = trimmeddiscription
        }else{
            self.detailTextString = ""
        }

    }
    
}


typealias ItemDetailViewModelList = [ItemDetailViewModel]

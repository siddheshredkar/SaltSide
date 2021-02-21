//
//  Urls.swift
//  saltside
//
//  Created by Siddhesh Redkar on 21/02/21.
//  Copyright © 2021 Siddhesh Redkar. All rights reserved.
//

import Foundation


//MARK:Prod
//var baseURL = ""

//MARK:Stage
var baseURL = "https://gist.githubusercontent.com"

//MARK:Local
//var baseURL = ""



//MARK:Onboard

func getItemListUrl() -> String {
    return baseURL + "/ashwini9241/6e0f26312ddc1e502e9d280806eed8bc/raw/7fab0cf3177f17ec4acd6a2092fc7c0f6bba9e1f/saltside-json-data";
}


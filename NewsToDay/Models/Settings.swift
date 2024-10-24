//
//  Settings.swift
//  NewsToDay
//
//  Created by Катя on 24.10.2024.
//

import UIKit


enum Language: String, CaseIterable {
    case English
    case Russian
}

struct Settings {
    let language: Language
}

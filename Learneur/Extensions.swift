//
//  Extensions.swift
//  Learneur
//
//  Created by Piter Wongso on 25/07/22.
//

import Foundation
import SwiftUI




extension Color {
    static func rgb (r: Double, g: Double, b: Double) -> Color{
        return Color(red: r/255, green: g/255, blue: b/255)
    }
    static let learneurBlue = Color.rgb(r: 176, g: 226, b: 255)
    static let learneurGreen = Color.rgb(r: 165, g: 255, b: 196)
    static let learneurPeach = Color.rgb(r: 255, g: 222, b: 181)
    static let learneurRed = Color.rgb(r: 255, g: 175, b: 185)
    static let learneurYellow = Color.rgb(r: 255, g: 255, b: 177)
    static let learneurGrey = Color.rgb(r: 232, g: 230, b: 227)

}



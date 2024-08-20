//
//  Extension.swift
//  MeaMemoria
//
//  Created by Hassan Alkhafaji on 6/25/24.
//

import SwiftUI


extension Font {
   static var fontLarge: Font {
        return (Font.custom("Mangabey", size: 48))
    }
    static var fontMedium: Font {
         return (Font.custom("Mangabey", size: 36))
     }
    static var fontSmall: Font {
         return (Font.custom("Mangabey", size: 24))
     }
}

extension Color {
    static var customBrown: Color {
        return Color("darkBrown")
    }
    static var customWhite: Color {
        return Color("offWhite")
    }
}

extension Date {
    func toString(dateFormat format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}


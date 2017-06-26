//
//  ButtonLayout.swift
//  Music-iOS
//
//  
//
import UIKit

public struct ButtonLayout {
    struct Flat {
        static let width: CGFloat = 200
        static let height: CGFloat = 44
        static let offsetY: CGFloat = -150
    }
    
    struct Raised {
        static let width: CGFloat = 200
        static let height: CGFloat = 44
        static let offsetY: CGFloat = -75
    }
    
    struct Fab {
        static let diameter: CGFloat = 48
    }
    
    struct Icon {
        static let width: CGFloat = 120
        static let height: CGFloat = 48
        static let offsetY: CGFloat = 75
    }
}

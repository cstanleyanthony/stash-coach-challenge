// Created by Christian Sarcona on 12/8/20 for Stash
// Stash Coach challenge
// 
	

import UIKit

struct Constants {
    
    enum Colors {
        
        case progressGreen,
             navigationPurple
        
        func color() -> UIColor {
            switch self {
            case .progressGreen:
                return makeRGBColor(red: 114, green: 202, blue: 92, alpha: 1.0)
                
            case .navigationPurple:
                return makeRGBColor(red: 105, green: 55, blue: 206, alpha: 1.0)
            }
        }
        
        private func makeRGBColor(red: CGFloat,
                                  green: CGFloat,
                                  blue: CGFloat,
                                  alpha: CGFloat) -> UIColor {
            return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: alpha)
        }
    }
}

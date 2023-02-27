//Made by Kazakov Danil
//USA Sport Challenge in 2023

import UIKit

extension String
{
    var underLined: NSAttributedString {
        NSMutableAttributedString(
            string: self,
            attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue]
        )
    }
    
}


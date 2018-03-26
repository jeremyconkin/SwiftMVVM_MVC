//
//  OwlImageIdentifierExtensions.swift
//  lowlShared
//
//  Created by Jeremy Conkin on 3/25/18.
//  Copyright © 2018 Jeremy Conkin. All rights reserved.
//

import lowlCore

extension OwlImageIdentifier {
    
    /// Image corresponding to the image identifier
    public var detailImage: UIImage {
        
        return {
            switch self {
            case .owl1:
                return #imageLiteral(resourceName: "owl1")
            case .owl2:
                return #imageLiteral(resourceName: "owl2")
            case .owl3:
                return #imageLiteral(resourceName: "owl3")
            case .owl4:
                return #imageLiteral(resourceName: "owl4")
            case .owl5:
                return #imageLiteral(resourceName: "owl5")
            case .owl6:
                return #imageLiteral(resourceName: "owl6")
            case .owl7:
                return #imageLiteral(resourceName: "owl7")
            case .owl8:
                return #imageLiteral(resourceName: "owl8")
            case .owl9:
                return #imageLiteral(resourceName: "owl9")
            }
            }()
        
    }
}

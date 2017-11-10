
//
//  HomeDatasourceVController.swift
//  Chatter
//
//  Created by macuser1 on 09/11/2017.
//  Copyright © 2017 Neptune. All rights reserved.
//

import LBTAComponents

class HomeDatasourceVController: DatasourceController {
    let homeDataSource = HomeDataSource()
    override func viewDidLoad() {
        super.viewDidLoad()
        datasource = homeDataSource
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if let user = self.datasource?.item(indexPath) as? User {
            let estimatedWidthOfDisplayText = self.view.frame.width   // view padding
            let size = CGSize(width: estimatedWidthOfDisplayText, height: 1000)
            let attributes = [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 15)]
            
            let estimatedFrame = NSString(string: user.displayText).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
            
            return CGSize(width: view.frame.width, height: estimatedFrame.height + 52)
        }
        return CGSize(width: view.frame.width, height: 200)
    }
    
}

extension HomeDatasourceVController {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 50)
    }
}

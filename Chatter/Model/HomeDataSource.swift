//
//  DataSource.swift
//  Chatter
//
//  Created by macuser1 on 09/11/2017.
//  Copyright © 2017 Neptune. All rights reserved.
//

import LBTAComponents

class HomeDataSource: Datasource {
    
    var names = ["Sam", "Tobius", "Gertrude", "Nopi", "Carol"]
    
    override func item(_ indexPath: IndexPath) -> Any? {
        return names[indexPath.item]
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        return names.count
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [UserCell.self]
    }
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [HeaderCell.self]
    }
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        return [FooterCell.self]
    }
    
    
}

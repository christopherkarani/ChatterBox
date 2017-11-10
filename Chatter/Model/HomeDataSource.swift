//
//  DataSource.swift
//  Chatter
//
//  Created by macuser1 on 09/11/2017.
//  Copyright © 2017 Neptune. All rights reserved.
//

import LBTAComponents

class HomeDataSource: Datasource {
    var users : [User] = {
        var chris = User(userName: "@chrisK🔥", displayName:"Christopher Karani", displayText: "Coming together is a beginning, staying together is progress, and working together is success. Semi-Pro Footballer by day. Apple Developer by night. ", profileImage: #imageLiteral(resourceName: "chris"))
        var elonMusk = User(userName: "@elonMusk", displayName: "Elon Musk", displayText: "Tesla, SpaceX, OpenAI & Neuralink. South African entrepreneur Elon Musk is known for founding Tesla Motors and SpaceX, which launched a landmark commercial spacecraft in 2012.", profileImage: #imageLiteral(resourceName: "elonmusk"))
        var elenDegeneres = User(userName: "@TheElenShow", displayName: "Ellen DeGeneres", displayText: "Comedian, talk show host and ice road trucker. My tweets are real, and they’re spectacular.", profileImage: #imageLiteral(resourceName: "EllenD"))
        var bilGates = User(userName: "@BillGates", displayName: "Bill Gates", displayText: "Sharing things I'm learning through my foundation work and other interests...", profileImage: #imageLiteral(resourceName: "BillGates"))
        return [chris, elonMusk, elenDegeneres, bilGates]
    }()
    
    
    override func item(_ indexPath: IndexPath) -> Any? {
        return users[indexPath.item]
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        return users.count
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
